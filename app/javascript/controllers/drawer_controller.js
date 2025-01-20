import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    previousUrl: String,
    confirm: Boolean,
    confirmMessage: String
  }

  initialize() {
    this.handleKeydown = this.handleKeydown.bind(this);
    Trusted.drawer = this;
  }

  connect() {
    document.addEventListener("keydown", this.handleKeydown);
    this.confirmation = this.confirmValue;
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeydown);
  }

  handleKeydown(event) {
    if (event.key === "Escape" || event.keyCode === 27) {
      event.preventDefault();
      this.close();
    }
  }

  setConfirmation(e) {
    this.confirmation = true;
  }

  resetConfirmation(e) {
    this.confirmation = false;
  }

  confirmMessage() {
    return this.confirmMessageValue || "Are you sure you want to close?";
  }

  async close(force = false) {
    // Check for confirmation if required
    if (!force && this.confirmation === true) {
      const confirmed = await Turbo.config.forms.confirm(this.confirmMessage());
      if (!confirmed) {
        return; // Exit if the user cancels
      }
    }

    // Finds the frame created by the drawer manager.
    let container = this.element.closest('.drawer');

    // Restore the URL to its state before the drawer was opened.
    if (this.previousUrlValue) window.history.pushState({}, null, this.previousUrlValue);

    // Remove everything from the DOM.
    container.remove();
  }
}
