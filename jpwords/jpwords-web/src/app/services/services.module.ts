import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http'
import { SecurityTokenInterceptor } from './interceptors/security.token.interceptor';
import { WelcomeComponent } from './widgets/welcome/welcome.component';


@NgModule({
  declarations: [
    WelcomeComponent
  ],
  exports: [
    WelcomeComponent
  ],
  imports: [
    CommonModule,
    HttpClientModule,
  ],
  providers: [
    {provide: HTTP_INTERCEPTORS, useClass: SecurityTokenInterceptor, multi: true}
  ]
})
export class ServicesModule { }
