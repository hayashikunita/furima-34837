window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   
   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = priceInput.value * 0.1;
   console.log(addTaxDom);
  //  const a = Math.floor(inputValue * 0.1)として引き算にしてもいい。
   const profit = document.getElementById("profit");
   profit.innerHTML = Math.floor(priceInput.value * 0.9);
  //  priceInput.value - addTaxDom.innerHTML
   console.log(profit);
})
});

// def = const railsでいうdefと同じ