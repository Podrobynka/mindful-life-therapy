import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['message']

  toggleError(field, parent, valid) {
    let errorDiv = this.messageTarget
    errorDiv.textContent = this.errorMessageFor(field)
    errorDiv.classList.toggle('hide', valid)
  }

  get errorMessageMatrix() {
    return {
      messageValueMissing: 'Please fill out this field.',
      messageValueMissingSelect: 'Please select a value.',
      messageValueMissingSelectMulti: 'Please select at least one value.',
      messageTypeMismatchEmail: 'Please enter a valid email address.',
      messageTypeMismatchURL: 'Please enter a URL.',
      messageTooShort: 'Please lengthen this text to {minLength} characters or more. You are currently using {length} characters.',
      messageTooLong: 'Please shorten this text to no more than {maxLength} characters. You are currently using {length} characters.',
      messagePatternMismatch: 'Please match the requested format.',
      messageBadInput: 'Please enter a number.',
      messageStepMismatch: 'Please select a valid value.',
      messageRangeOverflow: 'Please select a value that is no more than {max}.',
      messageRangeUnderflow: 'Please select a value that is no less than {min}.',
      messageGeneric: 'The value you entered for this field is invalid.'
    }
  }

  errorMessageFor(field) {
    let validity = field.validity

    if (validity.valid) return ""

    // If field is required and empty
    if (validity.valueMissing) {
      if (field.type === 'select-multiple') return this.errorMessageMatrix.messageValueMissingSelectMulti
      if (field.type === 'select-one') return this.errorMessageMatrix.messageValueMissingSelect
      return this.errorMessageMatrix.messageValueMissing
    }

    // If not the right type
    if (validity.typeMismatch) {
      if (field.type === 'email') return this.errorMessageMatrix.messageTypeMismatchEmail
      if (field.type === 'url') return this.errorMessageMatrix.messageTypeMismatchURL
    }

    // If too short
    if (validity.tooShort) return this.errorMessageMatrix.messageTooShort.replace('{minLength}', field.getAttribute('minLength')).replace('{length}', field.value.length)

    // If too long
    if (validity.tooLong) return this.errorMessageMatrix.messageTooLong.replace('{minLength}', field.getAttribute('maxLength')).replace('{length}', field.value.length)

    // If number input isn't a number
    if (validity.badInput) return this.errorMessageMatrix.messageBadInput

    // If a number value doesn't match the step interval
    if (validity.stepMismatch) return this.errorMessageMatrix.messageStepMismatch

    // If a number field is over the max
    if (validity.rangeOverflow) return this.errorMessageMatrix.messageRangeOverflow.replace('{max}', field.getAttribute('max'))

    // If a number field is below the min
    if (validity.rangeUnderflow) return this.errorMessageMatrix.messageRangeUnderflow.replace('{min}', field.getAttribute('min'))

    // If pattern doesn't match
    if (validity.patternMismatch) {

      // If pattern info is included, return custom error
      if (field.hasAttribute('title')) return field.getAttribute('title')

      // Otherwise, generic error
      return errorMessageMatrix.messagePatternMismatch
    }

    // If all else fails, return a generic catchall error
    return errorMessageMatrix.messageGeneric
  }
}
