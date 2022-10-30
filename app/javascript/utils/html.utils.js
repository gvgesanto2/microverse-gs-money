export const addClassToElem = (htmlElem, classToAdd) => {
  htmlElem.classList.add(classToAdd);
}

export const toggleClassFromElem = (htmlElem, classToAdd) => {
  htmlElem.classList.toggle(classToAdd);
}

export const removeClassFromElem = (htmlElem, classToAdd) => {
  if (htmlElem.classList.contains(classToAdd)) {
    htmlElem.classList.remove(classToAdd);
  }
}