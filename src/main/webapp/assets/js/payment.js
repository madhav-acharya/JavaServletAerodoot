// DOM Elements
const bookNowBtns = document.querySelectorAll('.ba-book-btn');
const paymentModal = document.getElementById('paymentModal');
const closeModal = document.getElementById('closeModal');
const cancelBtn = document.getElementById('cancelBtn');
const payNowBtn = document.getElementById('payNowBtn');
const paymentAmount = document.getElementById('paymentAmount');
const errorMessage = document.getElementById('errorMessage');
const totalFareDisplay = document.getElementById('totalFareDisplay');
const passengerCountEl = document.getElementById('passenger-count');
const classOptions = document.getElementById('classOptions');
const paymentOptions = document.getElementById('paymentOptions');
const economyPrice = document.getElementById('economyPrice');
const businessPrice = document.getElementById('businessPrice');

// State variables
let passengerCount = passengerCountEl.textContent.replace(/ passengers?/i, '');
console.log(passengerCount)

let economySeatPrice = economyPrice.textContent.replace('NRs. ', '');
let businessSeatPrice = businessPrice.textContent.replace('NRs. ', '');
console.log(`Economy: ${economySeatPrice}, Business: ${businessSeatPrice}`)

let selectedClass = 'economy';
let selectedPayment = 'eSewa';
let totalFare = calculateTotalFare();
console.log(`Total fare: ` + totalFare);

// Calculate total fare based on class and passenger count
function calculateTotalFare() {
    const basePrice = selectedClass === 'economy'
        ? economySeatPrice
        : businessSeatPrice;
    return basePrice * passengerCount;
}

// Update UI with calculated fare
function updateTotalFare() {
    totalFare = calculateTotalFare();
    totalFareDisplay.textContent = `NRs. ${totalFare}`;

    // Reset validation
    validateAmount();
}

// Validate payment amount
function validateAmount() {
    const amount = paymentAmount.value.trim();

    if (amount === '') {
        errorMessage.classList.remove('visible');
        payNowBtn.disabled = true;
        return
    }

    if (amount !== totalFare.toString()) {
        errorMessage.querySelector('span').textContent = `Amount must be exactly NRs. ${totalFare}`;
        errorMessage.classList.add('visible');
        payNowBtn.disabled = true;
    } else {
        errorMessage.classList.remove('visible');
        payNowBtn.disabled = false;
    }
}

// Open modal
bookNowBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        console.log('Book Now button clicked!');
        paymentModal.classList.add('active');
        updateTotalFare();
    });
})

// Close modal
function closeModalHandler() {
    paymentModal.classList.remove('active');
    // Reset form
    paymentAmount.value = '';
    errorMessage.classList.remove('visible');
    payNowBtn.disabled = true;
}

if (closeModal) {
    closeModal.addEventListener('click', closeModalHandler);
}

if (cancelBtn) {
    cancelBtn.addEventListener('click', closeModalHandler);
}


// Class selection
if (classOptions) {
    classOptions.addEventListener('click', (e) => {
        const option = e.target.closest('.radio-option');
        if (!option) return;

        // Update UI
        document.querySelectorAll('#classOptions .radio-option').forEach(opt => {
            opt.classList.remove('selected');
        });
        option.classList.add('selected');

        // Update radio button
        option.querySelector('input').checked = true;

        // Update state
        selectedClass = option.dataset.value;
        updateTotalFare();
    });
}

// Payment method selection
if (paymentOptions) {
    paymentOptions.addEventListener('click', (e) => {
        const option = e.target.closest('.radio-option');
        if (!option) return;

        // Update UI
        document.querySelectorAll('#paymentOptions .radio-option').forEach(opt => {
            opt.classList.remove('selected');
        });
        option.classList.add('selected');

        // Update radio button
        option.querySelector('input').checked = true;

        // Update state
        selectedPayment = option.dataset.value;
    });
}

// Payment amount validation
if (paymentAmount) {
    paymentAmount.addEventListener('input', validateAmount);
}

// Pay Now button
if (payNowBtn) {
    payNowBtn.addEventListener('click', () => {
        closeModalHandler();
    });
}

// Close modal on click outside
paymentModal.addEventListener('click', (e) => {
    if (e.target === paymentModal) {
        closeModalHandler();
    }
});