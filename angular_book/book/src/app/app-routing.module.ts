import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {LoginComponent} from './login/login.component';
import {BodyComponent} from './body/body.component';
import {CartComponent} from './cart/cart.component';
import {DetailComponent} from './detail/detail.component';
import {ListBookComponent} from './list-book/list/list-book.component';
import {CreateComponent} from './list-book/create/create.component';
import {EditComponent} from './list-book/edit/edit.component';
import {CategoryBookComponent} from './category-book/category-book.component';
import {DetailCustomerComponent} from './detail-customer/detail-customer.component';
import {CartDetailComponent} from './cart-detail/cart-detail.component';
import {StatisticComponent} from './statistic/statistic.component';
import {AuthGuard} from './login/auth.guard.';
import {LoginChatComponent} from './chats/login-chat/login-chat.component';
import {RoomlistComponent} from './chats/room-list/room-list.component';
import {AddRoomComponent} from './chats/addroom/addroom.component';
import {ChatroomComponent} from './chats/chatroom/chatroom.component';


const routes: Routes = [
  {path: '', component: BodyComponent},
  {path: 'cart', component: CartComponent},
  {path: 'detail/:id', component: DetailComponent},
  {path: 'listBook', component: ListBookComponent},
  {path: 'listBook/create', component: CreateComponent},
  {path: 'listBook/edit/:id', component: EditComponent},
  {path: 'categoryBooks/:id/:search', component: CategoryBookComponent},
  {path: 'login', component: LoginComponent},
  {path: 'detailCustomer', component: DetailCustomerComponent},
  {path: 'history', component: CartDetailComponent},
  {
    path: 'statistic', component: StatisticComponent, canActivate: [AuthGuard],
    data: {
      roles: ['ROLE_ADMIN']
    }
  },
  { path: 'login/chat', component: LoginChatComponent },
  { path: 'room/list', component: RoomlistComponent },
  { path: 'add/room', component: AddRoomComponent },
  { path: 'chat/:roomname', component: ChatroomComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
