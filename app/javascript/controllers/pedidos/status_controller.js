import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pedidos--status"
export default class extends Controller {
    static targets = ['postBtn', 'formMessage', 'selectOptions', 'hiddenField']
    connect(){
    }

    disable(){
        this.postBtnTarget.disabled = true
        this.selectOptions.disabled = true
        this.formMessageTarget.textContent = 'Selecione algum pedido.' 
    }

    enable(selectedBoxes){
        this.hiddenFieldTarget.value = selectedBoxes
        this.postBtnTarget.disabled = false
        this.selectOptionsTarget.disabled = false
        this.formMessageTarget.textContent = 'Selecione um novo status' 
    }
}
