import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { notEmptyArray } from 'src/app/services';

@Component({
  selector: 'app-word-edit',
  templateUrl: './word-edit.component.html',
  styles: [
  ]
})
export class WordEditComponent implements OnInit {

  form:FormGroup

  @Output("saveAction")
  emitter = new EventEmitter<any>

  @Input()
  set dto(data:any) {
    this.clear()
    this.form.patchValue(data)
  }

  constructor(private builder:FormBuilder) {
    this.form = builder.group({
      word: ['', Validators.required],
      phonetic: ['', Validators.required],
      lessonId: [0, [Validators.required, Validators.min(1)]],
      description: builder.array([], {validators: notEmptyArray})
    })
  }

  ngOnInit(): void {
    this.addDescription()
  }

  save() {
    if(this.form.valid) {
      this.emitter.emit(this.form.value)
    }
  }

  get description():FormArray {
    return this.form.get('description') as FormArray
  }

  addDescription() {
    this.description.push(this.builder.control('', [Validators.required]))
  }

  removeDescription(index:number) {
    this.description.removeAt(index)
    if(this.description.length == 0) {
      this.addDescription()
    }
  }

  private clear() {
    this.form.patchValue({
      word: '',
      phonetic: '',
      lessonId: 0,
      description: []
    })
    this.addDescription()
  }

}
