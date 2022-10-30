// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// import "./setup-scroll"

import ScrollBooster from "scrollbooster";

const setupScrolls = () => {
  const viewports = document.querySelectorAll(".u-scroll-viewport");
  const contents = document.querySelectorAll(".u-scroll-content");

  viewports.forEach((viewport, index) => {
    new ScrollBooster({
      viewport,
      content: contents[index],
      direction: "horizontal",
      scrollMode: "native",
    });
  });
}

function init() {
  setupScrolls();
} 

document.addEventListener("DOMSubtreeModified", init);

if (document.readyState !== "loading") {
  init();
} else {
  document.addEventListener("DOMContentLoaded", init);
}