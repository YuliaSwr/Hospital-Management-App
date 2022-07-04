function showPopup() {
    let body = document.querySelector("body");
    body.style.overflow = "hidden";

    body.classList.add("show");
}

function closePopup() {
    let body = document.querySelector("body");
    body.style.overflow = "auto";

    body.classList.remove("show");

    let inputs = document.querySelectorAll(".form-input");

    inputs.forEach(input => {
        input.value = "";
    });
}
