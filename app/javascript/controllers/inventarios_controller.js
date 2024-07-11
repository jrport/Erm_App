import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inventarios"
export default class extends Controller {
    static targets = ['clearBtn', 'observationsModal', 'stateModal', 'transferModal', 'modal', 'editModal', 'button', 'hiddenField']
    connect() {
        console.log("oii")
    }

    setCheck(event) {
        const state = event.currentTarget.checked
        const curId = event.currentTarget.id
        const idArray = this.hiddenFieldTarget.value ? this.hiddenFieldTarget.value.split(',') : []

        if (state && !idArray.includes(curId)) {
            idArray.push(curId)
        } else if (!state && idArray.includes(curId)) {
            idArray.splice(idArray.indexOf(curId), 1)
        }

        this.hiddenFieldTarget.value = idArray.join(',')

        this.buttonTarget.disabled = idArray.length === 0
        if (idArray.length === 0 && !this.buttonTarget.classList.contains('btn-disabled')) {
            this.buttonTarget.classList.add('btn-disabled')
        } else if (idArray.length > 0 && this.buttonTarget.classList.contains('btn-disabled')) {
            this.buttonTarget.classList.remove('btn-disabled')
        }
    }

    openModal() {
        this.modalTarget.classList.remove('hidden')
    }

    closeModal() {
        this.modalTarget.classList.add('hidden')
    }

    openTransferModal() {
        this.transferModalTarget.classList.remove('hidden')
    }
    
    closeTransferModal() {
        this.transferModalTarget.classList.add('hidden')
    }

    openStateModal() {
        this.stateModalTarget.classList.remove('hidden')
    }
    
    closeStateModal() {
        this.stateModalTarget.classList.add('hidden')
    }
    openObservationsModal() {
        this.observationsModalTarget.classList.remove('hidden')
    }
    
    closeObservationsModal() {
        this.observationsModalTarget.classList.add('hidden')
    }
    clearSearch(){
        this.clearBtnTarget.click()
    }

    //search(event) {
    //let filter = event.currentTarget.value.toLowerCase();
    //let table = document.getElementById('table');
    //let tr = table.getElementsByTagName('tr');

    //for (let i = 1; i < tr.length; i++) {
    //let tdArray = tr[i].getElementsByTagName('td');
    //let rowContainsFilter = false;

    //for (let j = 0; j < tdArray.length; j++) {
    //if (tdArray[j]) {
    //let textValue = tdArray[j].textContent || tdArray[j].innerText;
    //if (textValue.toLowerCase().indexOf(filter) > -1) {
    //rowContainsFilter = true;
    //break;
    //}
    //}
    //}

    //tr[i].style.display = rowContainsFilter ? '' : 'none';
    //}
    //}
}
