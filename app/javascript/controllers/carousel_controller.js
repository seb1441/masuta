import ApplicationController from './application_controller'
import Flickity from "flickity/js";

export default class extends ApplicationController {
  initialize() {
    document.addEventListener(
      "cable-ready:after-morph",
      this.initializeFlickity.bind(this),
      true
    )
  }
  connect() {
    this.initializeFlickity()
  }

  disconnect() {
    this.destroyFlickity()
  }

  initializeFlickity() {
    this.destroyFlickity()
    let flkty = new Flickity(this.element, {adaptiveHeight: true, fullscreen: true,})
    console.log(flkty)
  }

  destroyFlickity() {
    const flkty = Flickity.data(this.element)
    if (flkty) flkty.destroy()
  }
}
