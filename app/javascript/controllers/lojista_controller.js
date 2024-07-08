import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="lojista"
export default class extends Controller {
    static targets = ["itemsList", "itemForm", "template"]
    connect() {
    }

    addItem(event) {
        event.preventDefault()

        let newId = this.itemFormTargets.length + 1
        const itemsList = this.itemsListTarget;

        let newForm = template.content.cloneNode(true);
        newForm.querySelectorAll('input').forEach(field => {
            field.id = field.id.replace("NEW_RECORD", newId);
            field.name = field.name.replace("NEW_RECORD", newId);
        })

        itemsList.append(newForm)
    }
}
