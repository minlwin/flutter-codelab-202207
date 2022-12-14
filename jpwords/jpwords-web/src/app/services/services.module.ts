import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http'
import { SecurityTokenInterceptor } from './interceptors/security.token.interceptor';
import { WelcomeComponent } from './widgets/welcome/welcome.component';
import { ApiErrorInterceptor } from './interceptors/api.error.interceptor';
import { NoDataComponent } from './widgets/no-data/no-data.component';
import { PageNavigatorComponent } from './widgets/page-navigator/page-navigator.component';


@NgModule({
  declarations: [
    WelcomeComponent,
    NoDataComponent,
    PageNavigatorComponent,
  ],
  exports: [
    WelcomeComponent,
    NoDataComponent,
    PageNavigatorComponent,
  ],
  imports: [
    CommonModule,
    HttpClientModule,
  ],
  providers: [
    {provide: HTTP_INTERCEPTORS, useClass: SecurityTokenInterceptor, multi: true},
    {provide: HTTP_INTERCEPTORS, useClass: ApiErrorInterceptor, multi: true},
  ]
})
export class ServicesModule { }
