import { Controller } from "@hotwired/stimulus"
import { addClassToElem, removeClassFromElem } from "../utils/html.utils";

export default class extends Controller {
  handleTransactionTypeSelection(event) {
    event.preventDefault();
    event.stopPropagation();

    const BUTTON_ACTIVE_CLASS = "c-outline-btn--active"; 
    const BUTTON_CLASS = "transaction-type-select-btn";

    const inputId = event.params["inputid"];
    const selectedBtnId = event.params["buttonid"];

    const hiddenFormInput = document.getElementById(inputId);
    
    const typeSelectButtons = document.querySelectorAll(`.${BUTTON_CLASS}`);

    typeSelectButtons.forEach((button) => {
      if (button.id === selectedBtnId) {
        addClassToElem(button, BUTTON_ACTIVE_CLASS);
        hiddenFormInput.value = button.getAttributeNode("value").nodeValue;
      } else {
        removeClassFromElem(button, BUTTON_ACTIVE_CLASS);
      }
    });
  }

  
}
