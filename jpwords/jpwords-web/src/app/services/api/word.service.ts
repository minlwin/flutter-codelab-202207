import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";
import { ListPagerResult } from "..";

const API = `${environment.baseApi}/word`

@Injectable({providedIn: 'any'})
export class WordService {

  constructor(private http:HttpClient) {}

  search(form:any, pageInput:any) {

    const {level, ... search} = form
    const searchParam = level ? form : search

    return this.http.get<ListPagerResult>(API, {params: searchParam, headers: pageInput})
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

  upload(lessonId:number, file:File) {
    const form = new FormData
    form.append('file', file)
    return this.http.post<any[]>(`${API}/upload/${lessonId}`, form)
  }

  private create(form:any) {
    return this.http.post(API, form)
  }

  private update(id:number, form:any) {
    return this.http.put(`${API}/${id}`, form)
  }

}
