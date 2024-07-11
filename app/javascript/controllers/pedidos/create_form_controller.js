import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pedidos--form"
export default class extends Controller {
    static targets = ["template", "itemsList"]

    addItem() {
        const template = this.templateTarget;
        const itemsList = this.itemsListTarget;

        let newId, newForm

        newId = itemsList.querySelectorAll('div#itemForm').length + 1;

        newForm = template.content.cloneNode(true);
        newForm.querySelectorAll('input').forEach(field => {
            field.id = field.id.replace("NEW_RECORD", newId);
            field.name = field.name.replace("NEW_RECORD", newId);
        })

        itemsList.append(newForm)
    }

    removeItem(event) {
        const button = event.currentTarget
        const curRow = button.parentNode
        curRow.remove()
    }
}
