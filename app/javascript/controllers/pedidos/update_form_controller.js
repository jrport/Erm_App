import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pedidos--update-form"
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
        //const destroyFields = document.getElementsByName(`pedido[items_de_pedido][${button.id}][_destroy]`)

        //destroyFields.forEach(field => {
        //field.value = 1
        //})
        curRow.querySelectorAll('input').forEach(field => {
            if (field.name.includes('destroy')) {
                field.value = 1}
            //} else {
                //field.delete()
            //}
        })
        curRow.style.display = 'none'
    }
}
