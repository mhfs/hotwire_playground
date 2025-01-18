import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["handle", "body"]

  connect() {
    this.isResizing = false
    this.currentX = 0
    this.initialWidth = 0

    // Bind the methods to maintain correct 'this' context
    this.startResize = this.startResize.bind(this)
    this.stopResize = this.stopResize.bind(this)
    this.resize = this.resize.bind(this)
  }

  startResize(event) {
    this.isResizing = true
    this.currentX = event.clientX
    this.initialWidth = this.bodyTarget.offsetWidth

    // Add resizing class for styling
    this.element.classList.add('resizing')
    this.handleTarget.classList.add('resizing')

    // Add event listeners for mousemove and mouseup
    document.addEventListener('mousemove', this.resize)
    document.addEventListener('mouseup', this.stopResize)
  }

  resize(event) {
    if (!this.isResizing) return

    const diffX = this.currentX - event.clientX
    const newWidth = this.initialWidth + diffX

    // Apply min/max constraints
    const minWidth = 300
    const maxWidth = Math.min(window.innerWidth * 0.8, 800)

    if (newWidth >= minWidth && newWidth <= maxWidth) {
      this.bodyTarget.style.width = `${newWidth}px`
    }
  }

  stopResize() {
    this.isResizing = false

    // Remove resizing classes
    this.element.classList.remove('resizing')
    this.handleTarget.classList.remove('resizing')

    // Remove event listeners
    document.removeEventListener('mousemove', this.resize)
    document.removeEventListener('mouseup', this.stopResize)
  }
}
