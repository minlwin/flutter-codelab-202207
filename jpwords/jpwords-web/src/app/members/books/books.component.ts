import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { fixed_levels } from 'src/app/services';
import { BookService } from 'src/app/services/api/book.service';

declare var bootstrap:any

@Component({
  templateUrl: './books.component.html',
  styles: [
  ]
})
export class BooksComponent implements OnInit {

  form:FormGroup
  list:any[] = []
  modalDialog:any

  constructor(builder:FormBuilder, private service:BookService) {
    this.form = builder.group({
      level: '',
      keyword: ''
    })
  }

  ngOnInit(): void {
    this.modalDialog = new bootstrap.Modal('#bookEditModal', { backdrop : false })
    this.search()
  }

  search() {
    this.service.search(this.form.value).subscribe(list => {
      this.list = list
    })
  }

  get levels() {
    return fixed_levels
  }

  addNew() {
    this.modalDialog.show()
  }

  save(form:any) {
    this.service.save(form).subscribe(() => {
      this.search()
      this.modalDialog.hide()
    })
  }

}
