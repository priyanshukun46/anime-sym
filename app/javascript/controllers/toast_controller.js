import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.timer = setTimeout(() => {
      this.close()
    }, 4000)
  }

  disconnect() {
    if (this.timer) clearTimeout(this.timer)
  }

  close() {
    this.element.classList.add("opacity-0", "translate-y-2", "transition-all", "duration-300")
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }
}
