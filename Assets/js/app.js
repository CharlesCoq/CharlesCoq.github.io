// var modal = document.getElementById("modalCss");

// // Get the button that opens the modal
// var btn = document.getElementById("btnCss");

// // Get the <span> element that closes the modal
// var span = document.getElementsByClassName("close")[0];

// // When the user clicks the button, open the modal 
// btn.onclick = function () {
//     modal.style.display = "block";
// }

// // When the user clicks on <span> (x), close the modal
// span.onclick = function () {
//     modal.style.display = "none";
// }

// // When the user clicks anywhere outside of the modal, close it
// window.onclick = function (event) {
//     if (event.target == modal) {
//         modal.style.display = "none";
//     }
// }


//--------------- Modal box---------------

// 'use strict';

const modals = document.querySelectorAll('.modal');
const overlays = document.querySelectorAll('.overlay');
const btnCloseModals = document.querySelectorAll('.close-modal');
const btnOpenModals = document.querySelectorAll('.show-modal');
const body = document.body;

function openModal(index) {


    modals[index].classList.remove('hidden');
    overlays[index].classList.remove('hidden');
    body.classList.add('modal-open');

}

function closeModal(index) {
    modals[index].classList.add('hidden');
    overlays[index].classList.add('hidden');
    body.classList.remove('modal-open');
}

btnOpenModals.forEach((btn, index) => {
    btn.addEventListener('click', () => openModal(index));
});

btnCloseModals.forEach((btn, index) => {
    btn.addEventListener('click', () => closeModal(index));
});

overlays.forEach((overlay, index) => {
    overlay.addEventListener('click', () => closeModal(index));
});

document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
        modals.forEach((modal, index) => {
            if (!modal.classList.contains('hidden')) {
                closeModal(index);
            }
        });
    }
});


//--------------- Switch incon degree's box---------------

function changeIcon1() {
    var icon1 = document.getElementById("eyeClose1");

    if (icon1.src.match("EyeClose.png")) {
        icon1.src = "../Assets/Icon/Formations/EyeOpen.png";
    } else {
        icon1.src = "../Assets/Icon/Formations/EyeClose.png";
    }
};

function changeIcon2() {
    var icon2 = document.getElementById("eyeClose2");

    if (icon2.src.match("EyeClose.png")) {
        icon2.src = "../Assets/Icon/Formations/EyeOpen.png";
    } else {
        icon2.src = "../Assets/Icon/Formations/EyeClose.png";
    }
};

function changeIcon3() {
    var icon3 = document.getElementById("eyeClose3");

    if (icon3.src.match("EyeClose.png")) {
        icon3.src = "../Assets/Icon/Formations/EyeOpen.png";
    } else {
        icon3.src = "../Assets/Icon/Formations/EyeClose.png";
    }
};

