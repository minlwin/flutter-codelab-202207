import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';

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
    const {definition, lesson, ... word} = data
    this.form.patchValue(word)

    if(null != definition && definition instanceof Array) {
      this.definition.clear()
      for(let item of definition) {
        this.definition.push(this.builder.control(item, Validators.required))
      }
    }

    if(lesson && lesson.id) {
      this.form.patchValue({lessonId: lesson.id})
    }
  }

  constructor(private builder:FormBuilder) {
    this.form = builder.group({
      id: 0,
      word: ['', Validators.required],
      phonetic: ['', Validators.required],
      lessonId: [0, [Validators.required, Validators.min(1)]],
      definition: builder.array([])
    })
  }

  ngOnInit(): void {
    this.addDefinition()
  }

  save() {
    if(this.form.valid) {
      this.emitter.emit(this.form.value)
    }
  }

  get definition() {
    return this.form.get('definition') as FormArray
  }

  addDefinition() {
    this.definition.push(this.builder.control("", Validators.required))
  }

  removeDefinition(index:number) {
    this.definition.removeAt(index)
    if(this.definition.length == 0) {
      this.addDefinition()
    }
  }

  private clear() {
    this.form.patchValue({
      id: 0,
      word: '',
      phonetic: '',
      lessonId: 0,
    })

    this.definition.clear()
    this.addDefinition()
  }

}
