import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    advance: Boolean
  };

  open(e) {
    // Prevent the link navigation as we're going to handle it with Turbo below.
    e.preventDefault();

    // Clone the drawer template with proper setup into the DOM.
    this.initDrawerFrame();

    // Do this last so that frame initializes with previous url
    if (this.advanceValue) window.history.pushState({}, null, this.element.href);
  }

  initDrawerFrame() {
    // Clone the drawer frame template.
    let content = document.querySelector('template#drawer-template').content.cloneNode(true);

    // Pass the previous URL to the drawer for the inner controller to use on close.
    let container = content.querySelector('.drawer');
    let previousUrl = window.location.pathname + window.location.search;
    container.dataset.drawerPreviousUrlValue = previousUrl;

    // If advance was set on the link, set the turbo-frame to advance.
    if (this.advanceValue) {
      let frame = content.querySelector('turbo-frame');
      // Use replace instead of advance because we already pushed on `open` above.
      frame.dataset.turboAction = 'replace';
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
