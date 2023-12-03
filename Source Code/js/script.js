document.addEventListener('DOMContentLoaded', function () {
    const profilePicture = document.querySelector('.profile-picture');
    const dropdown = document.querySelector('.dropdown');

    profilePicture.addEventListener('mouseenter', () => {
        dropdown.style.display = 'block';
    });

    profilePicture.addEventListener('mouseleave', () => {
        dropdown.style.display = 'none';
    });
});
