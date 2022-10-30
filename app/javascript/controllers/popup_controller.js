import { Controller } from "@hotwired/stimulus"

const HIDDEN_CLASS = 'u-is-hidden';
const BLURRED_CLASS = 'u-is-blurred';

const MAIN_CONTAINER_ID = 'main-container';

export default class extends Controller {
  openPopup(event) {
    event.preventDefault();
    event.stopPropagation();

    const popupId = event.params["id"];
    const popupElem = document.getElementById(popupId);
    const mainContainer = document.getElementById(MAIN_CONTAINER_ID);

    if (popupElem.classList.contains(HIDDEN_CLASS)) {
      popupElem.classList.remove(HIDDEN_CLASS);
      mainContainer.classList.add(BLURRED_CLASS);
    }
  }

  closePopup(event) {
    event.preventDefault();
    event.stopPropagation();

    const popupId = event.params["id"];
    const popupElem = document.getElementById(popupId);
    const mainContainer = document.getElementById(MAIN_CONTAINER_ID);

    popupElem.classList.add(HIDDEN_CLASS);
    if (mainContainer.classList.contains(BLURRED_CLASS)) {
      mainContainer.classList.remove(BLURRED_CLASS);
    }
  }
}
