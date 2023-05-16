import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "add", "remove", "template", "field" ]

    add() {
        let form = document.querySelector("form#passenger")
        let temp = document.querySelector("template")
        let cont = temp.content.cloneNode(true)

        let inFields = form.querySelectorAll("#passenger-field")
        let last = inFields[inFields.length - 1]

        form.insertBefore(cont, last.nextSibling)

        let els = form.querySelectorAll("#passenger-field")

        for (let i = 0; i < els.length; i++) {
            els[i].childNodes[1].childNodes[3].id = `booking_passengers_attributes_${i}_name`
            els[i].childNodes[1].childNodes[3].name = `booking[passengers_attributes][${i}][name]`
            els[i].childNodes[3].childNodes[3].id = `booking_passengers_attributes_${i}_email`
            els[i].childNodes[3].childNodes[3].name = `booking[passengers_attributes][${i}][email]`
        }
    }

    remove() {
        let els = document.querySelector("form#passenger").querySelectorAll("#passenger-field")

        if (els.length == 1) {
            alert("You can't remove the only passenger!")
        } else {
            console.log(this.removeTarget.parentNode)
            this.removeTarget.parentNode.remove()
            for (let i = 0; i < els.length; i++) {
                els[i].childNodes[1].childNodes[3].id = `booking_passengers_attributes_${i}_name`
                els[i].childNodes[1].childNodes[3].name = `booking[passengers_attributes][${i}][name]`
                els[i].childNodes[3].childNodes[3].id = `booking_passengers_attributes_${i}_email`
                els[i].childNodes[3].childNodes[3].name = `booking[passengers_attributes][${i}][email]`
            }
        }

    }
}
