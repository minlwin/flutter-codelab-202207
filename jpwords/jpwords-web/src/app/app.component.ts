import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { SecurityContext } from './services/security/security.context';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styles: []
})
export class AppComponent {

  constructor(security:SecurityContext, router:Router) {
    router.navigate([security.isLogin() ? 'members' : 'anonymous'])
  }
}
