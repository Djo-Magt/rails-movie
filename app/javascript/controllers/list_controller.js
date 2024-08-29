import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="list"
export default class extends Controller {

  static targets = ["row", "form", "modal"]

  send(event) {
    event.preventDefault();

    fetch(this.formTarget.action,{
      method:"POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          // beforeend could also be dynamic with Stimulus values
          const modal = this.formTarget.closest('.modal')
          const modalInstance = bootstrap.Modal.getInstance(modal);
          modalInstance.hide();
          this.rowTarget.insertAdjacentHTML("beforeend", data.inserted_item)

        } else {
          console.log(this.formTarget)
          console.log(data.form)



          const modal = this.formTarget.closest('.modal')
          const modalInstance = bootstrap.Modal.getInstance(modal);
          modalInstance.show();
        }
      })
  }
}
