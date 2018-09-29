import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['field']

  connect() { this.element.setAttribute('novalidate', true) }

  get formValid() { return this.data.formValid }
  set formValid(value) { this.data.formValid = value }

  validateForm(event) {
    this.validateFields()
    this.preventSubmissionIfFormIsInvalid(event)
  }

  validateFields() {
    this.formValid = true
    this.fieldTargets.forEach(field => this.checkField(field))
  }

  validateField(event) {
    this.tabKeyPressed(event) ? this.doNothing() : this.checkField(event.target)
  }

  checkField(field) {
    this.toggleField(field, field.checkValidity())
  }

  toggleField(field, valid) {
    if (!valid) this.formValid = false
    field.parentElement.classList.toggle("field_with_errors", !valid)
  }

  preventSubmissionIfFormIsInvalid(event) {
    if (!this.formValid) event.preventDefault()
  }

  doNothing() {
    return
  }

  tabKeyPressed(event) {
    return event.key === 'Tab' || event.keyCode === 9 || event.which === 9
  }
}
