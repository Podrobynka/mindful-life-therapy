import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['field']

  connect() {
    this.turnBrowserValidationOff()
  }

  get formValid() {
    return this.data.formValid
  }

  set formValid(value) {
    this.data.formValid = value
  }

  turnBrowserValidationOff() {
    this.element.setAttribute('novalidate', true)
  }

  validateForm(event) {
    this.validateFields()
    this.preventSubmissionIfFormIsInvalid(event)
  }

  validateFields() {
    this.formValid = true
    this.fieldTargets.forEach(field => this.checkField(field))
  }

  validateFieldOnBlurOrKeyup(event) {
    this.tabKeyPressed(event) ? this.doNothing() : this.checkField(event.target)
  }

  checkField(field) {
    let validity = field.checkValidity()
    this.updateForm(validity)
    this.updateField(field, validity)
  }

  updateForm(validity) {
    if (!validity) this.formValid = false
  }

  updateField(field, validity) {
    let parent = field.parentElement
    this.toggleClass(parent, validity)
    this.toggleError(field, parent, validity)
  }

  toggleClass(parent, validity) {
    parent.classList.toggle('field_with_errors', !validity)
  }

  toggleError(field, parent, validity) {
    this.errorsController(parent).toggleError(field, parent, validity)
  }

  errorsController(parent) {
    return this.application.getControllerForElementAndIdentifier(parent, "errors")
  }

  preventSubmissionIfFormIsInvalid(event) {
    if (!this.formValid) event.preventDefault()
  }

  doNothing() {
    return
  }

  tabKeyPressed(event) {
    // Tabbing from one field to another causes a blur event on the field we have
    // tabbed from, and a keyup event on the field we have tabbed into.
    // We want only the blur event to trigger validations in this case, as otherwise
    // the field we have tabbed into will be validated before the user has
    // even had a chance to enter any data, which will usually result in them
    // being hit with a validation error message.
    //
    // Please note that event.keyCode and event.which are deprecated in favour of
    // using event.key but browsers are taking their sweet time over this,
    // hence the progressive enhancement technique seen below.

    return event.key === 'Tab' || event.keyCode === 9 || event.which === 9
  }
}
