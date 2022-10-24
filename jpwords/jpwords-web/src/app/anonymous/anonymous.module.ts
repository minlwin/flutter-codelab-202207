import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AnonymousRoutingModule } from './anonymous-routing.module';
import { AnonymousComponent } from './anonymous.component';


@NgModule({
  declarations: [
    AnonymousComponent
  ],
  imports: [
    CommonModule,
    AnonymousRoutingModule
  ]
})
export class AnonymousModule { }
