import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MembersRoutingModule } from './members-routing.module';
import { MembersComponent } from './members.component';
import { HomeComponent } from './home/home.component';
import { BooksComponent } from './books/books.component';
import { LessonsComponent } from './lessons/lessons.component';
import { AccountsComponent } from './accounts/accounts.component';
import { WordsComponent } from './words/words.component';


@NgModule({
  declarations: [
    MembersComponent,
    HomeComponent,
    BooksComponent,
    LessonsComponent,
    AccountsComponent,
    WordsComponent
  ],
  imports: [
    CommonModule,
    MembersRoutingModule
  ]
})
export class MembersModule { }
