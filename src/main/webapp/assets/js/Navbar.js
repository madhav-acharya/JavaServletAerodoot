document.addEventListener('DOMContentLoaded', function() {
    // Get the navbar toggle and menu elements
    const navbarToggle = document.getElementById('navbarToggle');
    const navbarMenu = document.getElementById('navbarMenu');

    // Add click event listener to the toggle button
    navbarToggle.addEventListener('click', function() {
        // Toggle the 'active' class on the menu
        navbarMenu.classList.toggle('active');

        // Animate the hamburger icon to become an X
        const bars = navbarToggle.querySelectorAll('.bar');
        bars.forEach(bar => bar.classList.toggle('active'));
    });

    // Close menu when clicking outside
    document.addEventListener('click', function(event) {
        const isClickInsideNavbar = navbarToggle.contains(event.target) ||
            navbarMenu.contains(event.target);

        if (!isClickInsideNavbar && navbarMenu.classList.contains('active')) {
            navbarMenu.classList.remove('active');

            // Reset hamburger icon
            const bars = navbarToggle.querySelectorAll('.bar');
            bars.forEach(bar => bar.classList.remove('active'));
        }
    });

    // Handle window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768 && navbarMenu.classList.contains('active')) {
            navbarMenu.classList.remove('active');

            // Reset hamburger icon
            const bars = navbarToggle.querySelectorAll('.bar');
            bars.forEach(bar => bar.classList.remove('active'));
        }
    });
});