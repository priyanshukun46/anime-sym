import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "indicator"]

  connect() {
    this.currentIndex = 0
    this.totalSlides = this.slideTargets.length
    if (this.totalSlides > 1) {
      this.startAutoplay()
    }
  }

  disconnect() {
    this.stopAutoplay()
  }

  startAutoplay() {
    this.stopAutoplay()
    this.timer = setInterval(() => {
      this.next()
    }, 7000)
  }

  stopAutoplay() {
    if (this.timer) {
      clearInterval(this.timer)
      this.timer = null
    }
  }

  goTo(event) {
    const index = parseInt(event.currentTarget.dataset.slideIndex, 10)
    if (!isNaN(index) && index !== this.currentIndex) {
      this.showSlide(index)
      this.startAutoplay()
    }
  }

  next() {
    const nextIndex = (this.currentIndex + 1) % this.totalSlides
    this.showSlide(nextIndex)
  }

  prev() {
    const prevIndex = (this.currentIndex - 1 + this.totalSlides) % this.totalSlides
    this.showSlide(prevIndex)
  }

  showSlide(index) {
    this.slideTargets.forEach((slide, idx) => {
      if (idx === index) {
        slide.classList.remove("opacity-0", "pointer-events-none", "z-0")
        slide.classList.add("opacity-100", "z-10")
      } else {
        slide.classList.remove("opacity-100", "z-10")
        slide.classList.add("opacity-0", "pointer-events-none", "z-0")
      }
    })

    this.indicatorTargets.forEach((dot, idx) => {
      if (idx === index) {
        dot.classList.add("w-8", "bg-purple-500")
        dot.classList.remove("w-2.5", "bg-zinc-600")
      } else {
        dot.classList.remove("w-8", "bg-purple-500")
        dot.classList.add("w-2.5", "bg-zinc-600")
      }
    })

    this.currentIndex = index
  }
}
