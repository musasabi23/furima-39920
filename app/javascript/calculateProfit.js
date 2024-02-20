window.addEventListener('load', function(){

  const price = document.getElementById("item-price")

  price.addEventListener("input", () => {
    const inputPrice = price.value;

    const handlingFee = inputPrice * 0.1;
    var handlingfee = Math.floor(handlingFee);

    const profitCalculation = inputPrice * 0.9;
    var proFit = Math.floor(profitCalculation);


    const cost = document.getElementById("add-tax-price");
    cost.innerHTML = handlingfee;

    const profit = document.getElementById('profit');
    profit.innerHTML = proFit;

  })

});