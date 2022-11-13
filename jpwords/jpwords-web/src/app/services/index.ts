import { FormArray, ValidatorFn } from "@angular/forms"

export const fixed_levels = [
  'N5', 'N4', 'N3', 'N2', 'N1'
]

export const notEmptyArray:ValidatorFn = control => {
  var array = control as FormArray
  if(array.length == 0) {
    return {'emptyArrayError' : 'Empty Array Data'}
  }
  return null
}

export interface PageInfo {
  readonly total:number
  readonly size:number
  readonly current:number
}

export interface ListPagerResult {
  readonly result:any[]
  readonly page:PageInfo
}

export const PageInput = {
  current: 0,
  sze: 10
}
