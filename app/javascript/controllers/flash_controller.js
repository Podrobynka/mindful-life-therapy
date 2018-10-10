import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['message']

  close() {
    let message = this.messageTarget
    message.parentNode.removeChild(message)
  }
}
