
document.getElementById('openContactWindow').addEventListener('click', function() {
    document.querySelector('.contact-window').style.display = 'block';
});

document.querySelector('.contact-window').addEventListener('click', function(e) {
    if (e.target === this) {
        this.style.display = 'none';
    }
});