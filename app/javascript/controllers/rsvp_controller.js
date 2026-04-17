import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rsvp"
export default class extends Controller {
  static targets = [
    "nameInput",
    "dropdown",
    "option",
    "guestId",
    "yesFields",
    "noFields",
    "submitButton"
  ]

  connect() {
    this.updateAttendanceFields()
  }

  filter() {
    const value = this.nameInputTarget.value.toLowerCase()

    this.optionTargets.forEach(el => {
      el.classList.toggle(
        "hidden",
        !el.dataset.name.toLowerCase().includes(value)
      )
    })

    this.dropdowntarget.classList.remove("hidden")
  }

  select(event) {
    const el = event.currentTarget

    this.nameInputTarget.value = el.innerText
    this.guestIdTarget.value = el.dataset.id

    this.dropdownTarget.classList.add("hidden")
  }

  show() {
    this.dropdownTarget.classList.remove("hidden")
  }

  hide() {
    setTimeout(() => {
      this.dropdownTarget.classList.add("hidden")
    }, 100)
  }

  updateAttendanceFields() {
    const checkedRadio = this.element.querySelector('input[name="rsvp[attending]"]:checked')

    if (!checkedRadio) {
      this.hideTarget(this.yesFieldsTarget)
      this.hideTarget(this.noFieldsTarget)
      this.hideTarget(this.submitButtonTarget)
      return
    }

    if (checkedRadio.value === "true") {
      this.showTarget(this.yesFieldsTarget)
      this.hideTarget(this.noFieldsTarget)
      this.showTarget(this.submitButtonTarget)
    } else {
      this.hideTarget(this.yesFieldsTarget)
      this.showTarget(this.noFieldsTarget)
      this.showTarget(this.submitButtonTarget)
    }
  }

  showTarget(target) {
    target.classList.remove("hidden")
  }

  hideTarget(target) {
    target.classList.add("hidden")
  }
}
