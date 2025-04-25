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
    // const profileNameInput = document.getElementById("profile-name")
    // const profileEmailInput = document.getElementById("profile-email")
    // const passengerNameElement = document.getElementById("passenger-name")
    // const profileImg = document.getElementById("profile-img")
    // const modalProfileImg = document.getElementById("modal-profile-img")
    // const changePhotoBtn = document.getElementById("change-photo-btn")

    // Store original values to revert if canceled
    // let originalName = profileNameInput.value
    // let originalEmail = profileEmailInput.value
    // let originalPhoto = modalProfileImg.src

    // Open modal
    editProfileBtn.addEventListener("click", () => {
        // // Store current values as originals
        // originalName = profileNameInput.value
        // originalEmail = profileEmailInput.value
        // originalPhoto = modalProfileImg.src

        modal.classList.add("active")
    })

    // Close modal functions
    function closeModal() {
        modal.classList.remove("active")
    }

    closeModalBtn.addEventListener("click", closeModal)
    cancelChangesBtn.addEventListener("click", () => {
        // // Revert to original values
        // profileNameInput.value = originalName
        // profileEmailInput.value = originalEmail
        // modalProfileImg.src = originalPhoto

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
        // // Update the displayed name
        // passengerNameElement.textContent = profileNameInput.value
        //
        // // Update profile image
        // profileImg.src = modalProfileImg.src

        // // Show success message (could be enhanced with a toast notification)
        // alert("Profile updated successfully!")

        closeModal()
    })

    // // Change photo functionality
    // changePhotoBtn.addEventListener("click", () => {
    //     // In a real application, this would open a file picker
    //     // For this demo, we'll just use a prompt to enter a URL
    //     const newPhotoUrl = prompt("Enter URL for new profile photo:", modalProfileImg.src)
    //
    //     if (newPhotoUrl && newPhotoUrl.trim() !== "") {
    //         modalProfileImg.src = newPhotoUrl
    //     }
    // })
})
