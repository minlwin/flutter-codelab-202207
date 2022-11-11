import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { LoginService } from 'src/app/services/api/login.service';
import { ApplicationSecurity } from 'src/app/services/security/application.security';

@Component({
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  form:FormGroup
  message?:string

  constructor(builder:FormBuilder,
    private service:LoginService,
    private security:ApplicationSecurity,
    private route:ActivatedRoute,
    private router:Router) {
    this.form = builder.group({
      email: ['', Validators.required],
      password: ['', [Validators.required, Validators.min(5)]]
    })
   }

  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      console.log(`Error Message is ${params['message']}`)
      this.message = params['message']
    })
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
