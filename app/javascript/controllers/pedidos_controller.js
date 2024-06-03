import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pedidos"
export default class extends Controller {
  static targets = [ 'checkbox', 'idsField', 'submitBtn' ]

  toggle() {
        const checkboxes = this.checkboxTargets;
        const idsField = this.idsFieldTarget;
        const submitBtn = this.submitBtnTarget;

        let ids = checkboxes.filter(checkbox => checkbox.checked).map(checkbox => checkbox.value);
        if (ids && ids.length != 0){
            submitBtn.disabled = false;
        }else{
            submitBtn.disabled = true;
        }
        idsField.value = ids;
  }
}
