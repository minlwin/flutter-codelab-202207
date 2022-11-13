import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { PageInfo, PageInput } from 'src/app/services';
import { AccountService } from 'src/app/services/api/account.service';

declare var bootstrap:any

@Component({
  templateUrl: './accounts.component.html',
  styles: [
  ]
})
export class AccountsComponent implements OnInit {

  form:FormGroup
  list:any[] = []
  modalDialog:any

  target:any
  pageInfo?:PageInfo

  constructor(builder:FormBuilder, private service:AccountService) {
    this.form = builder.group({
      role: '',
      name: ''
    })
  }

  ngOnInit(): void {
    this.modalDialog = new bootstrap.Modal('#accountEditModal', { backdrop : false })
    this.search()
  }

  search() {
    this.service.search(this.form.value, PageInput).subscribe(data => {
      const {page, result} = data
      this.list = result
      this.pageInfo = page
    })
  }

  searchPage(current:number) {
    const {... page} = PageInput
    page.current = current
    this.service.search(this.form.value, page).subscribe(data => {
      const {page, result} = data
      this.list = result
      this.pageInfo = page
    })
  }

  addNew() {
    this.target = null
    this.modalDialog.show()
  }

  save(dto:any) {
    this.service.save(dto).subscribe(() => {
      this.search()
      this.modalDialog.hide()
    })
  }

  edit(data:any) {
    this.target = data
    this.modalDialog.show()
    return false
  }

}
