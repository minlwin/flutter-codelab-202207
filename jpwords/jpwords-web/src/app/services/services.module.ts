import { ErrorHandler, NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http'
import { SecurityTokenInterceptor } from './interceptors/security.token.interceptor';
import { WelcomeComponent } from './widgets/welcome/welcome.component';
import { ApiErrorInterceptor } from './interceptors/api.error.interceptor';
import { NoDataComponent } from './widgets/no-data/no-data.component';
import { PagerComponent } from './widgets/pager/pager.component';


@NgModule({
  declarations: [
    WelcomeComponent,
    NoDataComponent,
    PagerComponent
  ],
  exports: [
    WelcomeComponent,
    NoDataComponent
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
