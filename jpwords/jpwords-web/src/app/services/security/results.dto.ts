export interface LoginUser {
  name:string
  email:string
  role:string
  activated:boolean
}

export interface ErrorResult {
  type:string
  messages:Array<string>
}

