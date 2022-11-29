import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { SocialLoginModule, SocialAuthServiceConfig } from 'angularx-social-login';
import {
  GoogleLoginProvider,
  FacebookLoginProvider
} from 'angularx-social-login';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { BodyComponent } from './body/body.component';
import { LoginComponent } from './login/login.component';
import { CartComponent } from './cart/cart.component';
import { DetailComponent } from './detail/detail.component';
import {HttpClientModule} from '@angular/common/http';
import { ListBookComponent } from './list-book/list/list-book.component';
import { CreateComponent } from './list-book/create/create.component';
import { EditComponent } from './list-book/edit/edit.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {AngularFireModule} from '@angular/fire';
import {environment} from '../environments/environment';
import {AngularFirestoreModule} from '@angular/fire/firestore';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatButtonModule} from '@angular/material/button';
import {MatSelectModule} from '@angular/material/select';
import {ToastrModule} from 'ngx-toastr';
import {MatIconModule} from '@angular/material/icon';
import { CategoryBookComponent } from './category-book/category-book.component';
import { DetailCustomerComponent } from './detail-customer/detail-customer.component';
import { CartDetailComponent } from './cart-detail/cart-detail.component';
import {StatisticComponent} from './statistic/statistic.component';
import {AddRoomComponent} from './chats/addroom/addroom.component';
import {ChatroomComponent} from './chats/chatroom/chatroom.component';
import {LoginChatComponent} from './chats/login-chat/login-chat.component';
import {RoomlistComponent} from './chats/room-list/room-list.component';
import {CommonModule, DatePipe} from '@angular/common';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatTableModule} from '@angular/material/table';
import {MatSortModule} from '@angular/material/sort';
import {MatSidenavModule} from '@angular/material/sidenav';
import {MatCardModule} from '@angular/material/card';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    BodyComponent,
    CartComponent,
    LoginComponent,
    DetailComponent,
    ListBookComponent,
    CreateComponent,
    EditComponent,
    CategoryBookComponent,
    DetailCustomerComponent,
    CartDetailComponent,
    StatisticComponent,
    AddRoomComponent,
    ChatroomComponent,
    LoginChatComponent,
    RoomlistComponent,

  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatProgressSpinnerModule,
    MatIconModule,
    MatTableModule,
    MatSortModule,
    MatSidenavModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFireModule.initializeApp(environment.firebaseConfigs),
    AngularFirestoreModule,
    MatFormFieldModule,
    MatInputModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatSelectModule,
    FormsModule,
    ToastrModule.forRoot({
      positionClass: 'toast-top-right',
      progressBar: true,
      tapToDismiss: true
    }),
    MatIconModule,
    SocialLoginModule
  ],
  providers: [
    DatePipe,
    {
      provide: 'SocialAuthServiceConfig',
      useValue: {
        autoLogin: false,
        providers: [
          {
            id: GoogleLoginProvider.PROVIDER_ID,
            provider: new GoogleLoginProvider(
              '715161572197-v9g7v3k9it5h3sv7bqbrkn74kpts1gr7.apps.googleusercontent.com',
              {scope: 'email', plugin_name: 'login-app'}
            )
          },
          {
            id: FacebookLoginProvider.PROVIDER_ID,
            provider: new FacebookLoginProvider('370931158541582')
          }
        ],
        onError: (err) => {
          console.error(err);
        }
      } as SocialAuthServiceConfig,
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}
