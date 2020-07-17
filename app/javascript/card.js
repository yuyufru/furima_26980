const pay = () => {
  Payjp.setPublicKey(pk_test_69392620b226962964f3d12a);
  const form = document.getElementById("form-text");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("form-text");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("form-text");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("form-text").submit();
        document.getElementById("form-text").reset();
      } else {
      }
    });
  });
};

window.addEventListener("load", pay);