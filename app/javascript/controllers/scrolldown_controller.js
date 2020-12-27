import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  connect() {
    if (this.hasContentTarget) {
      this.contentTarget.scrollTop = this.contentTarget.scrollHeight
    }

    let chatWindow = document.getElementById("chat-window")
    if (chatWindow) {
      chatWindow.scrollTop = 99999
    }
  }
}
