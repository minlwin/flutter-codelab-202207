import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ApplicationSecurity } from './services/security/application.security';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styles: []
})
export class AppComponent {

  constructor(security:ApplicationSecurity, router:Router) {
    router.navigate([security.isLogin() ? 'members' : 'anonymous'])
  }
}
