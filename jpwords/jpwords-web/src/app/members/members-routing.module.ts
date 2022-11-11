import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccountsComponent } from './accounts/accounts.component';
import { BookDetailsComponent } from './books/book-details/book-details.component';
import { BooksComponent } from './books/books.component';
import { HomeComponent } from './home/home.component';
import { MembersComponent } from './members.component';

const routes: Routes = [{ path: '', component: MembersComponent , children: [
  {path: 'home', component: HomeComponent},
  {path: 'accounts', component: AccountsComponent},
  {path: 'books', children: [
    {path: 'list', component: BooksComponent},
    {path: 'details', component: BookDetailsComponent},
    {path: '', redirectTo: 'list', pathMatch: 'full'}
  ]},
  {path: '', redirectTo: '/members/home', pathMatch: 'full'}
]}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MembersRoutingModule { }
