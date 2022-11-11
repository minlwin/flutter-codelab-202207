import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-account-edit',
  templateUrl: './account-edit.component.html',
  styles: [
  ]
})
export class AccountEditComponent implements OnInit {

  form:FormGroup

  @Output("dto")
  emitter = new EventEmitter<any>()

  @Input()
  set account(data:any) {
    if(data) {
      this.form.patchValue({
        id: data.id,
        name: data.name,
        email: data.email,
        role: data.role,
        expired: data.expired
      })
    } else {
      this.form.patchValue({
        id: 0,
        name: '',
        email: '',
        role: '',
        expired: false
      })
    }
  }

  constructor(builder:FormBuilder) {
    this.form = builder.group({
      id: 0,
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      role: ['', Validators.required],
      expired: false
    })
  }

  ngOnInit(): void {
  }

  save() {
    if(this.form.valid) {
      this.emitter.emit(this.form.value)
    }
  }
}
