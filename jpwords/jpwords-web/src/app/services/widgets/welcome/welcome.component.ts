import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApplicationSecurity } from '../../security/application.security';

@Component({
  templateUrl: './welcome.component.html',
  styles: [
  ]
})
export class WelcomeComponent implements OnInit {

  constructor(security:ApplicationSecurity, router:Router) {
    router.navigate([security.isLogin() ? 'members' : 'anonymous'])
  }

  ngOnInit(): void {
  }

}
