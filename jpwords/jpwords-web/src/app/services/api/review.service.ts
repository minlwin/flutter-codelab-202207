import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";

const API = `${environment.baseApi}/review`

@Injectable({providedIn: 'any'})
export class ReviewService {

  constructor(private http:HttpClient) {}

  search(form:any) {
    return this.http.get<any[]>(API, {params: form})
  }

  findBiId(id:number) {
    return this.http.get<any>(`${API}/${id}`)
  }

  create(form:any) {
    return this.http.post(API, form)
  }

  update(id:number, form:any) {
    return this.http.put(`${API}/${id}`, form)
  }

}
