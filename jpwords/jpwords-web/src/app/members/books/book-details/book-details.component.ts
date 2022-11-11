import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BookService } from 'src/app/services/api/book.service';

@Component({
  templateUrl: './book-details.component.html',
  styles: [
  ]
})
export class BookDetailsComponent implements OnInit {

  dto:any

  constructor(private route:ActivatedRoute, private service:BookService) { }

  ngOnInit(): void {
    this.route.queryParams.subscribe(param => {
      if(param['id']) {
        this.service.findById(Number.parseInt(param['id'])).subscribe(result => {
          this.dto = result
        })
      }
    })
  }

}