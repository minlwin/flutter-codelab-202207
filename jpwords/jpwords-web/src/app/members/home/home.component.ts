import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { fixed_levels, PageInfo, PageInput } from 'src/app/services';
import { BookService } from 'src/app/services/api/book.service';
import { WordService } from 'src/app/services/api/word.service';

@Component({
  templateUrl: './home.component.html',
  styles: [
  ]
})
export class HomeComponent implements OnInit {

  form:FormGroup

  list:any[] = []
  pageInfo?:PageInfo

  books:any[] = []

  constructor(builder:FormBuilder, private service:WordService, private bookService:BookService) {
    this.form = builder.group({
      level: '',
      book: 0,
      keyword: ''
    })
  }

  ngOnInit(): void {
    this.search()

    this.form.get('level')?.valueChanges.subscribe(level => {
      this.books = []
      this.bookService.search({level: level}, {}).subscribe(dto => {
        const {result} = dto
        this.books = result
      })
    })
  }

  get levels() {
    return fixed_levels
  }

  search() {
    this.service.search(this.form.value, PageInput).subscribe(dto => {
      const {page, result} = dto
      this.pageInfo = page
      this.list = result
    })
  }

  searchPage(current:number) {
    const {... header} = PageInput
    header.current = current
    this.service.search(this.form.value, header).subscribe(dto => {
      const {page, result} = dto
      this.pageInfo = page
      this.list = result
    })
  }

  joinArray(array:string[]) {
    return array.join(', ')
  }
}
