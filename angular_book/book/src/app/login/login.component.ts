import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {TokenStorageService} from '../service/token-storage.service';
import {AuthService} from '../service/auth.service';
import {ActivatedRoute, Router} from '@angular/router';
import {ToastrService} from 'ngx-toastr';
import {ShareService} from '../service/share.service';
import {CookieService} from 'ngx-cookie-service';
import {FacebookLoginProvider, GoogleLoginProvider, SocialAuthService, SocialUser} from 'angularx-social-login';
import {AppUser} from '../model/app-user';
import {formatDate} from '@angular/common';
import {BooksService} from '../service/books.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  // formGroup: FormGroup;
  roles: string[] = [];
  username: string;
  returnUrl: string;
  socialUser: SocialUser;
  loggedIn: boolean;

  constructor(private formBuild: FormBuilder,
              private tokenStorageService: TokenStorageService,
              private authService: AuthService,
              private router: Router,
              private route: ActivatedRoute,
              private toastr: ToastrService,
              private shareService: ShareService,
              private cookieService: CookieService,
              private socialAuthService: SocialAuthService,
              private booksService: BooksService) {
  }

  formGroup = this.formBuild.group({
      username: [''],
      password: [''],
      remember_me: ['']
    }
  );

  ngOnInit(): void {
    this.returnUrl = this.route.snapshot.queryParams.returnUrl || '';
    if (this.tokenStorageService.getToken()) {
      this.authService.isLoggedIn = true;
      this.roles = this.tokenStorageService.getUser().roles;
      this.username = this.tokenStorageService.getUser().username;
    }

    this.formGroup = this.formBuild.group({
        username: [''],
        password: [''],
        remember_me: ['']
      }
    );
  }

  onSubmit() {
    this.authService.login(this.formGroup.value).subscribe(data => {
      if (this.formGroup.value.remember_me === true) {
        this.tokenStorageService.saveTokenLocal(data.token);
        this.tokenStorageService.saveUserLocal(data);
      } else {
        this.tokenStorageService.saveTokenSession(data.token);
        this.tokenStorageService.saveUserSession(data);
      }

      this.authService.isLoggedIn = true;
      this.username = this.tokenStorageService.getUser().username;
      this.roles = this.tokenStorageService.getUser().roles;
      this.formGroup.reset();
      this.router.navigateByUrl(this.returnUrl);
      this.toastr.success('Đăng nhập thành công', 'Đăng nhập: ', {
        timeOut: 3000,
        extendedTimeOut: 1500
      });
      this.shareService.sendClickEvent();
    }, err => {
      this.authService.isLoggedIn = false;
      this.toastr.error('Sai tên đăng nhập hoặc mật khẩu hoặc tài khoản chưa được kích hoạt', 'Đăng nhập thất bại: ', {
        timeOut: 3000,
        extendedTimeOut: 1500
      });
    });
  }

  signInWithGoogle(): void {
    this.socialAuthService.signIn(GoogleLoginProvider.PROVIDER_ID);
    this.socialAuthService.authState.subscribe((data) => {
      this.socialUser = data;
      this.loggedIn = (data != null);
      console.log(this.socialUser);
      const user: AppUser = {
        isDeleted: false,
        creationDate: this.getCurrenDay(),
        email: this.socialUser.email,
        username: this.socialUser.email,
        password: this.socialUser.id
      };
      this.booksService.createUser(user).subscribe(value => {
        this.formGroup = this.formBuild.group({
            username: [user.username],
            password: [user.password],
            remember_me: ['']
          }
        );
        this.onSubmit();
      });
    });
  }

  signInWithFB(): void {
    this.socialAuthService.signIn(FacebookLoginProvider.PROVIDER_ID);
    this.socialAuthService.authState.subscribe((data) => {
      this.socialUser = data;
      this.loggedIn = (data != null);
      console.log(this.socialUser);
      const user: AppUser = {
        isDeleted: false,
        creationDate: this.getCurrenDay(),
        email: this.socialUser.email,
        username: this.socialUser.email,
        password: this.socialUser.id
      };
      this.booksService.createUser(user).subscribe(value => {
        this.formGroup = this.formBuild.group({
            username: [user.username],
            password: [user.password],
            remember_me: ['']
          }
        );
        this.onSubmit();

      });
    });
  }

  getCurrenDay(): string {
    return formatDate(new Date(), 'yyyy-MM-dd', 'en-US');
  }

  signOut(): void {
    this.socialAuthService.signOut();
  }

  refreshToken(): void {
    this.socialAuthService.refreshAuthToken(GoogleLoginProvider.PROVIDER_ID);
  }
}
