import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MembersRoutingModule } from './members-routing.module';
import { MembersComponent } from './members.component';
import { HomeComponent } from './home/home.component';
import { BooksComponent } from './books/books.component';
import { AccountsComponent } from './accounts/accounts.component';
import { ReactiveFormsModule } from '@angular/forms';
import { BookEditComponent } from './books/book-edit/book-edit.component';
import { BookDetailsComponent } from './books/book-details/book-details.component';
import { ServicesModule } from '../services/services.module';
import { AccountEditComponent } from './accounts/account-edit/account-edit.component';
import { LessonEditComponent } from './books/book-details/lesson-edit/lesson-edit.component';
import { WordEditComponent } from './books/book-details/word-edit/word-edit.component';


@NgModule({
  declarations: [
    MembersComponent,
    HomeComponent,
    BooksComponent,
    AccountsComponent,
    BookEditComponent,
    BookDetailsComponent,
    AccountEditComponent,
    LessonEditComponent,
    WordEditComponent
  ],
  imports: [
    CommonModule,
    MembersRoutingModule,
    ReactiveFormsModule,
    ServicesModule
  ]
})
export class MembersModule { }
