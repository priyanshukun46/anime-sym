import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "dropdown", "results"]

  connect() {
    this.timeout = null
    this.closeOnOutsideClick = this.closeOnOutsideClick.bind(this)
    document.addEventListener("click", this.closeOnOutsideClick)
  }

  disconnect() {
    document.removeEventListener("click", this.closeOnOutsideClick)
    if (this.timeout) clearTimeout(this.timeout)
  }

  onInput() {
    clearTimeout(this.timeout)
    const query = this.inputTarget.value.trim()

    if (query.length < 2) {
      this.close()
      return
    }

    this.timeout = setTimeout(() => {
      this.fetchResults(query)
    }, 250)
  }

  async fetchResults(query) {
    try {
      const response = await fetch(`/search_suggestions?q=${encodeURIComponent(query)}`, {
        headers: { "Accept": "text/html" }
      })
      if (response.ok) {
        const html = await response.text()
        this.resultsTarget.innerHTML = html
        this.open()
      }
    } catch (e) {
      console.error("Search suggestion error:", e)
    }
  }

  open() {
    this.dropdownTarget.classList.remove("hidden")
  }

  close() {
    this.dropdownTarget.classList.add("hidden")
  }

  closeOnOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }

  onKeydown(event) {
    if (event.key === "Escape") {
      this.close()
      this.inputTarget.blur()
    }
  }
}
