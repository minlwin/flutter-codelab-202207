import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { PageInfo } from '../..';

@Component({
  selector: 'app-page-navigator',
  templateUrl: './page-navigator.component.html',
  styles: [
  ]
})
export class PageNavigatorComponent implements OnInit {

  @Input()
  pageInfo?:PageInfo

  @Output("pageClickAction")
  emitter = new EventEmitter

  constructor() { }

  ngOnInit(): void {
  }

  get current() {
    if(this.pageInfo) {
      return this.pageInfo.current
    }
    return -1
  }

  clickLink(page:number) {
    this.emitter.emit(page)
  }

  get showFirst() {
    if(this.pageInfo) {
      return this.pageInfo.current > 0
    }
    return false
  }

  moveFirst() {
    this.emitter.emit(0)
  }

  get showLast() {
    if(this.pageInfo) {
      return this.pageInfo.current < this.pageCount - 1
    }
    return false
  }

  moveLast() {
    if(this.pageInfo) {
      this.emitter.emit(this.pageCount - 1)
    }
  }

  get pageCount() {
    if(this.pageInfo) {
      const divResult = this.pageInfo.total / this.pageInfo.size
      let page = Math.trunc(divResult)
      return divResult > page ? page + 1 : page
    }

    return 0
  }

  get pageList() {
    const list:number[] = []
    if(this.pageInfo) {
      let current = this.pageInfo.current
      list.push(current)

      // prepend
      while(current > 0 && list.length <=3) {
        list.unshift(-- current)
      }

      // postpend
      current = this.pageInfo.current
      while(current < this.pageCount - 1 && list.length < 5) {
        list.push(++ current)
      }

      // prepend again if not enough
      current = list[0]
      while(current > 0 && list.length < 5) {
        list.unshift(-- current)
      }

    }
    return list
  }


}
