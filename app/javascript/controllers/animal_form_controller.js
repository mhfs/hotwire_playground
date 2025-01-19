import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static outlets = [ "drawer" ]

  requireConfirmation(e) {
    e.preventDefault()
    this.drawerOutlet.setConfirmation();
  }

  cancelConfirmation(e) {
    e.preventDefault()
    this.drawerOutlet.resetConfirmation();
  }
}
