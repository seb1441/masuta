import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  connect() {
    this.contentTarget.scrollTop = this.contentTarget.scrollHeight
  }
}
