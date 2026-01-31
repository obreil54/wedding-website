import { Controller } from "@hotwired/stimulus"

// Drag-to-scroll for horizontal carousels
export default class extends Controller {
  static targets = ["track"]

  connect() {
    this.isDown = false
    this.startX = 0
    this.startScrollLeft = 0
    this.dragSpeed = 1.6

    // Mouse
    this.trackTarget.addEventListener("mousedown", this.onMouseDown)
    window.addEventListener("mousemove", this.onMouseMove)
    window.addEventListener("mouseup", this.onMouseUp)

    // Touch
    this.trackTarget.addEventListener("touchstart", this.onTouchStart, { passive: true })
    this.trackTarget.addEventListener("touchmove", this.onTouchMove, { passive: true })
    window.addEventListener("touchend", this.onTouchEnd)
  }

  disconnect() {
    this.trackTarget.removeEventListener("mousedown", this.onMouseDown)
    window.removeEventListener("mousemove", this.onMouseMove)
    window.removeEventListener("mouseup", this.onMouseUp)

    this.trackTarget.removeEventListener("touchstart", this.onTouchStart)
    this.trackTarget.removeEventListener("touchmove", this.onTouchMove)
    window.removeEventListener("touchend", this.onTouchEnd)
  }

  onMouseDown = (e) => {
    // only left click
    if (e.button !== 0) return
    console.log("Mouse down")
    this.isDown = true
    this.trackTarget.classList.add("dragging")
    this.startX = e.pageX
    this.startScrollLeft = this.trackTarget.scrollLeft
    e.preventDefault()
  }

  onMouseMove = (e) => {
    if (!this.isDown) return
    const dx = (e.pageX - this.startX) * this.dragSpeed
    this.trackTarget.scrollLeft = this.startScrollLeft - dx
  }

  onMouseUp = () => {
    this.isDown = false
    this.trackTarget.classList.remove("dragging")
  }

  onTouchStart = (e) => {
    this.isDown = true
    this.startX = e.touches[0].pageX
    this.startScrollLeft = this.trackTarget.scrollLeft
  }

  onTouchMove = (e) => {
    if (!this.isDown) return
    const dx = (e.touches[0].pageX - this.startX) * this.dragSpeed
    this.trackTarget.scrollLeft = this.startScrollLeft - dx
  }

  onTouchEnd = () => {
    this.isDown = false
  }
}
