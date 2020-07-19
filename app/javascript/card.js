const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("form_a");
  console.log(form)
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("form_a");
    console.log(formResult)
    const formData = new FormData(formResult);
    console.log(...formData.entries());
    const card = {
      number: formData.get("item_purchase[number]"),
      cvc: formData.get("item_purchase[cvc]"),
      exp_month: formData.get("item_purchase[exp_month]"),
      exp_year: `20${formData.get("item_purchase[exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        console.log("aaa")
        const token = response.id;
        const renderDom = document.getElementById("form_a");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        document.getElementById("number").removeAttribute("name");
        document.getElementById("item_purchase_cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("form_a").submit();
        document.getElementById("form_a").reset();
      } else {
        document.getElementById("form_a").submit();
        console.log(response.error)
      }
    });
  });
};

window.addEventListener("load", pay);