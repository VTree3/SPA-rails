import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['focus']  
    connect() {
      this.element.addEventListener("submit", clear);
    }
  
    clear() {
      this.element.reset();
      this.focusTarget.focus();
    }
}
  