import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {BooksService} from '../../service/books.service';
import {CategoryService} from '../../service/category.service';
import {DiscountService} from '../../service/discount.service';
import {AngularFireStorage} from '@angular/fire/storage';
import {ToastrService} from 'ngx-toastr';
import {Router} from '@angular/router';
import {Title} from '@angular/platform-browser';
import {formatDate} from '@angular/common';
import {Category} from '../../model/category';
import {Discount} from '../../model/discount';
import {Books} from '../../model/books';
import {finalize} from 'rxjs/operators';
import {TokenStorageService} from '../../service/token-storage.service';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateComponent implements OnInit {
  selectedImage: File = null;
  checkImgSize = false;
  regexImageUrl = false;
  editImageState = false;
  checkImg: boolean;
  url: any;
  msg = '';
  loader = true;
  loadImage = true;
  isExitsCode = false;
  categories: Category[] = [];
  discounts: Discount[] = [];
  currentUser: string;
  role: string;
  isLoggedIn = false;
  username: string;

  bookForm: FormGroup = new FormGroup({
    id: new FormControl('', [Validators.required]),
    code: new FormControl('', [Validators.required]),
    author: new FormControl('', [Validators.required]),
    description: new FormControl('', [Validators.required]),
    dimension: new FormControl('', [Validators.required]),
    image: new FormControl('', [Validators.required]),
    name: new FormControl('', [Validators.required]),
    price: new FormControl('', [Validators.required]),
    publisher: new FormControl('', [Validators.required]),
    quantity: new FormControl('', [Validators.required]),
    releaseDate: new FormControl('', [Validators.required]),
    totalPages: new FormControl('', [Validators.required]),
    translator: new FormControl('', [Validators.required]),
    category: new FormControl('', [Validators.required]),
    discount: new FormControl('', [Validators.required])
  });

  constructor(private bookService: BooksService,
              private categoryService: CategoryService,
              private discountService: DiscountService,
              private storage: AngularFireStorage,
              private toast: ToastrService,
              private router: Router,
              private title: Title,
              private tokenStorageService: TokenStorageService) {
    this.title.setTitle('Thêm Mới Sách');
  }

  getCurrentDateTime(): string {
    return formatDate(new Date(), 'yyyy-MM-dd hh:mm:ss', 'en-US');
  }

  ngOnInit(): void {
    this.getCategory();
    this.getDiscount();
  }

  getCategory(): void {
    this.categoryService.getAll().subscribe(category => {
      this.categories = category;
    });
  }

  getDiscount(): void {
    this.discountService.getAll().subscribe(discount => {
      this.discounts = discount;
    });
  }

  submit() {
    this.loader = false;
    const nameImg = this.getCurrentDateTime() + this.selectedImage.name;
    const filePath = `book/${nameImg}`;
    const fileRef = this.storage.ref(filePath);
    // const book = this.bookForm.value;
    let book: Books;
    this.storage.upload(filePath, this.selectedImage).snapshotChanges().pipe(finalize(() => {
        fileRef.getDownloadURL().subscribe((url) => {
          this.bookForm.patchValue({image: url});
          book = {
            code: this.bookForm.value.code,
            author: this.bookForm.value.author,
            description: this.bookForm.value.description,
            dimension: this.bookForm.value.dimension,
            image: this.bookForm.value.image,
            name: this.bookForm.value.name,
            price: this.bookForm.value.price,
            publisher: this.bookForm.value.publisher,
            quantity: this.bookForm.value.quantity,
            releaseDate: this.bookForm.value.releaseDate,
            totalPages: this.bookForm.value.totalPages,
            translator: this.bookForm.value.translator,
            category: {
              id: this.bookForm.value.category,
            },
            discount: {
              id: this.bookForm.value.discount,
            },
            status: false
          };
          console.log(book);
          this.bookService.save(book).subscribe(() => {
            this.bookForm.reset();
            this.router.navigateByUrl('/listBook');
            this.toast.success('Thêm Mới Thành Công..', 'Thông Báo');
          }, e => {
            this.toast.error('Thêm Mới Thất Bại..', 'Thông Báo');
            console.log(e);
          });
        });
      })
    ).subscribe();
  }

// checkCode($event: Event) {
//   this.employeeService.checkCode(String($event)).subscribe(value => {
//       if (value) {
//         this.isExitsCode = true;
//       } else {
//         this.isExitsCode = false;
//       }
//     }
//   );
// }

  onFileSelected(event) {
    this.regexImageUrl = false;
    if (event.target.files[0].size > 9000000) {
      return;
    }
    this.selectedImage = event.target.files[0];
    if (!event.target.files[0].name.match('^.*\\.(jpg|JPG)$')) {
      this.regexImageUrl = true;
      return;
    }
    this.bookForm.patchValue({imageUrl: this.selectedImage.name});
  }

  selectFile(event: any) {
    if (!event.target.files[0] || event.target.files[0].length === 0) {
      return;
    }
    if (event.target.files[0].size > 9000000) {
      return;
    }
    if (!event.target.files[0].name.match('^.*\\.(jpg|JPG)$')) {
      return;
    }
    this.checkImgSize = false;
    this.checkImg = false;
    this.editImageState = true;

    const mimeType = event.target.files[0].type;

    if (mimeType.match(/image\/*/) == null) {
      this.msg = 'Chỉ có file ảnh được hỗ trợ';
      return;
    }
    const reader = new FileReader();
    reader.readAsDataURL(event.target.files[0]);
    // tslint:disable-next-line:variable-name
    reader.onload = (_event) => {
      this.msg = '';
      this.url = reader.result;
    };
  }

  checkCode($event: EventTarget) {
    this.bookService.checkCode(String($event)).subscribe(
      value => {
        if (value) {
          this.isExitsCode = true;
        } else {
          this.isExitsCode = false;
        }
        console.log(this.isExitsCode);
      }
    );
  }
  loadRole(): void {
    if (this.tokenStorageService.getToken()) {
      this.currentUser = this.tokenStorageService.getUser().username;
      this.role = this.tokenStorageService.getUser().roles[0];
      this.username = this.tokenStorageService.getUser().username;
    }
    this.isLoggedIn = this.username != null;
  }
}
