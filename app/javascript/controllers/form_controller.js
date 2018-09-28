import { Controller } from "stimulus"

export default class extends Controller {

  validate(event) {
    let allPresent = this.validatePresence()
    let allValid   = this.validateEmail()

    this.valid = allPresent && allValid

    if (!this.valid) event.preventDefault()
  }

  private

  get required_fields() {
    return this.targets.findAll("required")
  }

  get email_fields() {
    return this.targets.findAll('email')
  }

  get valid() {
    return this.data.valid
  }

  set valid(value) {
    this.data.valid = value
  }

  validatePresence() {
    let allValid = true

    this.required_fields.forEach((field) => {
      let present = this.isPresent(field)
      this.toggleField(field, present)
      if (!present) allValid = false
    })

    return allValid
  }

  validateEmail() {
    let allValid = true

    this.email_fields.forEach((field) => {
      let correct = this.isEmail(field)
      this.toggleField(field, correct)
      if (!correct) allValid = false
    })

    return allValid
  }

  isPresent(field) {
    return /^.+$/.test(field.value.trim())
  }

  isEmail(field) {
    return /^.+@.+\..+$/.test(field.value.trim())
  }

  toggleField(field, validity) {
    field.parentElement.classList.toggle("field_with_errors", !validity)
  }
}
