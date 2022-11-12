import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";

const API = `${environment.baseApi}/lesson`

@Injectable({providedIn: 'any'})
export class LessonService {

  constructor(private http:HttpClient) {}

  search(form:any) {
    return this.http.get<any[]>(API, {params: form})
  }

  findBiId(id:number) {
    return this.http.get<any>(`${API}/${id}`)
  }

  save(form:any) {
    const {id, ... dto} = form
    if(id == 0) {
      return this.create(dto)
    }

    return this.update(id, dto)
  }

  private create(form:any) {
    return this.http.post(API, form)
  }

  private update(id:number, form:any) {
    return this.http.put(`${API}/${id}`, form)
  }

}
