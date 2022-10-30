import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AnonymousRoutingModule } from './anonymous-routing.module';
import { AnonymousComponent } from './anonymous.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    AnonymousComponent,
    HomeComponent,
    LoginComponent
  ],
  imports: [
    CommonModule,
    AnonymousRoutingModule,
    ReactiveFormsModule
  ]
})
export class AnonymousModule { }
