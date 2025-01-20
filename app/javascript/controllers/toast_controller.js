import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    duration: Number,
  }

  connect() {
    this.timeoutId = setTimeout(() => {
      this.element.remove();
    }, 1000 * this.durationValue);
  }

  disconnect() {
    if (this.timeoutId) {
      clearTimeout(this.timeoutId);
      this.timeoutId = null;
    }
  }
}
