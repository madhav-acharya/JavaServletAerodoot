// // // DOM Elements
// // const bookNowBtns = document.querySelectorAll('.ba-book-btn');
// // const paymentModal = document.getElementById('paymentModal');
// // const closeModal = document.getElementById('closeModal');
// // const cancelBtn = document.getElementById('cancelBtn');
// // const payNowBtn = document.getElementById('payNowBtn');
// // const paymentAmount = document.getElementById('paymentAmount');
// // const errorMessage = document.getElementById('errorMessage');
// // const totalFareDisplay = document.getElementById('totalFareDisplay');
// // const passengerCountEl = document.getElementById('passenger-count');
// // const classOptions = document.getElementById('classOptions');
// // const paymentOptions = document.getElementById('paymentOptions');
// // const economyPrice = document.getElementById('economyPrice');
// // const businessPrice = document.getElementById('businessPrice');
// // const economySeatPricePerPerson = document.getElementById('EconomySeatPricePerPerson');
// // const businessSeatPricePerPerson  = document.getElementById('BusinessSeatPricePerPerson');
// //
// // // State variables
// // let passengerCount = passengerCountEl.textContent.replace(/ passengers?/i, '');
// // console.log(passengerCount)
// //
// // let economySeatPrice = economyPrice.textContent.replace('NRs. ', '');
// // let businessSeatPrice = businessPrice.textContent.replace('NRs. ', '');
// // console.log(`Economy: ${economySeatPrice}, Business: ${businessSeatPrice}`)
// //
// // let selectedClass = 'economy';
// // let selectedPayment = 'eSewa';
// // let totalFare = calculateTotalFare();
// // console.log(`Total fare: ` + totalFare);
// //
// //
// // economySeatPricePerPerson.querySelector('span').textContent = `NRs. ${economySeatPrice} per passenger`;
// // businessSeatPricePerPerson.querySelector('span').textContent = `NRs. ${businessSeatPrice} per passenger`;
// //
// // // Calculate total fare based on class and passenger count
// // function calculateTotalFare() {
// //     const basePrice = selectedClass === 'economy'
// //         ? economySeatPrice
// //         : businessSeatPrice;
// //     return basePrice * passengerCount;
// // }
// //
// // // Update UI with calculated fare
// // function updateTotalFare() {
// //     totalFare = calculateTotalFare();
// //     totalFareDisplay.textContent = `NRs. ${totalFare}`;
// //
// //     // Reset validation
// //     validateAmount();
// // }
// //
// // // Validate payment amount
// // function validateAmount() {
// //     const amount = paymentAmount.value.trim();
// //
// //     if (amount === '') {
// //         errorMessage.classList.remove('visible');
// //         payNowBtn.disabled = true;
// //         return
// //     }
// //
// //     if (amount !== totalFare.toString()) {
// //         errorMessage.querySelector('span').textContent = `Amount must be exactly NRs. ${totalFare}`;
// //         errorMessage.classList.add('visible');
// //         payNowBtn.disabled = true;
// //     } else {
// //         errorMessage.classList.remove('visible');
// //         payNowBtn.disabled = false;
// //     }
// // }
// //
// // // Open modal
// // bookNowBtns.forEach(btn => {
// //     btn.addEventListener('click', () => {
// //         console.log('Book Now button clicked!');
// //         paymentModal.classList.add('active');
// //         updateTotalFare();
// //     });
// // })
// //
// // // Close modal
// // function closeModalHandler() {
// //     paymentModal.classList.remove('active');
// //     // Reset form
// //     paymentAmount.value = '';
// //     errorMessage.classList.remove('visible');
// //     payNowBtn.disabled = true;
// // }
// //
// // if (closeModal) {
// //     closeModal.addEventListener('click', closeModalHandler);
// // }
// //
// // if (cancelBtn) {
// //     cancelBtn.addEventListener('click', closeModalHandler);
// // }
// //
// //
// // // Class selection
// // if (classOptions) {
// //     classOptions.addEventListener('click', (e) => {
// //         const option = e.target.closest('.radio-option');
// //         if (!option) return;
// //
// //         // Update UI
// //         document.querySelectorAll('#classOptions .radio-option').forEach(opt => {
// //             opt.classList.remove('selected');
// //         });
// //         option.classList.add('selected');
// //
// //         // Update radio button
// //         option.querySelector('input').checked = true;
// //
// //         // Update state
// //         selectedClass = option.dataset.value;
// //         updateTotalFare();
// //     });
// // }
// //
// // // Payment method selection
// // if (paymentOptions) {
// //     paymentOptions.addEventListener('click', (e) => {
// //         const option = e.target.closest('.radio-option');
// //         if (!option) return;
// //
// //         // Update UI
// //         document.querySelectorAll('#paymentOptions .radio-option').forEach(opt => {
// //             opt.classList.remove('selected');
// //         });
// //         option.classList.add('selected');
// //
// //         // Update radio button
// //         option.querySelector('input').checked = true;
// //
// //         // Update state
// //         selectedPayment = option.dataset.value;
// //     });
// // }
// //
// // // Payment amount validation
// // if (paymentAmount) {
// //     paymentAmount.addEventListener('input', validateAmount);
// // }
// //
// // // Pay Now button
// // if (payNowBtn) {
// //     payNowBtn.addEventListener('click', () => {
// //         closeModalHandler();
// //     });
// // }
// //
// // // Close modal on click outside
// // paymentModal.addEventListener('click', (e) => {
// //     if (e.target === paymentModal) {
// //         closeModalHandler();
// //     }
// // });
//
// document.addEventListener('DOMContentLoaded', function() {
//     // Get passenger count
//     const passengerCountEl = document.getElementById('passenger-count');
//     const passengerCount = passengerCountEl ? passengerCountEl.textContent.replace(/ passengers?/i, '') : 1;
//     console.log('Passenger count:', passengerCount);
//
//     // Event listeners for Book Now buttons
//     const bookNowBtns = document.querySelectorAll('.ba-book-btn');
//     bookNowBtns.forEach(btn => {
//         btn.addEventListener('click', () => {
//             console.log('Book Now button clicked!');
//             const flightIndex = btn.getAttribute('data-flight-index');
//             openModal(flightIndex);
//         });
//     });
//
//     // Event listeners for Close buttons
//     const closeButtons = document.querySelectorAll('.close-btn');
//     closeButtons.forEach(btn => {
//         btn.addEventListener('click', () => {
//             const modalId = btn.getAttribute('data-modal-id');
//             closeModal(modalId);
//         });
//     });
//
//     // Event listeners for Cancel buttons
//     const cancelButtons = document.querySelectorAll('.cancel-btn');
//     cancelButtons.forEach(btn => {
//         btn.addEventListener('click', () => {
//             const modalId = btn.getAttribute('data-modal-id');
//             closeModal(modalId);
//         });
//     });
//
//     // Close modal when clicking outside
//     const paymentModals = document.querySelectorAll('.payment-modal');
//     paymentModals.forEach(modal => {
//         modal.addEventListener('click', (e) => {
//             if (e.target === modal) {
//                 const modalId = modal.id.split('-')[1];
//                 closeModal(modalId);
//             }
//         });
//     });
//
//     // Event listeners for class options
//     const classOptionsContainers = document.querySelectorAll('.class-options');
//     classOptionsContainers.forEach(container => {
//         container.addEventListener('click', (e) => {
//             const option = e.target.closest('.radio-option');
//             if (!option) return;
//
//             // Get the index from the container ID
//             const containerId = container.id;
//             const flightIndex = containerId.split('-')[1];
//
//             // Update UI
//             container.querySelectorAll('.radio-option').forEach(opt => {
//                 opt.classList.remove('selected');
//             });
//             option.classList.add('selected');
//
//             // Update radio button
//             option.querySelector('input').checked = true;
//
//             // Update state and recalculate fare
//             const selectedClass = option.dataset.value;
//             updateTotalFare(flightIndex, selectedClass);
//         });
//     });
//
//     // Event listeners for payment options
//     const paymentOptionsContainers = document.querySelectorAll('.payment-options');
//     paymentOptionsContainers.forEach(container => {
//         container.addEventListener('click', (e) => {
//             const option = e.target.closest('.radio-option');
//             if (!option) return;
//
//             // Update UI
//             container.querySelectorAll('.radio-option').forEach(opt => {
//                 opt.classList.remove('selected');
//             });
//             option.classList.add('selected');
//
//             // Update radio button
//             option.querySelector('input').checked = true;
//         });
//     });
//
//     // Event listeners for payment amount inputs
//     const paymentAmountInputs = document.querySelectorAll('.payment-amount');
//     paymentAmountInputs.forEach(input => {
//         input.addEventListener('input', () => {
//             const flightIndex = input.id.split('-')[1];
//             validateAmount(flightIndex);
//         });
//     });
//
//     // Event listeners for Pay Now buttons
//     const payNowButtons = document.querySelectorAll('.pay-now-btn');
//     payNowButtons.forEach(btn => {
//         btn.addEventListener('click', () => {
//             const flightIndex = btn.id.split('-')[1];
//             closeModal(flightIndex);
//             // Additional payment processing logic would go here
//         });
//     });
//
//     // Helper function to open modal for specific flight
//     function openModal(flightIndex) {
//         const modal = document.getElementById(`paymentModal-${flightIndex}`);
//         if (!modal) return;
//
//         modal.classList.add('active');
//
//         // Setup initial values for the modal
//         initializeModal(flightIndex);
//     }
//
//     // Helper function to close modal
//     function closeModal(flightIndex) {
//         const modal = document.getElementById(`paymentModal-${flightIndex}`);
//         if (!modal) return;
//
//         modal.classList.remove('active');
//
//         // Reset form
//         const paymentAmountInput = document.getElementById(`paymentAmount-${flightIndex}`);
//         const errorMessageElement = document.getElementById(`errorMessage-${flightIndex}`);
//         const payNowButton = document.getElementById(`payNowBtn-${flightIndex}`);
//
//         if (paymentAmountInput) paymentAmountInput.value = '';
//         if (errorMessageElement) errorMessageElement.classList.remove('visible');
//         if (payNowButton) payNowButton.disabled = true;
//     }
//
//     // Initialize modal with flight-specific data
//     function initializeModal(flightIndex) {
//         // Get prices for this specific flight
//         const economyPriceElement = document.getElementById(`economyPrice-${flightIndex}`);
//         const businessPriceElement = document.getElementById(`businessPrice-${flightIndex}`);
//
//         if (!economyPriceElement || !businessPriceElement) return;
//
//         const economySeatPrice = economyPriceElement.textContent.replace('NRs. ', '');
//         const businessSeatPrice = businessPriceElement.textContent.replace('NRs. ', '');
//
//         console.log(`Flight ${flightIndex} - Economy: ${economySeatPrice}, Business: ${businessSeatPrice}`);
//
//         // Update price per person displays
//         const economySeatPricePerPerson = document.getElementById(`EconomySeatPricePerPerson-${flightIndex}`);
//         const businessSeatPricePerPerson = document.getElementById(`BusinessSeatPricePerPerson-${flightIndex}`);
//
//         if (economySeatPricePerPerson) {
//             const span = economySeatPricePerPerson.querySelector('span');
//             if (span) span.textContent = `NRs. ${economySeatPrice} per passenger`;
//         }
//
//         if (businessSeatPricePerPerson) {
//             const span = businessSeatPricePerPerson.querySelector('span');
//             if (span) span.textContent = `NRs. ${businessSeatPrice} per passenger`;
//         }
//
//         // Reset class selection to economy and recalculate total fare
//         const classOptions = document.getElementById(`classOptions-${flightIndex}`);
//         if (classOptions) {
//             const economyOption = classOptions.querySelector('[data-value="economy"]');
//             const businessOption = classOptions.querySelector('[data-value="business"]');
//
//             if (economyOption && businessOption) {
//                 economyOption.classList.add('selected');
//                 businessOption.classList.remove('selected');
//                 economyOption.querySelector('input').checked = true;
//             }
//         }
//
//         // Update total fare with economy class selected by default
//         updateTotalFare(flightIndex, 'economy');
//     }
//
//     // Calculate and update total fare based on selected class and passenger count
//     function updateTotalFare(flightIndex, selectedClass) {
//         const economyPriceElement = document.getElementById(`economyPrice-${flightIndex}`);
//         const businessPriceElement = document.getElementById(`businessPrice-${flightIndex}`);
//         const totalFareDisplay = document.getElementById(`totalFareDisplay-${flightIndex}`);
//
//         if (!economyPriceElement || !businessPriceElement || !totalFareDisplay) return;
//
//         const economySeatPrice = parseInt(economyPriceElement.textContent.replace('NRs. ', ''));
//         const businessSeatPrice = parseInt(businessPriceElement.textContent.replace('NRs. ', ''));
//
//         // Calculate total fare based on class and passenger count
//         const basePrice = selectedClass === 'economy' ? economySeatPrice : businessSeatPrice;
//         const totalFare = basePrice * passengerCount;
//
//         // Update UI
//         totalFareDisplay.textContent = `NRs. ${totalFare}`;
//
//         // Store total fare as a data attribute for validation
//         totalFareDisplay.dataset.amount = totalFare;
//
//         // Reset validation
//         validateAmount(flightIndex);
//     }
//
//     // Validate payment amount
//     function validateAmount(flightIndex) {
//         const paymentAmountInput = document.getElementById(`paymentAmount-${flightIndex}`);
//         const errorMessageElement = document.getElementById(`errorMessage-${flightIndex}`);
//         const payNowButton = document.getElementById(`payNowBtn-${flightIndex}`);
//         const totalFareDisplay = document.getElementById(`totalFareDisplay-${flightIndex}`);
//
//         if (!paymentAmountInput || !errorMessageElement || !payNowButton || !totalFareDisplay) return;
//
//         const amount = paymentAmountInput.value.trim();
//         const expectedAmount = totalFareDisplay.dataset.amount;
//
//         if (amount === '') {
//             errorMessageElement.classList.remove('visible');
//             payNowButton.disabled = true;
//             return;
//         }
//
//         if (amount !== expectedAmount) {
//             const errorSpan = errorMessageElement.querySelector('span');
//             if (errorSpan) errorSpan.textContent = `Amount must be exactly NRs. ${expectedAmount}`;
//             errorMessageElement.classList.add('visible');
//             payNowButton.disabled = true;
//         } else {
//             errorMessageElement.classList.remove('visible');
//             payNowButton.disabled = false;
//         }
//     }
// });

document.addEventListener('DOMContentLoaded', function() {
    // Get passenger count
    const passengerCountEl = document.getElementById('passenger-count');
    const passengerCount = passengerCountEl ? passengerCountEl.textContent.replace(/ passengers?/i, '') : 1;
    console.log('Passenger count:', passengerCount);

    // Event listeners for Book Now buttons
    const bookNowBtns = document.querySelectorAll('.ba-book-btn');
    bookNowBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            console.log('Book Now button clicked!');
            const flightIndex = btn.getAttribute('data-flight-index');
            openModal(flightIndex);
        });
    });

    // Event listeners for Close buttons
    const closeButtons = document.querySelectorAll('.close-btn');
    closeButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            const modalId = btn.getAttribute('data-modal-id');
            closeModal(modalId);
        });
    });

    // Event listeners for Cancel buttons
    const cancelButtons = document.querySelectorAll('.cancel-btn');
    cancelButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            const modalId = btn.getAttribute('data-modal-id');
            closeModal(modalId);
        });
    });

    // Close modal when clicking outside
    const paymentModals = document.querySelectorAll('.payment-modal');
    paymentModals.forEach(modal => {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                const modalId = modal.id.split('-')[1];
                closeModal(modalId);
            }
        });
    });

    // Event listeners for class options
    const classOptionsContainers = document.querySelectorAll('.class-options');
    classOptionsContainers.forEach(container => {
        container.addEventListener('click', (e) => {
            const option = e.target.closest('.radio-option');
            if (!option) return;

            // Get the index from the container ID
            const containerId = container.id;
            const flightIndex = containerId.split('-')[1];

            // Update UI
            container.querySelectorAll('.radio-option').forEach(opt => {
                opt.classList.remove('selected');
            });
            option.classList.add('selected');

            // Update radio button
            option.querySelector('input').checked = true;

            // Update state and recalculate fare
            const selectedClass = option.dataset.value;
            updateTotalFare(flightIndex, selectedClass);
        });
    });

    // Event listeners for payment options
    const paymentOptionsContainers = document.querySelectorAll('.payment-options');
    paymentOptionsContainers.forEach(container => {
        container.addEventListener('click', (e) => {
            const option = e.target.closest('.radio-option');
            if (!option) return;

            // Update UI
            container.querySelectorAll('.radio-option').forEach(opt => {
                opt.classList.remove('selected');
            });
            option.classList.add('selected');

            // Update radio button
            option.querySelector('input').checked = true;
        });
    });

    // Event listeners for payment amount inputs
    const paymentAmountInputs = document.querySelectorAll('.payment-amount');
    paymentAmountInputs.forEach(input => {
        input.addEventListener('input', () => {
            const flightIndex = input.id.split('-')[1];
            validateAmount(flightIndex);
        });
    });

    // Form submission logic - we'll validate but let the form's natural submit happen
    const paymentForms = document.querySelectorAll('.payment-form');
    paymentForms.forEach(form => {
        form.addEventListener('submit', (e) => {
            // The form will submit naturally since we're using type="submit" now
            // Just perform any last-minute validations if needed
            const flightIndex = form.closest('.modal-overlay').id.split('-')[1];
            const paymentAmount = document.getElementById(`paymentAmount-${flightIndex}`);
            const totalFareDisplay = document.getElementById(`totalFareDisplay-${flightIndex}`);

            if (paymentAmount && totalFareDisplay) {
                const amount = paymentAmount.value.trim();
                const expectedAmount = totalFareDisplay.dataset.amount;

                if (amount !== expectedAmount) {
                    e.preventDefault(); // Prevent form submission if amount doesn't match
                    alert("Payment amount must match the total fare exactly.");
                }
            }
        });
    });

    // Helper function to open modal for specific flight
    function openModal(flightIndex) {
        const modal = document.getElementById(`paymentModal-${flightIndex}`);
        if (!modal) return;

        modal.classList.add('active');

        // Setup initial values for the modal
        initializeModal(flightIndex);
    }

    // Helper function to close modal
    function closeModal(flightIndex) {
        const modal = document.getElementById(`paymentModal-${flightIndex}`);
        if (!modal) return;

        modal.classList.remove('active');

        // Reset form
        const paymentAmountInput = document.getElementById(`paymentAmount-${flightIndex}`);
        const errorMessageElement = document.getElementById(`errorMessage-${flightIndex}`);
        const payNowButton = document.getElementById(`payNowBtn-${flightIndex}`);

        if (paymentAmountInput) paymentAmountInput.value = '';
        if (errorMessageElement) errorMessageElement.classList.remove('visible');
        if (payNowButton) payNowButton.disabled = true;
    }

    // Initialize modal with flight-specific data
    function initializeModal(flightIndex) {
        // Get prices for this specific flight
        const economyPriceElement = document.getElementById(`economyPrice-${flightIndex}`);
        const businessPriceElement = document.getElementById(`businessPrice-${flightIndex}`);

        if (!economyPriceElement || !businessPriceElement) return;

        const economySeatPrice = economyPriceElement.textContent.replace('NRs. ', '');
        const businessSeatPrice = businessPriceElement.textContent.replace('NRs. ', '');

        console.log(`Flight ${flightIndex} - Economy: ${economySeatPrice}, Business: ${businessSeatPrice}`);

        // Update price per person displays
        const economySeatPricePerPerson = document.getElementById(`EconomySeatPricePerPerson-${flightIndex}`);
        const businessSeatPricePerPerson = document.getElementById(`BusinessSeatPricePerPerson-${flightIndex}`);

        if (economySeatPricePerPerson) {
            const span = economySeatPricePerPerson.querySelector('span');
            if (span) span.textContent = `NRs. ${economySeatPrice} per passenger`;
        }

        if (businessSeatPricePerPerson) {
            const span = businessSeatPricePerPerson.querySelector('span');
            if (span) span.textContent = `NRs. ${businessSeatPrice} per passenger`;
        }

        // Reset class selection to economy and recalculate total fare
        const classOptions = document.getElementById(`classOptions-${flightIndex}`);
        if (classOptions) {
            const economyOption = classOptions.querySelector('[data-value="economy"]');
            const businessOption = classOptions.querySelector('[data-value="business"]');

            if (economyOption && businessOption) {
                economyOption.classList.add('selected');
                businessOption.classList.remove('selected');
                economyOption.querySelector('input').checked = true;
            }
        }

        // Update total fare with economy class selected by default
        updateTotalFare(flightIndex, 'economy');
    }

    // Calculate and update total fare based on selected class and passenger count
    function updateTotalFare(flightIndex, selectedClass) {
        const economyPriceElement = document.getElementById(`economyPrice-${flightIndex}`);
        const businessPriceElement = document.getElementById(`businessPrice-${flightIndex}`);
        const totalFareDisplay = document.getElementById(`totalFareDisplay-${flightIndex}`);

        if (!economyPriceElement || !businessPriceElement || !totalFareDisplay) return;

        const economySeatPrice = parseInt(economyPriceElement.textContent.replace('NRs. ', ''));
        const businessSeatPrice = parseInt(businessPriceElement.textContent.replace('NRs. ', ''));

        // Calculate total fare based on class and passenger count
        const basePrice = selectedClass === 'economy' ? economySeatPrice : businessSeatPrice;
        const totalFare = basePrice * passengerCount;

        // Update UI
        totalFareDisplay.textContent = `NRs. ${totalFare}`;

        // Store total fare as a data attribute for validation
        totalFareDisplay.dataset.amount = totalFare;

        // Reset validation
        validateAmount(flightIndex);
    }

    // Validate payment amount
    function validateAmount(flightIndex) {
        const paymentAmountInput = document.getElementById(`paymentAmount-${flightIndex}`);
        const errorMessageElement = document.getElementById(`errorMessage-${flightIndex}`);
        const payNowButton = document.getElementById(`payNowBtn-${flightIndex}`);
        const totalFareDisplay = document.getElementById(`totalFareDisplay-${flightIndex}`);

        if (!paymentAmountInput || !errorMessageElement || !payNowButton || !totalFareDisplay) return;

        const amount = paymentAmountInput.value.trim();
        const expectedAmount = totalFareDisplay.dataset.amount;

        if (amount === '') {
            errorMessageElement.classList.remove('visible');
            payNowButton.disabled = true;
            return;
        }

        if (amount !== expectedAmount) {
            const errorSpan = errorMessageElement.querySelector('span');
            if (errorSpan) errorSpan.textContent = `Amount must be exactly NRs. ${expectedAmount}`;
            errorMessageElement.classList.add('visible');
            payNowButton.disabled = true;
        } else {
            errorMessageElement.classList.remove('visible');
            payNowButton.disabled = false;
        }
    }
});