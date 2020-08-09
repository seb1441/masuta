import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ["content"]

  keyup(debouncedEvent) {
    let event = debouncedEvent.detail.originalEvent
    console.log('GDSG')
    if (event.keyCode == 13) {
      this.send(event)
    }
  }
  send(event) {
    this.stimulate("chat#send", this.contentTarget.value)
    this.contentTarget.value = ""
  }
}
