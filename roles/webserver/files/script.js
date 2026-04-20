function updatePage() {
    const name = document.getElementById('userName').value;
    const color = document.getElementById('colorPicker').value;
    
    if (name) {
        document.getElementById('greeting').innerText = `Вітаємо, ${name}!`;
    }
    document.body.style.backgroundColor = color;
}

function toggleDarkMode() {
    document.body.classList.toggle('dark-mode');
}

