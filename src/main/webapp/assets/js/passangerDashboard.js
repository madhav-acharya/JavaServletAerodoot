document.addEventListener("DOMContentLoaded", () => {

    // Tab navigation
    const upcomingTab = document.getElementById('flight-tab-upcoming');
    const pastTab = document.getElementById('flight-tab-past');
    const upcomingContent = document.getElementById('flight-content-upcoming');
    const pastContent = document.getElementById('flight-content-past');

    upcomingTab.addEventListener('click', function() {
        upcomingTab.classList.add('active');
        pastTab.classList.remove('active');
        upcomingContent.classList.add('active');
        pastContent.classList.remove('active');
    });

    pastTab.addEventListener('click', function() {
        pastTab.classList.add('active');
        upcomingTab.classList.remove('active');
        pastContent.classList.add('active');
        upcomingContent.classList.remove('active');
    });

    // Boarding Pass Modal Functions
    const boardingPassModals = document.querySelectorAll('[id^="flight-boarding-pass-modal-"]');
    const boardingPassButtons = document.querySelectorAll('[id^="flight-btn-boarding-pass-"]');

    // Setup boarding pass modals
    if (boardingPassButtons.length > 0) {
        boardingPassButtons.forEach(btn => {
            // Extract the booking ID from the button ID
            const bookingId = btn.id.replace('flight-btn-boarding-pass-', '');
            const correspondingModal = document.getElementById(`flight-boarding-pass-modal-${bookingId}`);

            if (correspondingModal) {
                // Setup open modal event
                btn.addEventListener('click', function() {
                    correspondingModal.style.display = 'flex';
                });

                // Setup close events for this specific modal
                const closeModalBtn = correspondingModal.querySelector('.flight-modal-close');
                const closeActionBtn = correspondingModal.querySelector('[id^="flight-close-boarding-modal-"]');

                if (closeModalBtn) {
                    closeModalBtn.addEventListener('click', function() {
                        correspondingModal.style.display = 'none';
                    });
                }

                if (closeActionBtn) {
                    closeActionBtn.addEventListener('click', function() {
                        correspondingModal.style.display = 'none';
                    });
                }

                // Close modal when clicking outside
                window.addEventListener('click', function(event) {
                    if (event.target === correspondingModal) {
                        correspondingModal.style.display = 'none';
                    }
                });
            }
        });
    }

    // Cancel Booking Modal Functions
    const cancelBookingModals = document.querySelectorAll('[id^="flight-cancel-booking-modal-"]');
    const cancelBookingButtons = document.querySelectorAll('[id^="flight-btn-cancel-booking-"]');

    // Setup cancel booking modals
    if (cancelBookingButtons.length > 0) {
        cancelBookingButtons.forEach(btn => {
            // Extract the booking ID from the button ID
            const bookingId = btn.id.replace('flight-btn-cancel-booking-', '');
            const correspondingModal = document.getElementById(`flight-cancel-booking-modal-${bookingId}`);

            if (correspondingModal) {
                // Setup open modal event
                btn.addEventListener('click', function() {
                    correspondingModal.style.display = 'flex';
                });

                // Setup close events for this specific modal
                const closeModalBtn = correspondingModal.querySelector('.flight-modal-close');
                const keepBookingBtn = correspondingModal.querySelector(`#flight-keep-booking-${bookingId}`);
                const confirmCancelBtn = correspondingModal.querySelector(`#flight-confirm-cancel-${bookingId}`);

                if (closeModalBtn) {
                    closeModalBtn.addEventListener('click', function() {
                        correspondingModal.style.display = 'none';
                    });
                }

                if (keepBookingBtn) {
                    keepBookingBtn.addEventListener('click', function() {
                        correspondingModal.style.display = 'none';
                    });
                }

                if (confirmCancelBtn) {
                    confirmCancelBtn.addEventListener('click', function() {
                        correspondingModal.style.display = 'none';
                    });
                }

                // Close modal when clicking outside
                window.addEventListener('click', function(event) {
                    if (event.target === correspondingModal) {
                        correspondingModal.style.display = 'none';
                    }
                });
            }
        });
    }

    // Profile modal functionality
    const modal = document.getElementById("profile-modal")
    const editProfileBtn = document.getElementById("edit-profile-btn")
    const closeModalBtn = document.getElementById("close-modal")
    const cancelChangesBtn = document.getElementById("cancel-changes")
    const saveChangesBtn = document.getElementById("save-changes")

    // Open modal
    editProfileBtn.addEventListener("click", () => {
        modal.classList.add("active")
    })

    // Close modal functions
    function closeModal() {
        modal.classList.remove("active")
    }

    closeModalBtn.addEventListener("click", closeModal)
    cancelChangesBtn.addEventListener("click", () => {
        closeModal()
    })

    // Close modal when clicking outside
    modal.addEventListener("click", (e) => {
        if (e.target === modal) {
            closeModal()
        }
    })

    // Save changes
    saveChangesBtn.addEventListener("submit", (e) => {
        e.preventDefault();
    })
})
