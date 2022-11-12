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
