import {Component, OnInit} from '@angular/core';
import {TokenStorageService} from '../service/token-storage.service';
import {ShareService} from '../service/share.service';
import {Category} from '../model/category';
import {CategoryService} from '../service/category.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  username: string;
  idPatient: number;
  currentUser: string;
  role: string;
  isLoggedIn = false;
  category: Category[] = [];

  constructor(private tokenStorageService: TokenStorageService,
              private shareService: ShareService,
              private categoryService: CategoryService,
              private router: Router) {
    this.shareService.getClickEvent().subscribe(() => {
      this.loadHeader();
    });
  }

  getCategory(): void {
    this.categoryService.getAll().subscribe(category => {
      this.category = category;
    });
  }

  ngOnInit(): void {
    this.loadHeader();
    this.getCategory();
  }

  loadHeader(): void {
    if (this.tokenStorageService.getToken()) {
      this.currentUser = this.tokenStorageService.getUser().username;
      this.role = this.tokenStorageService.getUser().roles[0];
      this.username = this.tokenStorageService.getUser().username;
    }
    this.isLoggedIn = this.username != null;
  }

  logOut() {
    this.tokenStorageService.signOut();
  }

  getCategoryBook(id: number) {
    this.router.navigateByUrl(`categoryBooks/` + id + `/`);
  }
}
