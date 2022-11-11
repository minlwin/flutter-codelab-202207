import { ErrorHandler, Injectable, NgZone } from "@angular/core";
import { Router } from "@angular/router";
import { ApplicationSecurity } from "../security/application.security";
import { ErrorResult } from "../security/results.dto";

@Injectable()
export class AppErrorHandler implements ErrorHandler {

  constructor(private router:Router, private security:ApplicationSecurity, private zone:NgZone) {}

  handleError(error: any): void {

    if("type" in error && "messages" in error) {

      let appError = error as ErrorResult

      if(appError.type == 'Security') {
        this.security.signOut()
        this.zone.run(() => {
          this.router.navigate(['/anonymous', 'login'], {queryParams: {message: error.messages[0]}})
        })
      }
    }

  }

}
