import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["drawer", "backdrop"]

  connect() {
    this.onEscape = this.onEscape.bind(this)
    document.addEventListener("keydown", this.onEscape)
  }

  disconnect() {
    document.removeEventListener("keydown", this.onEscape)
  }

  toggle() {
    const isHidden = this.drawerTarget.classList.contains("translate-x-full")
    if (isHidden) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.backdropTarget.classList.remove("hidden")
    // small delay for transition
    requestAnimationFrame(() => {
      this.backdropTarget.classList.remove("opacity-0")
      this.backdropTarget.classList.add("opacity-100")
      this.drawerTarget.classList.remove("translate-x-full")
      this.drawerTarget.classList.add("translate-x-0")
    })
    document.body.classList.add("overflow-hidden")
  }

  close() {
    this.drawerTarget.classList.add("translate-x-full")
    this.drawerTarget.classList.remove("translate-x-0")
    this.backdropTarget.classList.remove("opacity-100")
    this.backdropTarget.classList.add("opacity-0")

    setTimeout(() => {
      this.backdropTarget.classList.add("hidden")
      document.body.classList.remove("overflow-hidden")
    }, 300)
  }

  onEscape(e) {
    if (e.key === "Escape") {
      this.close()
    }
  }
}
