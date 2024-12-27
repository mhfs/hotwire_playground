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
    console.log('close drawer');
    this.element.remove();
    window.history.back();
  }
}
