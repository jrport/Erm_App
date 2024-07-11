import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="compras"
export default class extends Controller {
    static targets = ['modal', 'lojaField', 'lojaSelector', 'itemsList', 'template', 'itemForm']

    connect() {
        this.setLoja()
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
        this.setLoja()
    }

    removeItem(event) {
        const button = event.currentTarget
        const curRow = button.parentNode
        curRow.remove()
    }

    setLoja() {
        let lojaId = this.lojaSelectorTarget.value
        this.lojaFieldTargets.forEach(field => {
                field.value = lojaId
        })
    }

    deleteItem(event){
        event.preventDefault()
        const button = event.currentTarget
        const curRow = button.parentNode
        curRow.querySelector('input[name*="_destroy"]').value = 1
        curRow.style.display = 'none'
    }

    showAnexoModal() {
        this.modalTarget.classList.remove('hidden')
    }

    closeAnexoModal() {
        this.modalTarget.classList.add('hidden')
    }
}
