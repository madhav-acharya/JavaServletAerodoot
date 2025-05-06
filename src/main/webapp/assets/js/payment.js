// Flight data
const flightData = {
    flightNumber: "AD1234",
    route: "JFK → LAX",
    economyPrice: 299,
    businessPrice: 599
};

// DOM Elements
const bookNowBtn = document.getElementById('bookNowBtn');
const paymentModal = document.getElementById('paymentModal');
const closeModal = document.getElementById('closeModal');
const cancelBtn = document.getElementById('cancelBtn');
const payNowBtn = document.getElementById('payNowBtn');
const paymentAmount = document.getElementById('paymentAmount');
const errorMessage = document.getElementById('errorMessage');
const totalFareDisplay = document.getElementById('totalFareDisplay');
const decreasePassengerBtn = document.getElementById('decreasePassenger');
const increasePassengerBtn = document.getElementById('increasePassenger');
const passengerCountEl = document.getElementById('passenger-count');
const classOptions = document.getElementById('classOptions');
const paymentOptions = document.getElementById('paymentOptions');
const successMessage = document.getElementById('successMessage');

// State variables
let passengerCount = 1;
let selectedClass = 'economy';
let selectedPayment = 'eSewa';
let totalFare = calculateTotalFare();

// Calculate total fare based on class and passenger count
function calculateTotalFare() {
    const basePrice = selectedClass === 'economy'
        ? flightData.economyPrice
        : flightData.businessPrice;
    return basePrice * passengerCount;
}

// Update UI with calculated fare
function updateTotalFare() {
    totalFare = calculateTotalFare();
    totalFareDisplay.textContent = `$${totalFare}`;

    // Reset validation
    validateAmount();
}

// Update passenger count display
function updatePassengerCount() {
    passengerCountEl.textContent = `${passengerCount} passenger${passengerCount > 1 ? 's' : ''}`;
    updateTotalFare();
}

// Validate payment amount
function validateAmount() {
    const amount = paymentAmount.value.trim();

    if (amount === '') {
        errorMessage.classList.remove('visible');
        payNowBtn.disabled = true;
        return;
    }

    if (amount !== totalFare.toString()) {
        errorMessage.querySelector('span').textContent = `Amount must be exactly $${totalFare}`;
        errorMessage.classList.add('visible');
        payNowBtn.disabled = true;
    } else {
        errorMessage.classList.remove('visible');
        payNowBtn.disabled = false;
    }
}

// Show success message
function showSuccessMessage() {
    successMessage.classList.add('show');

    setTimeout(() => {
        successMessage.classList.remove('show');
    }, 3000);
}

// Event Listeners

// Open modal
bookNowBtn.addEventListener('click', () => {
    paymentModal.classList.add('active');
});

// Close modal
function closeModalHandler() {
    paymentModal.classList.remove('active');
    // Reset form
    paymentAmount.value = '';
    errorMessage.classList.remove('visible');
    payNowBtn.disabled = true;
}

closeModal.addEventListener('click', closeModalHandler);
cancelBtn.addEventListener('click', closeModalHandler);

// Passenger controls
decreasePassengerBtn.addEventListener('click', () => {
    if (passengerCount > 1) {
        passengerCount--;
        updatePassengerCount();
    }
});

increasePassengerBtn.addEventListener('click', () => {
    passengerCount++;
    updatePassengerCount();
});

// Class selection
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

// Payment method selection
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

// Payment amount validation
paymentAmount.addEventListener('input', validateAmount);

// Pay Now button
payNowBtn.addEventListener('click', () => {
    showSuccessMessage();
    closeModalHandler();
});

// Close modal on click outside
paymentModal.addEventListener('click', (e) => {
    if (e.target === paymentModal) {
        closeModalHandler();
    }
});