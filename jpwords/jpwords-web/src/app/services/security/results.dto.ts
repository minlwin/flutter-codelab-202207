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

export class AppErrorResult implements ErrorResult {

  type: "Validation" | "Business" | "Platform" | "Security"
  messages: string[]

  constructor(type: "Validation" | "Business" | "Platform" | "Security", messages: string[]) {
    this.type = type
    this.messages = messages
  }

}
