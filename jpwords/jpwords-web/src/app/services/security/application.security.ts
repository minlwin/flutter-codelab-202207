import { Injectable } from "@angular/core";
import { LoginUser } from "./results.dto";

const loginUserKey = 'jdc.jpwords.login.usr'
const loginToken = 'jdc.jpwords.login.token'

@Injectable({providedIn: 'root'})
export class ApplicationSecurity {

  private login:LoginUser | null = null

  signOut() {
    localStorage.clear()
  }

  isLogin():boolean {
    return this.getLoginUser() != null && this.getLoginToken() != null
  }

  getLoginUser():LoginUser | null {
    return this.login ?? this.loadLoginUser()
  }

  setLoginUser(dto?:LoginUser) {
    if(dto) {
      localStorage.setItem(loginUserKey, JSON.stringify(dto))
    } else {
      localStorage.clear()
    }
  }

  getLoginToken(): string | null {
    return localStorage.getItem(loginToken)
  }

  setLoginToken(token:string | null) {
    if(token) {
      localStorage.setItem(loginToken, token)
    } else {
      localStorage.clear()
    }
  }

  private loadLoginUser(): LoginUser | null {
    let loginInfo = localStorage.getItem(loginUserKey)
    if(loginInfo) {
      let jsonObject = JSON.parse(loginInfo)
      this.login = jsonObject
      return jsonObject
    }
    return null
  }

}
