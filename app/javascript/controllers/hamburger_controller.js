import { Controller } from "@hotwired/stimulus"

const addClassToElem = (htmlElem, classToAdd) => {
  htmlElem.classList.add(classToAdd);
}

const removeClassFromElem = (htmlElem, classToAdd) => {
  if (htmlElem.classList.contains(classToAdd)) {
    htmlElem.classList.remove(classToAdd);
  }
}

const HAMBURGER_MENU_ACTIVE_CLASS = 'c-hamburger-menu--active';

export default class extends Controller {
  open(event) {
    event.preventDefault();
    event.stopPropagation();

    const hamburgerMenuId = event.params["id"];
    const hamburgerMenu = document.getElementById(hamburgerMenuId);
    
    addClassToElem(hamburgerMenu, HAMBURGER_MENU_ACTIVE_CLASS);
  }

  close(event) {
    event.preventDefault();
    event.stopPropagation();

    const hamburgerMenuId = event.params["id"];
    const hamburgerMenu = document.getElementById(hamburgerMenuId);
    
    removeClassFromElem(hamburgerMenu, HAMBURGER_MENU_ACTIVE_CLASS);
  }
}
