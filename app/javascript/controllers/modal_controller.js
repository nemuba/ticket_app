import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  connect() {
    useClickOutside(this)
    this.modal = new Modal(this.element)
    this.modal.show()
  }

  disconnect() {
    this.modal.hide()
    document.getElementById('remote_modal').innerHTML = ''
    document.getElementById('ticket_modal').innerHTML = ''
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

  clickOutside(event) {
    event.preventDefault()
    this.disconnect()
  }
}
