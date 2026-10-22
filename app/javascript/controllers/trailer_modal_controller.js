import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "backdrop", "content", "iframeContainer", "title"]

  connect() {
    this.onEscape = this.onEscape.bind(this)
    document.addEventListener("keydown", this.onEscape)
  }

  disconnect() {
    document.removeEventListener("keydown", this.onEscape)
  }

  open(event) {
    const youtubeId = event.currentTarget.dataset.youtubeId
    const animeTitle = event.currentTarget.dataset.title || "Official Trailer"

    if (!youtubeId) return

    if (this.hasTitleTarget) {
      this.titleTarget.textContent = animeTitle
    }

    if (this.hasIframeContainerTarget) {
      this.iframeContainerTarget.innerHTML = `
        <iframe
          src="https://www.youtube-nocookie.com/embed/${youtubeId}?autoplay=1&rel=0&modestbranding=1"
          title="${animeTitle}"
          class="w-full h-full rounded-lg"
          frameborder="0"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
          allowfullscreen>
        </iframe>
      `
    }

    this.modalTarget.classList.remove("hidden")
    requestAnimationFrame(() => {
      this.modalTarget.classList.remove("opacity-0")
      this.modalTarget.classList.add("opacity-100")
      this.contentTarget.classList.remove("scale-95")
      this.contentTarget.classList.add("scale-100")
    })
    document.body.classList.add("overflow-hidden")
  }

  close() {
    this.modalTarget.classList.remove("opacity-100")
    this.modalTarget.classList.add("opacity-0")
    this.contentTarget.classList.remove("scale-100")
    this.contentTarget.classList.add("scale-95")

    setTimeout(() => {
      this.modalTarget.classList.add("hidden")
      if (this.hasIframeContainerTarget) {
        this.iframeContainerTarget.innerHTML = ""
      }
      document.body.classList.remove("overflow-hidden")
    }, 250)
  }

  onEscape(e) {
    if (e.key === "Escape" && !this.modalTarget.classList.contains("hidden")) {
      this.close()
    }
  }
}
