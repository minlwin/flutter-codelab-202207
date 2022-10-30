import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest, HttpResponse } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, tap } from "rxjs";
import { ApplicationSecurity } from "../security/application.security";

const TOKEN = 'words-app-token'
@Injectable()
export class SecurityTokenInterceptor implements HttpInterceptor{

  constructor(private context:ApplicationSecurity) {}

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

    let copy = req

    if(this.context.getLoginToken()) {
      copy = req.clone({
        headers: req.headers.append(TOKEN, this.context.getLoginToken()!)
      })
    }

    return next.handle(copy).pipe(
      tap(event => {
        if(event instanceof HttpResponse) {
          let resp = event as HttpResponse<any>
          this.context.setLoginToken(resp.headers.get(TOKEN))
        }
      })
    )
  }

}
