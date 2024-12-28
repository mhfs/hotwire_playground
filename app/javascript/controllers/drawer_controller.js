import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
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

  close() {
    // Finds the frame created by the drawer manager.
    let container = this.element.closest('.drawer')

    // Fetch the previous URL injected by the drawer manager.
    let previousUrl = container.dataset.drawerPreviousUrl;

    // Restore the URL to its state before the drawer was opened.
    if (previousUrl) window.history.pushState({}, null, previousUrl);

    // Remove everything from the DOM.
    container.remove();
  }
}
