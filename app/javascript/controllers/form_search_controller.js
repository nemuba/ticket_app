import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-search"
export default class extends Controller {
  static targets = ['search', 'form']

  connect() {
    this.searchTarget.focus()
  }

  reset() {
    this.element.reset()
    this.searchTarget.focus()
    this.searchTarget.value = ''
  }

  change(event) {
    if (this.searchTarget.value.length > 3) {
      this.formTarget.requestSubmit()
    } else {
      event.preventDefault()
    }
  }

}
