import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  close() {
    console.log('close drawer');
    this.element.remove();
    window.history.back();
  }
}
