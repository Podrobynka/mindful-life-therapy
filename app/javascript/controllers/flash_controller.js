import { Controller } from "stimulus"

export default class extends Controller {
  close() {
    var message = this.message;
    message.parentNode.removeChild(message)
  }

  get message() {
    return this.targets.find('message')
  }
}
