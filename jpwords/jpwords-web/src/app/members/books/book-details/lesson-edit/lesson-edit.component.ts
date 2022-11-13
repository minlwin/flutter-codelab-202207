import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-lesson-edit',
  templateUrl: './lesson-edit.component.html',
  styles: [
  ]
})
export class LessonEditComponent implements OnInit {

  form:FormGroup

  @Output("saveAction")
  emitter = new EventEmitter

  @Input()
  set dto(data:any) {
    this.clear()
    this.form.patchValue(data)
    if(data.book) {
      this.form.patchValue({ bookId: data.book.id })
    }
  }

  constructor(builder:FormBuilder) {
    this.form = builder.group({
      id: 0,
      bookId: [0, [Validators.required, Validators.min(1)]],
      title: ['', Validators.required],
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

  clear() {
    this.form.patchValue({
      id: 0,
      bookId: 0,
      title: '',
      description: ''
    })
  }

}
