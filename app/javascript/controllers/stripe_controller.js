
import { Controller } from "stimulus"
import {loadStripe} from "@stripe/stripe-js";

export default class extends Controller {
  static targets = ["button"]

  // initialize() {
  //   var stripe = Stripe('pk_test_51HFU15CdGYStXYkyqEyKhvXM4gTC42acCqXFydnYxYvmMdVKDlNOrmaJmX6C299MiNujwtvs21Np32fxTD58rPpO00QcYFJoVV');
  //   // Publishable key is totally safe to be hard coded here and visible on FE
  //   stripe.redirectToCheckout({
  //     // Make the id field from the Checkout Session creation API response
  //     // available to this file, so you can provide it as argument here
  //     // instead of the {{CHECKOUT_SESSION_ID}} placeholder.
  //     sessionId: this.buttonTarget.dataset.checkoutSessionId
  //   })
  // }

  checkout(event) {
    // const stripe = await loadStripe("pk_test_51HFU15CdGYStXYkyqEyKhvXM4gTC42acCqXFydnYxYvmMdVKDlNOrmaJmX6C299MiNujwtvs21Np32fxTD58rPpO00QcYFJoVV")
    event.preventDefault()
    var stripe = Stripe(this.buttonTarget.dataset.id)
    // Publishable key is totally safe to be hard coded here and visible on FE
    stripe.redirectToCheckout({
      // Make the id field from the Checkout Session creation API response
      // available to this file, so you can provide it as argument here
      // instead of the {{CHECKOUT_SESSION_ID}} placeholder.
      sessionId: this.buttonTarget.dataset.checkoutSessionId
    })
    // If `redirectToCheckout` fails due to a browser or network
    // error, display the localized error message to your customer
    // using `error.message`.
  }
}
