import Inputmask from "inputmask";

export function phoneInputMask() {
  const phoneFields = document.querySelectorAll(".phone-mask");

  phoneFields.forEach((field) => {
    const mask = new Inputmask("(99) 99999-9999");
    mask.mask(field);
  });
}

export function percentageInputMask(){
  const percentageFields = document.querySelectorAll(".percentage-mask");

  percentageFields.forEach((field) => {
    const mask = new Inputmask({
      alias: "decimal",
      radixPoint: ".",
      groupSeparator: ",",
      digits: 2,
      autoGroup: true,
      suffix: " %",
      rightAlign: false,
      allowMinus: false,
      max: 100,
    });

    mask.mask(field);
  });
}
export function moneyInputMask() {
  const moneyFields = document.querySelectorAll(".money-mask");

  moneyFields.forEach((field) => {
    if (!field.inputmask) {
      console.log('123')
      const mask = new Inputmask({
        alias: "numeric",
        prefix: "R$ ",
        groupSeparator: ".",
        radixPoint: ",",
        autoGroup: true,
        digits: 2,
        digitsOptional: false,
        rightAlign: false,
        allowMinus: false,
        max: 9999999999.99,
      });
      mask.mask(field);
    }
  });
}

export function cpfInputMask() {
  const cpfFields = document.querySelectorAll(".cpf-mask");

  cpfFields.forEach((field) => {
    if (!field.inputmask) {
      const mask = new Inputmask("999.999.999-99");
      mask.mask(field);
    }
  });
}

export function cepInputMask() {
  const cepFields = document.querySelectorAll(".cep-mask");

  cepFields.forEach((field) => {
    if (!field.inputmask) {
      const mask = new Inputmask("99999-999");
      mask.mask(field);
    }
  });
}
