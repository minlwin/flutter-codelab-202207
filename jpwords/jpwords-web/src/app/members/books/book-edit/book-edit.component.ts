import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { fixed_levels } from 'src/app/services';

@Component({
  selector: 'app-book-edit',
  templateUrl: './book-edit.component.html',
  styles: [
  ]
})
export class BookEditComponent implements OnInit {

  form:FormGroup

  @Output("saveData")
  emitter = new EventEmitter<any>

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

  constructor(builder:FormBuilder) {
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
      this.emitter.emit(this.form.value)
    }
  }

  get title() {
    return this.form.get('id')?.value == 0 ? 'Add New' : 'Edit'
  }

  get levels() {
    return fixed_levels
  }

}
