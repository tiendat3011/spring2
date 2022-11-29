import {Component, OnInit} from '@angular/core';
import {BooksService} from '../service/books.service';
import {Books} from '../model/books';
import {ToastrModule, ToastrService} from 'ngx-toastr';
import Swal from 'sweetalert2';
import {TokenStorageService} from '../service/token-storage.service';
import {ShareService} from '../service/share.service';

@Component({
  selector: 'app-body',
  templateUrl: './body.component.html',
  styleUrls: ['./body.component.css']
})
export class BodyComponent implements OnInit {
  listBooks1: Books[] = [];
  listBooks2: Books[] = [];
  id: any;
  image: any;
  price: any;
  author: any;
  name: any;
  cart: any = this.bookService.getCart();
  role: string;
  isLoggedIn = false;
  currentUser: string;
  username: string;

  constructor(private bookService: BooksService,
              private tokenStorageService: TokenStorageService,
              private shareService: ShareService) {
  }

  ngOnInit(): void {
    this.getAll1();
    this.getAll2();
    this.loadHeader();
  }

  private getAll1() {
    this.bookService.getList1().subscribe((books: any) => {
      if (books != null) {
        this.listBooks1 = books;
      }
    });
  }

  private getAll2() {
    this.bookService.getList2().subscribe((book2: any) => {
      if (book2 != null) {
        this.listBooks2 = book2.content;
      }
    });
  }


  addToCart(book: any) {
    const idx = this.cart.findIndex((item: any) => {
      return item.id === book.id;
    });
    if (idx >= 0) {
      this.cart[idx].quantity += 1;
    } else {
      const cartItem: any = {
        image: book.image,
        id: book.id,
        author: book.author,
        name: book.name,
        price: book.price,
        discount: book.discount.percent,
        quantity: 1,
      };
      this.cart.push(cartItem);
    }
    this.bookService.saveCart(this.cart);
    Swal.fire({
      title: 'Thông Báo!',
      text: 'Thêm vào giỏ thành công',
      color: '#EBA850',
      icon: 'success',
      iconColor: ' #EBA850',
      timer: 1000
    });
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
}
