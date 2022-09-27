import { Controller } from "@hotwired/stimulus"
import { Toast } from "bootstrap"
// Connects to data-controller="flash-messages"
export default class extends Controller {
  connect() {
    this.toast = new Toast(this.element)
    this.toast.show()
    this.remove()
  }

  remove() {
    setTimeout(() => {
      this.toast.hide()
    }, 5000)
  }
}
