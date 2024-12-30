import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    previousUrl: String
  }

  connect() {
    document.addEventListener("keydown", this.handleKeydown);
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeydown);
  }

  handleKeydown = (event) => {
    if (event.key === "Escape" || event.keyCode === 27) {
      this.close();
    }
  };

  setConfirmation(e) {
    this.confirmation = true;
  }

  close() {
    if (this.confirmation === true && !confirm("Are you sure you want to close?")) {
      return;
    }

    // Finds the frame created by the drawer manager.
    let container = this.element.closest('.drawer')

    // Restore the URL to its state before the drawer was opened.
    if (this.previousUrlValue) window.history.pushState({}, null, this.previousUrlValue);

    // Remove everything from the DOM.
    container.remove();
  }
}
