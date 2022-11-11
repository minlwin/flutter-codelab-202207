import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { fixed_levels } from 'src/app/services';

@Component({
  templateUrl: './home.component.html',
  styles: [
  ]
})
export class HomeComponent implements OnInit {

  form:FormGroup
  list:any[] = []

  constructor(builder:FormBuilder) {
    this.form = builder.group({
      level: '',
      keyword: ''
    })
  }

  ngOnInit(): void {
  }

  get levels() {
    return fixed_levels
  }


  search() {

  }
}
