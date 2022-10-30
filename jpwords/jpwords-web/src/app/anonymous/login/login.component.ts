import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  form:FormGroup

  constructor(builder:FormBuilder) {
    this.form = builder.group({
      email: ['', Validators.required],
      password: ['', [Validators.required, Validators.min(6)]]
    })
   }

  ngOnInit(): void {
  }

  login() {
    if(this.form.valid) {

    }
  }

}
