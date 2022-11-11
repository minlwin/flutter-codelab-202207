import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { fixed_levels } from 'src/app/services';
import { BookService } from 'src/app/services/api/book.service';

@Component({
  selector: 'app-book-edit',
  templateUrl: './book-edit.component.html',
  styles: [
  ]
})
export class BookEditComponent implements OnInit {

  form:FormGroup

  @Input()
  set dto(data: any) {
    if(data) {
      this.form.patchValue(data)
    } else {
      this.form.patchValue({
        id: 0,
        title: '',
        level: '',
        description: ''
      })
    }
  }

  constructor(builder:FormBuilder, private service:BookService, private router:Router) {
    this.form = builder.group({
      id: 0,
      title: ['', Validators.required],
      level: ['', Validators.required],
      description: ['', Validators.required]
    })

  }

  ngOnInit(): void {
  }

  save() {
    if(this.form.valid) {
      this.service.save(this.form.value).subscribe(result => {
        this.router.navigate(['details'], {queryParams: {id: result.id}})
      })
    }
  }

  get title() {
    return this.form.get('id')?.value == 0 ? 'Add New' : 'Edit'
  }

  get levels() {
    return fixed_levels
  }

}
