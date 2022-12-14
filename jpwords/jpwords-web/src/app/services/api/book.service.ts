import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";
import { ListPagerResult } from "..";

const API = `${environment.baseApi}/book`

@Injectable({providedIn: 'any'})
export class BookService {

  constructor(private http:HttpClient) {}

  search(form:any, pageInput:any) {
    return this.http.get<ListPagerResult>(API, {params: form, headers: pageInput})
  }

  findById(id:number) {
    return this.http.get<any>(`${API}/${id}`)
  }

  save(form:any) {
    return (form.id > 0) ? this.update(form) : this.create(form)
  }

  private create(form:any) {
    return this.http.post<any>(API, form)
  }

  private update(form:any) {
    return this.http.put<any>(API, form)
  }
}
