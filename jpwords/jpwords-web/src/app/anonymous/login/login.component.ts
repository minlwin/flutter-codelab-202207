import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { LoginService } from 'src/app/services/api/login.service';
import { ApplicationSecurity } from 'src/app/services/security/application.security';

@Component({
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  form:FormGroup

  constructor(builder:FormBuilder,
    private service:LoginService,
    private security:ApplicationSecurity,
    private router:Router) {
    this.form = builder.group({
      email: ['', Validators.required],
      password: ['', [Validators.required, Validators.min(5)]]
    })
   }

  ngOnInit(): void {
  }

  login() {
    if(this.form.valid) {
      this.service.login(this.form.value).subscribe(result => {
        console.log(result)
        this.security.setLoginUser(result)
        this.router.navigate(['/'])
      })
    }
  }

}
