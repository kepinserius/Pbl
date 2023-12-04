document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
  
    form.addEventListener("submit", function (event) {
      const emailInput = document.querySelector(".field.email input");
      const passwordInput = document.querySelector(".field.password input");
  
      if (emailInput.value.trim() === "" || passwordInput.value.trim() === "") {
        event.preventDefault(); // Prevent form submission
        displayPopup("Mohon masukkan email dan password terlebih dahulu");
      }
    });
  
    function displayPopup(message) {
      const popup = document.createElement("div");
      popup.className = "popup";
      popup.textContent = message;
  
      document.body.appendChild(popup);
  
      setTimeout(function () {
        popup.remove();
      }, 3000); // Remove popup after 3 seconds
    }
  });
  