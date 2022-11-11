import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";

const API = `${environment.baseApi}/account`

@Injectable({providedIn: 'any'})
export class AccountService {

  constructor(private http:HttpClient) {}

  search(form:any) {
    return this.http.get<any[]>(API, {params: form})
  }

  findById(id:number) {
    return this.http.get<any>(`${API}/${id}`)
  }

  save(form:any) {
    const {id, ... dto} = form;
    if(id > 0) {
      return this.http.put<any>(`${API}/${id}`, dto)
    }

    return this.http.post<any>(API, dto)
  }
}
