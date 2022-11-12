import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { fixed_levels } from 'src/app/services';
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
      this.bookService.search({level: level}).subscribe(result => this.books = result)
    })
  }

  get levels() {
    return fixed_levels
  }


  search() {
    this.service.search(this.form.value).subscribe(result => this.list = result)
  }

  joinArray(array:string[]) {
    return array.join(', ')
  }
}
