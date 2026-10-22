import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["playerContainer", "sidebar", "ambientLight", "theaterButtonText", "shareToast"]

  connect() {
    this.isTheater = false
  }

  toggleTheater() {
    this.isTheater = !this.isTheater

    if (this.isTheater) {
      this.playerContainerTarget.classList.remove("lg:col-span-8")
      this.playerContainerTarget.classList.add("lg:col-span-12")
      if (this.hasSidebarTarget) {
        this.sidebarTarget.classList.remove("lg:col-span-4")
        this.sidebarTarget.classList.add("lg:col-span-12", "mt-8")
      }
      if (this.hasTheaterButtonTextTarget) {
        this.theaterButtonTextTarget.textContent = "Standard Mode"
      }
    } else {
      this.playerContainerTarget.classList.remove("lg:col-span-12")
      this.playerContainerTarget.classList.add("lg:col-span-8")
      if (this.hasSidebarTarget) {
        this.sidebarTarget.classList.remove("lg:col-span-12", "mt-8")
        this.sidebarTarget.classList.add("lg:col-span-4")
      }
      if (this.hasTheaterButtonTextTarget) {
        this.theaterButtonTextTarget.textContent = "Theater Mode"
      }
    }
  }

  copyShareLink(event) {
    const url = window.location.href
    navigator.clipboard.writeText(url).then(() => {
      if (this.hasShareToastTarget) {
        this.shareToastTarget.classList.remove("opacity-0", "translate-y-2")
        this.shareToastTarget.classList.add("opacity-100", "translate-y-0")

        setTimeout(() => {
          this.shareToastTarget.classList.remove("opacity-100", "translate-y-0")
          this.shareToastTarget.classList.add("opacity-0", "translate-y-2")
        }, 2500)
      }
    }).catch(err => {
      console.error("Failed to copy URL:", err)
    })
  }
}
