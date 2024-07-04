  document.addEventListener('DOMContentLoaded', () => {
    const priceInput = document.getElementById("item-price");

    priceInput.addEventListener('input', (e) => {
        const inputValue = parseFloat(priceInput.value);
        const addTaxDom = document.getElementById('add-tax-price');
        const profitDom = document.getElementById('profit');

      if (isNaN(inputValue) || inputValue < 300 || inputValue > 9999999) {
            addTaxDom.innerHTML = '';
            profitDom.innerHTML = '';
            console.log("価格は¥300から¥9,999,999の間で入力してください。");
            return;
        }
        const tax = Math.floor(inputValue * 0.1);
        const profit = inputValue - tax;

        addTaxDom.innerHTML = tax;
        profitDom.innerHTML = profit;
        
        e.preventDefault();

        console.log(`入力金額: ${inputValue}, 販売手数料: ${tax}, 販売利益: ${profit}`);
    });
});
