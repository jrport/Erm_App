import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pedidos--item-form"
export default class extends Controller {
    static targets = ['template', 'itemsList'] 
    addRow() {
        const template = this.templateTarget;
        const itemsList = this.itemsListTarget;

        let newId, newForm

        newId = itemsList.querySelectorAll('div#item_form').length + 1;
        console.log(newId)
        
        newForm = template.content.cloneNode(true);
        newForm.querySelectorAll('input').forEach(field => {
            field.id = field.id.replace("NEW_RECORD", newId);
            field.name = field.name.replace("NEW_RECORD", newId);
        })
        console.log(newForm)

        itemsList.append(newForm)
    }

    deleteRow(event) {
        const button = event.currentTarget
        const curRow = button.parentNode
        curRow.remove()
    }
}
