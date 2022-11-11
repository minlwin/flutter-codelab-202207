import { HttpErrorResponse, HttpEvent, HttpHandler, HttpInterceptor, HttpRequest, HttpStatusCode } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { catchError, Observable, throwError } from "rxjs";
import { AppErrorResult } from "../security/results.dto";

@Injectable()
export class ApiErrorInterceptor implements HttpInterceptor{

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return next.handle(req).pipe(
      catchError(error => {

        if(error instanceof HttpErrorResponse) {

          if(error.status == HttpStatusCode.Forbidden || error.status == HttpStatusCode.Unauthorized) {
            return throwError(() => new AppErrorResult('Security', ['Authentication Error, please login again.']))
          }

          if(error.status == HttpStatusCode.UnprocessableEntity) {
            return throwError(() => error)
          }
        }

        return throwError(() => error)
      })
    )
  }

}
