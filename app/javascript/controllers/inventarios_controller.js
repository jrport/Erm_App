import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inventarios"
export default class extends Controller {
    connect() {
        console.log("oii")
    }
    search(event) {
        let filter = event.currentTarget.value.toLowerCase();
        let table = document.getElementById('table');
        let tr = table.getElementsByTagName('tr');

        for (let i = 1; i < tr.length; i++) {
            let tdArray = tr[i].getElementsByTagName('td');
            let rowContainsFilter = false;

            for (let j = 0; j < tdArray.length; j++) {
                if (tdArray[j]) {
                    let textValue = tdArray[j].textContent || tdArray[j].innerText;
                    if (textValue.toLowerCase().indexOf(filter) > -1) {
                        rowContainsFilter = true;
                        break;
                    }
                }
            }

            tr[i].style.display = rowContainsFilter ? '' : 'none';
        }
    }
}
