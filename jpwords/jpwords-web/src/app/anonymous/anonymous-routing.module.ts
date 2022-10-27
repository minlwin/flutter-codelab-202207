import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnonymousComponent } from './anonymous.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';

const routes: Routes = [
  { path: '', component: AnonymousComponent, children: [
    {path: 'login', component: LoginComponent},
    {path: 'home', component: HomeComponent},
    {path: '', redirectTo: '/anonymous/home', pathMatch: 'full'}
  ] }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AnonymousRoutingModule { }
