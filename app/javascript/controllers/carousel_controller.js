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
    console.log('GG')
    this.destroyFlickity()
    let flkty = new Flickity(".carousel", {adaptiveHeight: true, fullscreen: true, cellAlign: 'left', contain: true})
    console.log(flkty)
  }

  destroyFlickity() {
    const flkty = Flickity.data(".carousel")
    console.log(flkty)
    if (flkty) flkty.destroy()
  }
}
