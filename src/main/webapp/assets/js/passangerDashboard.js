document.addEventListener("DOMContentLoaded", () => {
    // Tab switching functionality
    const tabButtons = document.querySelectorAll(".tab-btn")
    const tabContents = document.querySelectorAll(".tab-content")

    tabButtons.forEach((button) => {
        button.addEventListener("click", () => {
            // Remove active class from all buttons and contents
            tabButtons.forEach((btn) => btn.classList.remove("active"))
            tabContents.forEach((content) => content.classList.remove("active"))

            // Add active class to clicked button
            button.classList.add("active")

            // Show corresponding content
            const tabId = button.getAttribute("data-tab")
            document.getElementById(`${tabId}-tab`).classList.add("active")
        })
    })

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
    saveChangesBtn.addEventListener("click", () => {
        closeModal()
    })
})
