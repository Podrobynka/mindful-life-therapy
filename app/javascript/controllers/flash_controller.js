import { Controller } from "stimulus"

export default class extends Controller {
  close() {
    let message = this.message;
    message.parentNode.removeChild(message)
  }

  private
  
  get message() {
    return this.targets.find('message')
  }
}
