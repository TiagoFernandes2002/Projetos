const display = document.querySelector('#display');
const buttons = document.querySelectorAll('button');

buttons.forEach((item) =>{
    item.onclick = () => {
        if(item.id == 'clear') {
            display.innerText = '';
        }
        else if(item.id == 'backspace' )//&& display.innerText != '')
        {
            let string = display.innerText.tostring();
            display.innerText = string.subtr(0, string.length -1);
        }
        /*else if (item.id == 'backspace' && display.innerText == '')
        {
            display.innerText = '!!Vazio!!';
            setTimeout(()=> (display.innerText = ''),2000);
        }*/
        else if(item.id == 'igual' && display.innerText != '')
        {
            display.innerText = eval(display.innerText);
        }
        else if(item.id == 'igual' && display.innerText == '')
        {
            display.innerText = '!!Vazio!!';
            setTimeout(()=> (display.innerText = ''),2000);
        }
        else
        {
            display.innerText += item.id;
        }
        
    }
})


const themeToggleBtn = document.querySelector('.theme-toggler');
const calculator = document.querySelector('.calculator');
const toggleIcon = document.querySelector('toggler-icon');
let isDark = true;
themeToggleBtn.onclick = () => {
    calculator.classList.toggle('dark');
    themeToggleBtn.classList('active');
    isDark = !isDark;
}