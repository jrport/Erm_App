import { Controller } from "@hotwired/stimulus"
import JsBarcode from "jsbarcode"

// Connects to data-controller="barcode"
export default class extends Controller {
    connect() {
        this.loadJsBarcodeLibrary();
    }

    loadJsBarcodeLibrary() {
        const options = {
            format: "CODE128", // CODE39
            textAlign: "center",
            textPosition: "bottom",
            margin: 5,
            displayValue: true,
        };

        let barcodeVal = this.element.dataset.barcode;
        // frontent validation
        if (barcodeVal && barcodeVal !== "" && barcodeVal !== "-" && barcodeVal !== "undefined") {
            // generate the barcode
            JsBarcode(this.element, barcodeVal, options);
        }
    }
}
