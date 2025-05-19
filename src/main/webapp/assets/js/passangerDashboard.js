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
    const boardingPassModal = document.getElementById('flight-boarding-pass-modal');
    const boardingPassButtons = document.querySelectorAll('[id^="flight-btn-boarding-pass"]');

    if (boardingPassModal) {
        const closeBoardingModalBtn = document.getElementById('flight-close-boarding-modal');
        const boardingModalCloseBtn = boardingPassModal.querySelector('.flight-modal-close');

        // Open boarding pass modal
        if (boardingPassButtons.length > 0) {
            boardingPassButtons.forEach(btn => {
                btn.addEventListener('click', function() {
                    boardingPassModal.style.display = 'flex';
                });
            });
        }

        // Close boarding pass modal
        if (closeBoardingModalBtn) {
            closeBoardingModalBtn.addEventListener('click', function() {
                boardingPassModal.style.display = 'none';
            });
        }

        if (boardingModalCloseBtn) {
            boardingModalCloseBtn.addEventListener('click', function() {
                boardingPassModal.style.display = 'none';
            });
        }
    }

    // Cancel Booking Modal Functions
    const cancelBookingModal = document.getElementById('flight-cancel-booking-modal');
    const cancelBookingButtons = document.querySelectorAll('[id^="flight-btn-cancel-booking"]');

    if (cancelBookingModal) {
        const keepBookingBtn = document.getElementById('flight-keep-booking');
        const confirmCancelBtn = document.getElementById('flight-confirm-cancel');
        const cancelModalCloseBtn = cancelBookingModal.querySelector('.flight-modal-close');

        // Open cancel booking modal
        if (cancelBookingButtons.length > 0) {
            cancelBookingButtons.forEach(btn => {
                btn.addEventListener('click', function() {
                    cancelBookingModal.style.display = 'flex';
                });
            });
        }

        // Close cancel booking modal
        if (keepBookingBtn) {
            keepBookingBtn.addEventListener('click', function() {
                cancelBookingModal.style.display = 'none';
            });
        }

        if (confirmCancelBtn) {
            confirmCancelBtn.addEventListener('click', function() {
                // Here you would typically send a request to cancel the booking
                // For this demo, we'll just close the modal
                cancelBookingModal.style.display = 'none';
                // You could add additional code here to handle the actual cancellation
            });
        }

        if (cancelModalCloseBtn) {
            cancelModalCloseBtn.addEventListener('click', function() {
                cancelBookingModal.style.display = 'none';
            });
        }
    }

    // Close modals when clicking outside of them
    window.addEventListener('click', function(event) {
        if (boardingPassModal && event.target === boardingPassModal) {
            boardingPassModal.style.display = 'none';
        }
        if (cancelBookingModal && event.target === cancelBookingModal) {
            cancelBookingModal.style.display = 'none';
        }
    });

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
