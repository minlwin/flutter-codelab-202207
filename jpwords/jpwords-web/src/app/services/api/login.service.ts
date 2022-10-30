import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";

const API = `${environment.baseApi}/security/login`
@Injectable({providedIn: 'any'})
export class LoginService {

  constructor(private http:HttpClient) {}

  login(form:any) {
    return this.http.post<any>(API, form)
  }
}
