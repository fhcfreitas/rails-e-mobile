import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ 'Rentbtn', 'rentform' ]
  open() {
    console.log("it  works");
    this.rentformTarget.classList.remove('d-none');
    console.log();
  }
  connect() {
    console.log(this.RentbtnTarget);
  }
}
