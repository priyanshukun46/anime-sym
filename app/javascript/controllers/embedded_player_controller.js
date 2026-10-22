import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["iframe", "errorOverlay", "errorMessage", "externalLink"]

  connect() {
    this.handleMessage = this.handleMessage.bind(this)
    window.addEventListener("message", this.handleMessage)
  }

  disconnect() {
    window.removeEventListener("message", this.handleMessage)
  }

  handleMessage(event) {
    if (!event.data || typeof event.data !== "string") return

    try {
      const data = JSON.parse(event.data)
      // Check for YouTube iframe API error messages
      if (data.event === "onError") {
        const errorCode = data.info
        this.showPlaybackError(errorCode)
      }
    } catch (e) {
      // Ignore non-json postMessages
    }
  }

  showPlaybackError(errorCode) {
    let message = "This video is unavailable or restricted in your region by the official licensor."
    if (errorCode === 101 || errorCode === 150) {
      message = "The publisher does not allow this video to be played in embedded players outside of their official channel."
    } else if (errorCode === 100) {
      message = "The video cannot be found or is unavailable."
    }

    if (this.hasErrorMessageTarget) {
      this.errorMessageTarget.textContent = message
    }

    if (this.hasErrorOverlayTarget) {
      this.errorOverlayTarget.classList.remove("hidden")
      requestAnimationFrame(() => {
        this.errorOverlayTarget.classList.remove("opacity-0")
        this.errorOverlayTarget.classList.add("opacity-100")
      })
    }
  }

  reportIssue() {
    this.showPlaybackError(101)
  }

  hideError() {
    if (this.hasErrorOverlayTarget) {
      this.errorOverlayTarget.classList.add("opacity-0")
      setTimeout(() => {
        this.errorOverlayTarget.classList.add("hidden")
      }, 300)
    }
  }
}
