import { Controller } from "stimulus";

export default class extends Controller {

  static values = { timeout: Number };
  connect() {
    setTimeout(
      () => this.element.classList.toggle("opacity-0"),
      this.timeoutValue
    );

    setTimeout(
      () => this.element.classList.toggle("translate-x-2"),
      this.timeoutValue
    );
    setTimeout(
      () => this.element.parentElement.remove(),
      this.timeoutValue + 700
      );
    }
  }
