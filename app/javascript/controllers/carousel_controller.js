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
    var elem = document.querySelector(".carousel");
    let flkty = new Flickity(elem, {adaptiveHeight: true, fullscreen: true, cellAlign: 'left', contain: true})
  }

  destroyFlickity() {
    var elem = document.querySelector(".carousel");
    const flkty = Flickity.data(elem)
    console.log(flkty)
    if (flkty) flkty.destroy()
  }
}
