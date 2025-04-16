CREATE SCHEMA IF NOT EXISTS aerodootdb;
USE aerodootdb;

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Auto increment the user ID
    full_name VARCHAR(100) NOT NULL,    -- Store the user's full name
    email VARCHAR(100) NOT NULL UNIQUE, -- Store the user's email and ensure it's unique
    password VARCHAR(255) NOT NULL,     -- Store the user's password (hashed, not plain text)
    role INT DEFAULT 1 NOT NULL,        -- User role: 1=regular user (default), 0=admin, 2=super admin
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   -- Track when the user was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Track when user details were last updated
    );

-- Create the passengers table
CREATE TABLE IF NOT EXISTS passengers (
passenger_id INT AUTO_INCREMENT PRIMARY KEY,  -- Auto increment the passenger ID
passport_number VARCHAR(100) NOT NULL,        -- Store the passport number
user_id INT,                                  -- Foreign key to link the passenger to a user
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create the bookings table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,    -- Auto increment the booking ID
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   -- Track the date of booking
    seat_number VARCHAR(20) NOT NULL,               -- Store the seat number
    class_type VARCHAR(50) NOT NULL,                -- Store the class type (Economy/Business)
    payment_status VARCHAR(50) NOT NULL,            -- Store the payment status
    passenger_id INT,                               -- Foreign key to link the booking to a passenger
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) ON DELETE CASCADE
    );



-- Create the flight table
CREATE TABLE IF NOT EXISTS flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,    -- Auto increment the flight ID
    flight_number VARCHAR(50) NOT NULL,           -- Store the flight number
    departure_location VARCHAR(100) NOT NULL,     -- Store the departure location
    arrival_location VARCHAR(100) NOT NULL,       -- Store the arrival location
    departure_time TIMESTAMP NOT NULL,            -- Store the departure time
    arrival_time TIMESTAMP NOT NULL,              -- Store the arrival time
    status VARCHAR(50) NOT NULL,                  -- Store the flight status (e.g., On time, Delayed)
    economy_price DECIMAL(10,2) NOT NULL,         -- Store the economy class price
    business_price DECIMAL(10,2) NOT NULL         -- Store the business class price
    );

-- Create the crew table
CREATE TABLE IF NOT EXISTS crew (
    crew_id INT AUTO_INCREMENT PRIMARY KEY,      -- Auto increment the crew ID
    role VARCHAR(100) NOT NULL,                   -- Store the role of the crew member (e.g., Pilot, Flight Attendant)
    license_number VARCHAR(100) NOT NULL,         -- Store the crew member's license number
    user_id INT,                                  -- Foreign key to link the crew member to a user
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );

-- Create the aircraft table
CREATE TABLE IF NOT EXISTS aircraft (
    aircraft_id INT AUTO_INCREMENT PRIMARY KEY,  -- Auto increment the aircraft ID
    model VARCHAR(100) NOT NULL,                  -- Store the aircraft model
    capacity INT NOT NULL,                        -- Store the aircraft's capacity
    manufacturer VARCHAR(100) NOT NULL,           -- Store the aircraft manufacturer's name
    last_maintenance_date DATE NOT NULL           -- Store the date of the last maintenance
    );

-- Create the staff table
CREATE TABLE IF NOT EXISTS staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,     -- Auto increment the staff ID
    position VARCHAR(100) NOT NULL,               -- Store the position of the staff member (e.g., Cabin Crew)
    role VARCHAR(100) NOT NULL,                   -- Store the staff member's role
    user_id INT,                                  -- Foreign key to link the staff member to a user
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );

-- Create the booking_flight table (many-to-many relationship between bookings and flights)
CREATE TABLE IF NOT EXISTS booking_flight (
    booking_id INT,                               -- Foreign key to link to a booking
    flight_id INT,                                -- Foreign key to link to a flight
    PRIMARY KEY (booking_id, flight_id),          -- Composite primary key
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE
    );

-- Create the flight_crew table (many-to-many relationship between flights and crew)
CREATE TABLE IF NOT EXISTS flight_crew (
    booking_id INT,                               -- Foreign key to link to a booking
    flight_id INT,                                -- Foreign key to link to a flight
    crew_id INT,                                  -- Foreign key to link to a crew member
    PRIMARY KEY (booking_id, flight_id, crew_id),  -- Composite primary key
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE,
    FOREIGN KEY (crew_id) REFERENCES crew(crew_id) ON DELETE CASCADE
    );

-- Create the flight_aircraft table (many-to-many relationship between flights and aircraft)
CREATE TABLE IF NOT EXISTS flight_aircraft (
    booking_id INT,                               -- Foreign key to link to a booking
    flight_id INT,                                -- Foreign key to link to a flight
    aircraft_id INT,                              -- Foreign key to link to an aircraft
    PRIMARY KEY (booking_id, flight_id, aircraft_id),  -- Composite primary key
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE,
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(aircraft_id) ON DELETE CASCADE
    );

-- Create the flight_staff table (many-to-many relationship between flights and staff)
CREATE TABLE IF NOT EXISTS flight_staff (
    booking_id INT,                               -- Foreign key to link to a booking
    flight_id INT,                                -- Foreign key to link to a flight
    staff_id INT,                                 -- Foreign key to link to a staff member
    user_id INT,                                  -- Foreign key to link to a user
    PRIMARY KEY (booking_id, flight_id, staff_id, user_id),  -- Composite primary key
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );
