import { Controller } from "stimulus"
import { percentageInputMask, moneyInputMask } from "./shared";

export default class extends Controller {
  connect() {
    this.callMasks();
  }

	callMasks() {
    moneyInputMask();
    percentageInputMask();
  }
}