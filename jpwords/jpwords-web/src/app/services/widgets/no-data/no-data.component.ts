import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-no-data',
  templateUrl: './no-data.component.html',
  styles: [
  ]
})
export class NoDataComponent implements OnInit {

  @Input()
  dataName?:string

  constructor() { }

  ngOnInit(): void {
  }

}
