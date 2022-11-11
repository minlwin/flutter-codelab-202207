import { ErrorHandler, Injectable } from "@angular/core";
import { ErrorResult } from "../security/results.dto";

@Injectable()
export class AppErrorHandler implements ErrorHandler {

  handleError(error: any): void {

    if("type" in error && "messages" in error) {

      let appError = error as ErrorResult

      if(appError.type == 'Security') {

      }
    }

  }

}
