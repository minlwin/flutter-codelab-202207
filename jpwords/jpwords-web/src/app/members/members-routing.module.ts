import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccountsComponent } from './accounts/accounts.component';
import { BooksComponent } from './books/books.component';
import { HomeComponent } from './home/home.component';
import { LessonsComponent } from './lessons/lessons.component';
import { MembersComponent } from './members.component';
import { WordsComponent } from './words/words.component';

const routes: Routes = [{ path: '', component: MembersComponent , children: [
  {path: 'home', component: HomeComponent},
  {path: 'accounts', component: AccountsComponent},
  {path: 'books', component: BooksComponent},
  {path: 'lessons', component: LessonsComponent},
  {path: 'words', component: WordsComponent},
  {path: '', redirectTo: '/members/home', pathMatch: 'full'}
]}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MembersRoutingModule { }
