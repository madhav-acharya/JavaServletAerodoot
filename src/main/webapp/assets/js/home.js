document.addEventListener('DOMContentLoaded', function() {
    // Tab switching functionality
    const tabs = document.querySelectorAll('.tab-item');
    const tabContents = document.querySelectorAll('.tab-content');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            const tabId = tab.getAttribute('data-tab');

            // Remove active class from all tabs and hide all contents
            tabs.forEach(t => t.classList.remove('active'));
            tabContents.forEach(content => content.classList.add('hidden'));

            // Add active class to clicked tab and show corresponding content
            tab.classList.add('active');
            document.getElementById(`${tabId}-content`).classList.remove('hidden');

            // Handle return date field visibility for one-way trips
            if (tabId === 'one-way') {
                document.getElementById('return-date-group').style.display = 'none';
            } else if (tabId === 'round-trip') {
                document.getElementById('return-date-group').style.display = 'block';
            }
        });
    });

    localStorage.removeItem("activeTab");

    // Calendar functionality
    const calendarPopup = document.getElementById('calendar-popup');
    const calendarMonth = document.getElementById('calendar-month');
    const calendarDays = document.getElementById('calendar-days');
    const departureInput = document.getElementById('departure-date');
    const returnInput = document.getElementById('return-date');
    const oneWayDepartureInput = document.getElementById('one-way-departure-date');

    let currentDate = new Date();
    let currentMonth = currentDate.getMonth();
    let currentYear = currentDate.getFullYear();
    let selectedDepartureDate = null;
    let selectedReturnDate = null;
    let activeInput = null;

    // Date inputs click handlers
    departureInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activeInput = 'departure';
        // Close all other dropdowns first
        closeAllDropdowns();
        showCalendar(e.target);
    });

    returnInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activeInput = 'return';
        // Close all other dropdowns first
        closeAllDropdowns();
        showCalendar(e.target);
    });

    oneWayDepartureInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activeInput = 'one-way-departure';
        // Close all other dropdowns first
        closeAllDropdowns();
        showCalendar(e.target);
    });

    // Calendar navigation
    document.querySelector('.calendar-nav.prev').addEventListener('click', (e) => {
        e.stopPropagation(); // Prevent closing when clicking navigation
        currentMonth--;
        if (currentMonth < 0) {
            currentMonth = 11;
            currentYear--;
        }
        renderCalendar();
    });

    document.querySelector('.calendar-nav.next').addEventListener('click', (e) => {
        e.stopPropagation(); // Prevent closing when clicking navigation
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        renderCalendar();
    });

    function showCalendar(inputElement) {
        const rect = inputElement.getBoundingClientRect();

        // Position the calendar directly below the input field
        calendarPopup.style.position = 'absolute';
        calendarPopup.style.top = `${rect.bottom}px`;
        calendarPopup.style.left = `${rect.left}px`;

        // Make sure the calendar doesn't go off-screen
        const calendarWidth = 300; // Approximate width of calendar
        if (rect.left + calendarWidth > window.innerWidth) {
            calendarPopup.style.left = `${window.innerWidth - calendarWidth - 20}px`;
        }

        // Add to the DOM at the right position
        document.body.appendChild(calendarPopup);
        calendarPopup.classList.add('active');
        renderCalendar();
    }

    function renderCalendar() {
        const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        calendarMonth.textContent = `${monthNames[currentMonth]} ${currentYear}`;

        // Clear previous days
        calendarDays.innerHTML = '';

        // Get first day of month and total days
        const firstDay = new Date(currentYear, currentMonth, 1).getDay();
        const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

        // Previous month days
        const daysInPrevMonth = new Date(currentYear, currentMonth, 0).getDate();
        for (let i = firstDay - 1; i >= 0; i--) {
            const dayElement = document.createElement('div');
            dayElement.classList.add('calendar-day', 'other-month');
            dayElement.textContent = daysInPrevMonth - i;
            calendarDays.appendChild(dayElement);
        }

        // Current month days
        for (let i = 1; i <= daysInMonth; i++) {
            const dayElement = document.createElement('div');
            dayElement.classList.add('calendar-day');
            dayElement.textContent = i;

            // Check if this day is selected
            if (selectedDepartureDate &&
                selectedDepartureDate.getDate() === i &&
                selectedDepartureDate.getMonth() === currentMonth &&
                selectedDepartureDate.getFullYear() === currentYear) {
                dayElement.classList.add('selected');
            }

            if (selectedReturnDate &&
                selectedReturnDate.getDate() === i &&
                selectedReturnDate.getMonth() === currentMonth &&
                selectedReturnDate.getFullYear() === currentYear) {
                dayElement.classList.add('selected');
            }

            // Check if this day is today
            if (currentDate.getDate() === i &&
                currentDate.getMonth() === currentMonth &&
                currentDate.getFullYear() === currentYear) {
                dayElement.classList.add('today');
            }

            // Day click handler
            dayElement.addEventListener('click', (e) => {
                e.stopPropagation(); // Prevent event bubbling
                const selectedDate = new Date(currentYear, currentMonth, i);

                if (activeInput === 'departure') {
                    selectedDepartureDate = selectedDate;
                    departureInput.value = formatDate(selectedDate);

                    // If return date is before departure date, reset it
                    if (selectedReturnDate && selectedReturnDate < selectedDate) {
                        selectedReturnDate = null;
                        returnInput.value = '';
                    }

                    // If one-way, close calendar after selection
                    if (document.querySelector('.tab-item[data-tab="one-way"]').classList.contains('active')) {
                        calendarPopup.classList.remove('active');
                    } else {
                        // Switch to return date selection
                        activeInput = 'return';
                    }
                } else if (activeInput === 'return') {
                    // Ensure return date is not before departure date
                    if (selectedDepartureDate && selectedDate >= selectedDepartureDate) {
                        selectedReturnDate = selectedDate;
                        returnInput.value = formatDate(selectedDate);
                        calendarPopup.classList.remove('active');
                    }
                } else if (activeInput === 'one-way-departure') {
                    selectedDepartureDate = selectedDate;
                    oneWayDepartureInput.value = formatDate(selectedDate);
                    calendarPopup.classList.remove('active');
                }

                renderCalendar();
            });

            calendarDays.appendChild(dayElement);
        }

        // Next month days
        const totalCells = 42; // 6 rows of 7 days
        const remainingCells = totalCells - (firstDay + daysInMonth);
        for (let i = 1; i <= remainingCells; i++) {
            const dayElement = document.createElement('div');
            dayElement.classList.add('calendar-day', 'other-month');
            dayElement.textContent = i;
            calendarDays.appendChild(dayElement);
        }
    }

    function formatDate(date) {
        const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        const day = date.getDate();
        const month = months[date.getMonth()];
        const year = date.getFullYear();

        // Add ordinal suffix to day
        let suffix = 'th';
        if (day === 1 || day === 21 || day === 31) suffix = 'st';
        if (day === 2 || day === 22) suffix = 'nd';
        if (day === 3 || day === 23) suffix = 'rd';

        return `${month} ${day}${suffix}, ${year}`;
    }

    // City selection functionality
    const cityDropdown = document.getElementById('city-dropdown');
    const fromInput = document.getElementById('from');
    const toInput = document.getElementById('to');
    const oneWayFromInput = document.getElementById('one-way-from');
    const oneWayToInput = document.getElementById('one-way-to');
    const cityItems = document.querySelectorAll('.city-item');
    const citySearchInput = document.querySelector('.city-search input');

    let activeCityInput = null;

    // City search input click handler to prevent closing dropdown
    if (citySearchInput) {
        citySearchInput.addEventListener('click', (e) => {
            e.stopPropagation();
        });

        // Filter cities based on search input
        citySearchInput.addEventListener('input', (e) => {
            const searchValue = e.target.value.toLowerCase();
            cityItems.forEach(item => {
                const cityName = item.getAttribute('data-city').toLowerCase();
                if (cityName.includes(searchValue)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    }

    // City inputs click handlers
    fromInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activeCityInput = fromInput;
        // Close all other dropdowns first
        closeAllDropdowns();
        showCityDropdown(e.target);
    });

    toInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activeCityInput = toInput;
        // Close all other dropdowns first
        closeAllDropdowns();
        showCityDropdown(e.target);
    });

    oneWayFromInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activeCityInput = oneWayFromInput;
        // Close all other dropdowns first
        closeAllDropdowns();
        showCityDropdown(e.target);
    });

    oneWayToInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activeCityInput = oneWayToInput;
        // Close all other dropdowns first
        closeAllDropdowns();
        showCityDropdown(e.target);
    });

    function showCityDropdown(inputElement) {
        const rect = inputElement.getBoundingClientRect();

        // Position the city dropdown directly below the input field
        cityDropdown.style.position = 'absolute';
        cityDropdown.style.top = `${rect.bottom}px`;
        cityDropdown.style.left = `${rect.left}px`;

        // Make sure the dropdown doesn't go off-screen
        const dropdownWidth = 300; // Approximate width of dropdown
        if (rect.left + dropdownWidth > window.innerWidth) {
            cityDropdown.style.left = `${window.innerWidth - dropdownWidth - 20}px`;
        }

        // Add to the DOM at the right position
        document.body.appendChild(cityDropdown);
        cityDropdown.classList.add('active');

        // Reset search input if it exists
        if (citySearchInput) {
            citySearchInput.value = '';
            // Show all cities
            cityItems.forEach(item => {
                item.style.display = 'block';
            });
        }
    }

    cityItems.forEach(item => {
        item.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent event bubbling
            if (activeCityInput) {
                activeCityInput.value = item.getAttribute('data-city');
                cityDropdown.classList.remove('active');
            }
        });
    });

    // Passenger selection functionality
    const passengerDropdown = document.getElementById('passenger-dropdown');
    const passengerInput = document.getElementById('passengers');
    const oneWayPassengerInput = document.getElementById('one-way-passengers');
    const adultCount = document.getElementById('adult-count');
    const childCount = document.getElementById('child-count');
    const infantCount = document.getElementById('infant-count');

    let activePassengerInput = null;

    // Passenger inputs click handlers
    passengerInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activePassengerInput = passengerInput;
        // Close all other dropdowns first
        closeAllDropdowns();
        showPassengerDropdown(e.target);
    });

    oneWayPassengerInput.addEventListener('click', (e) => {
        e.stopPropagation();
        activePassengerInput = oneWayPassengerInput;
        // Close all other dropdowns first
        closeAllDropdowns();
        showPassengerDropdown(e.target);
    });

    function showPassengerDropdown(inputElement) {
        const rect = inputElement.getBoundingClientRect();

        // Position the passenger dropdown directly below the input field
        passengerDropdown.style.position = 'absolute';
        passengerDropdown.style.top = `${rect.bottom}px`;
        passengerDropdown.style.left = `${rect.left}px`;

        // Make sure the dropdown doesn't go off-screen
        const dropdownWidth = 300; // Approximate width of dropdown
        if (rect.left + dropdownWidth > window.innerWidth) {
            passengerDropdown.style.left = `${window.innerWidth - dropdownWidth - 20}px`;
        }

        // Add to the DOM at the right position
        document.body.appendChild(passengerDropdown);
        passengerDropdown.classList.add('active');
    }

    // Passenger counter buttons
    const decreaseButtons = document.querySelectorAll('.passenger-counter .decrease');
    const increaseButtons = document.querySelectorAll('.passenger-counter .increase');

    decreaseButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent event bubbling
            const countElement = button.nextElementSibling;
            let count = parseInt(countElement.textContent);

            // Don't allow less than 1 adult or less than 0 for others
            if (countElement.id === 'adult-count' && count <= 1) return;
            if (count <= 0) return;

            countElement.textContent = --count;
        });
    });

    increaseButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent event bubbling
            const countElement = button.previousElementSibling;
            let count = parseInt(countElement.textContent);

            // Maximum 9 passengers per type
            if (count >= 9) return;

            countElement.textContent = ++count;
        });
    });

    // Apply passenger selection
    document.querySelector('.btn-apply').addEventListener('click', (e) => {
        e.stopPropagation(); // Prevent event bubbling
        const adults = parseInt(adultCount.textContent);
        const children = parseInt(childCount.textContent);
        const infants = parseInt(infantCount.textContent);

        const totalPassengers = adults + children + infants;
        const passengerText = totalPassengers === 1 ? '1 Passenger' : `${totalPassengers} Passengers`;

        if (activePassengerInput) {
            activePassengerInput.value = passengerText;
            passengerDropdown.classList.remove('active');
        }
    });

    // Function to close all dropdowns
    function closeAllDropdowns() {
        calendarPopup.classList.remove('active');
        cityDropdown.classList.remove('active');
        passengerDropdown.classList.remove('active');
    }

    // Close dropdowns when clicking outside
    document.addEventListener('click', () => {
        closeAllDropdowns();
    });

    // Prevent closing when clicking inside dropdowns
    calendarPopup.addEventListener('click', (e) => {
        e.stopPropagation();
    });

    cityDropdown.addEventListener('click', (e) => {
        e.stopPropagation();
    });

    passengerDropdown.addEventListener('click', (e) => {
        e.stopPropagation();
    });

    // Set default values
    const today = new Date();
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);

    departureInput.value = formatDate(today);
    returnInput.value = formatDate(tomorrow);
    oneWayDepartureInput.value = formatDate(today);

    selectedDepartureDate = today;
    selectedReturnDate = tomorrow;

    // Make sure the dropdowns are initially in the DOM but hidden
    if (!document.body.contains(calendarPopup)) {
        document.body.appendChild(calendarPopup);
    }
    if (!document.body.contains(cityDropdown)) {
        document.body.appendChild(cityDropdown);
    }
    if (!document.body.contains(passengerDropdown)) {
        document.body.appendChild(passengerDropdown);
    }
});