import { Controller } from "stimulus"

export default class extends Controller {

  validatePresence(event) {
    let field   = this.required_field
    let present = this.isPresent(field)
    this.toggleField(field, present)
  }

  validateEmail(event) {
    let field   = this.email_field
    let correct = this.isEmail(field)
    this.toggleField(field, correct)
  }

  private

  get required_field() {
    return this.targets.find('required')
  }

  get email_field() {
    return this.targets.find('email')
  }

  isPresent(field) {
    return /^.+$/.test(field.value.trim())
  }

  isEmail(field) {
    return /^\S+@\S+\.\S+$/.test(field.value.trim())
  }

  toggleField(field, valid) {
    field.parentElement.classList.toggle("field_with_errors", !valid)
  }
}
