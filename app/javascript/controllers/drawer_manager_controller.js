import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    advance: Boolean
  };

  initialize() {
    // Store the current url when the link to the drawer is rendered.
    this.previousUrl = window.location.href;
  }

  open(e) {
    // Prevent the link navigation as we're going to handle it with Turbo below.
    e.preventDefault();
    this.initDrawerFrame();
  }

  initDrawerFrame() {
    // Clone the drawer frame template
    let content = document.querySelector('template#drawer-template').content.cloneNode(true);

    // Pass the previous URL to the drawer for the inner controller to use on close
    let container = content.querySelector('.drawer');
    container.dataset.drawerPreviousUrl = this.previousUrl;

    // If advance was set on the link, set the turbo-frame to advance
    if (this.advanceValue) {
      let frame = content.querySelector('turbo-frame');
      frame.dataset.turboAction = 'advance';
    }

    // Append the drawer to the body with the loading state so that user
    // has immediate feedback on the click.
    document.body.appendChild(content);

    // TODO: remove the timeout as it just emulates network latency
    setTimeout(() => {
      Turbo.visit(this.element.href, { frame: 'drawer-frame' });
    }, 500);
  }
}
