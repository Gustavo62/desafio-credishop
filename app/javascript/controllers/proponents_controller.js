import { Controller } from "stimulus"
import { phoneInputMask, moneyInputMask, cpfInputMask, cepInputMask } from "./shared";

export default class extends Controller {
  connect() {
    const controllerName = document.body.dataset.controller
    const actionName = document.body.dataset.action

    if (controllerName === "proponents" && actionName === "index") {
      this.handleIndex()
    } else if (controllerName === "proponents" && actionName === "show") {
      this.handleShow()
    } else if (controllerName === "proponents" && actionName === "new") {
      this.handleNew()
    }

    this.callMasks();
  }

  handleIndex() {
  }

  handleShow() {
  }

  handleNew() {
  }

  callMasks() {
    phoneInputMask();
    moneyInputMask();
    cpfInputMask();
    cepInputMask();
  }

  calculateDiscount(event) {
    let salary = parseFloat(event.target.value.replace('R$', '').replace(/\./g, '').replace(',', '.'));

    if (!salary || isNaN(salary)) {
      return;
    }

    fetch(`/proponents/calculate_discount_inss_tax_salary?salary=${encodeURIComponent(salary)}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      }
    })
    .then(response => response.json())
    .then(data => {
      if (data.inss_discount) {
        document.getElementById("proponent_inss_discount").value = data.inss_discount;
        moneyInputMask();
      } else {
        console.error("Erro ao calcular o desconto INSS", data);
      }
    })
    .catch(error => {
      console.error("Erro na requisição:", error);
    });
  }

  addNestedField(event) {
    setTimeout(() => {
      phoneInputMask();
      moneyInputMask();
      cpfInputMask();
      cepInputMask();
    }, 0)
  }
}
