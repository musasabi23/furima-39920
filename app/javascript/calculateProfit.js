function calculateProfit (){
  const price = document.getElementById("item-price")
  if (price) {

    price.addEventListener("input", () => {
      const inputPrice = price.value;

      const handlingFee = inputPrice * 0.1;
      const handlingfee = Math.floor(handlingFee);

      const profitCalculation = inputPrice * 0.9;
      const proFit = Math.floor(profitCalculation);


      const cost = document.getElementById("add-tax-price");
      cost.innerHTML = handlingfee;

      const profit = document.getElementById('profit');
      profit.innerHTML = proFit;
    });
  };
};
window.addEventListener('turbo:load', calculateProfit);
window.addEventListener("turbo:render", calculateProfit);