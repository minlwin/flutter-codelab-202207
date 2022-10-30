import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApplicationSecurity } from '../services/security/application.security';

@Component({
  selector: 'app-members',
  templateUrl: './members.component.html',
  styles: [
  ]
})
export class MembersComponent implements OnInit {

  constructor(private security:ApplicationSecurity, private router:Router) { }

  ngOnInit(): void {
  }

  signOut() {
    this.security.signOut()
    this.router.navigate(['/welcome'])
  }

}
