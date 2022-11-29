import { Controller } from "@hotwired/stimulus"

const HIDDEN_CLASS = 'u-is-hidden';

export default class extends Controller {
  closeFlashMessage(event) {
    event.preventDefault();
    event.stopPropagation();

    const msgId = event.params["id"];
    const messageElem = document.getElementById(msgId);

    messageElem.classList.add(HIDDEN_CLASS);
  }
}
