import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element)
    this.modal.show()
  }

  disconnect() {
    this.modal.hide()
    document.getElementById('remote_modal').innerHTML = ''
  }

  close(event) {
    event.preventDefault()
    this.modal.hide()
    this.disconnect()
  }

  clear(event) {
    if (event.detail.success === true) {
      event.preventDefault()
      this.modal.hide()
      this.disconnect()
    } else {
      event.preventDefault()
    }
  }
}
