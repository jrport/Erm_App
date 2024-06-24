import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pedidos--select"
export default class extends Controller {
    static targets = ['checkbox']
    static outlets = ['pedidos--status']

    setCheck() {
        const checkboxes = this.checkboxTargets
        const selectedBoxes = checkboxes
            .filter(box => box.checked)
            .map(checkedBox => checkedBox.name)

        if (selectedBoxes && selectedBoxes.length) {
            this.pedidosStatusOutlet.enable(selectedBoxes)
        }
        else {
            this.pedidosStatusOutlet.disable()
        }
    }

    resetAllBoxes(){
        console.log('ded')
        this.checkboxTargets.forEach(box => {
            box.checked = false
        })
        this.pedidosStatusOutlet.disable()
    }
}
