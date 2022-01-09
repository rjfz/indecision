import { Controller } from "stimulus"

export default class extends Controller {
  static values = { timeout: Number };

  counter = 1;
  finished = false;

  connect() {
    setInterval(
      () => {
        if (this.finished) { return }
        this.timeoutValue;
        if (this.timeoutValue == this.counter) { this.finished = true }
        this.element.innerHTML = this.timeoutValue - this.counter;
        this.counter += 1;
      },
      1000
    );
  }
}

