import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { MembersComponent } from './members.component';

const routes: Routes = [{ path: '', component: MembersComponent , children: [
  {path: 'home', component: HomeComponent},
  {path: '', redirectTo: '/members/home', pathMatch: 'full'}
]}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MembersRoutingModule { }
