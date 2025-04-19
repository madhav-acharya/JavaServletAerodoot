-- Create the AeroDootDB database
CREATE DATABASE IF NOT EXISTS aerodootDB;
USE aerodootDB;

-- Create User table
CREATE TABLE User (
                      userId INT AUTO_INCREMENT PRIMARY KEY,
                      firstName VARCHAR(20) NOT NULL,
                      lastName VARCHAR(20) NOT NULL,
                      email VARCHAR(30) UNIQUE NOT NULL,
                      password VARCHAR(15) NOT NULL,
                      phoneNumber VARCHAR(20),
                      userType ENUM('PASSENGER', 'AGENT', 'ADMIN') NOT NULL,
                      createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Company table
CREATE TABLE Company (
                         companyId INT AUTO_INCREMENT PRIMARY KEY,
                         companyName VARCHAR(20) NOT NULL,
                         companyEmail VARCHAR(30) UNIQUE NOT NULL,
                         companyAddress VARCHAR(35) NOT NULL,
                         contactNumber VARCHAR(20) NOT NULL,
                         website VARCHAR(50),
                         registrationNumber VARCHAR(30) UNIQUE NOT NULL
);

-- Create Agent table (depends on User and Company)
CREATE TABLE Agent (
                       agentId INT AUTO_INCREMENT PRIMARY KEY,
                       position VARCHAR(20) NOT NULL,
                       licenseNumber VARCHAR(50) UNIQUE NOT NULL,
                       profilePicture VARCHAR(255),
                       companyId INT,
                       userId INT NOT NULL UNIQUE,
                       FOREIGN KEY (companyId) REFERENCES Company(companyId) ON DELETE SET NULL,
                       FOREIGN KEY (userId) REFERENCES User(userId) ON DELETE CASCADE
);

-- Create Passenger table (depends on User)
CREATE TABLE Passenger (
                           passengerId INT AUTO_INCREMENT PRIMARY KEY,
                           passportNumber VARCHAR(50) UNIQUE,
                           dateOfBirth DATE NOT NULL,
                           gender ENUM('MALE', 'FEMALE', 'OTHER') NOT NULL,
                           address VARCHAR(30),
                           profilePicture VARCHAR(255),
                           userId INT NOT NULL UNIQUE,
                           FOREIGN KEY (userId) REFERENCES User(userId) ON DELETE CASCADE
);

-- Create Admin table (depends on User)
CREATE TABLE Admin (
                       adminId INT AUTO_INCREMENT PRIMARY KEY,
                       adminRole ENUM('SUPER_ADMIN', 'BOOKING_ADMIN', 'FLIGHT_ADMIN') NOT NULL,
                       userId INT NOT NULL UNIQUE,
                       FOREIGN KEY (userId) REFERENCES User(userId) ON DELETE CASCADE
);

-- Create Airline table
CREATE TABLE Airline (
                         airlineId INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(30) NOT NULL,
                         headquarters VARCHAR(200) NOT NULL,
                         contactNumber VARCHAR(20) NOT NULL,
                         email VARCHAR(30) UNIQUE NOT NULL
);

-- Create Aircraft table (depends on Airline)
CREATE TABLE Aircraft (
                          aircraftId INT AUTO_INCREMENT PRIMARY KEY,
                          model VARCHAR(50) NOT NULL,
                          manufacturer VARCHAR(50) NOT NULL,
                          seatCapacityEconomy INT NOT NULL,
                          seatCapacityBusiness INT NOT NULL,
                          lastMaintenanceDate DATE NOT NULL,
                          airlineId INT NOT NULL,
                          FOREIGN KEY (airlineId) REFERENCES Airline(airlineId) ON DELETE CASCADE
);

-- Create Flight table (depends on Aircraft and Airline)
CREATE TABLE Flight (
                        flightId INT AUTO_INCREMENT PRIMARY KEY,
                        flightNumber VARCHAR(30) UNIQUE NOT NULL,
                        departureLocation VARCHAR(30) NOT NULL,
                        arrivalLocation VARCHAR(30) NOT NULL,
                        departureTime DATETIME NOT NULL,
                        arrivalTime DATETIME NOT NULL,
                        duration TIME NOT NULL,
                        status ENUM('SCHEDULED', 'DELAYED', 'CANCELLED', 'IN_AIR', 'LANDED', 'BOARDING') NOT NULL,
                        availableSeatsEconomy INT NOT NULL,
                        availableSeatsBusiness INT NOT NULL,
                        economyPrice DECIMAL(10, 2) NOT NULL,
                        businessPrice DECIMAL(10, 2) NOT NULL,
                        aircraftId INT NOT NULL,
                        airlineId INT NOT NULL,
                        FOREIGN KEY (aircraftId) REFERENCES Aircraft(aircraftId) ON DELETE CASCADE,
                        FOREIGN KEY (airlineId) REFERENCES Airline(airlineId) ON DELETE CASCADE
);

-- Create Booking table (depends on Flight and Passenger)
CREATE TABLE Booking (
                         bookingId INT AUTO_INCREMENT PRIMARY KEY,
                         bookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         classType ENUM('ECONOMY', 'BUSINESS') NOT NULL,
                         seatsBooked INT NOT NULL,
                         seatNumbers VARCHAR(35) NOT NULL,
                         totalPrice DECIMAL(10, 2) NOT NULL,
                         bookingStatus ENUM('PENDING', 'CONFIRMED', 'CANCELLED', 'COMPLETED') NOT NULL,
                         flightId INT NOT NULL,
                         passengerId INT NOT NULL,
                         FOREIGN KEY (flightId) REFERENCES Flight(flightId) ON DELETE CASCADE,
                         FOREIGN KEY (passengerId) REFERENCES Passenger(passengerId) ON DELETE CASCADE
);

-- Create Payment table (depends on Booking)
CREATE TABLE Payment (
                         paymentId INT AUTO_INCREMENT PRIMARY KEY,
                         paymentMethod ENUM('CREDIT_CARD', 'DEBIT_CARD', 'PAYPAL', 'BANK_TRANSFER') NOT NULL,
                         paymentStatus ENUM('PENDING', 'COMPLETED', 'FAILED', 'REFUNDED') NOT NULL,
                         paymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         paidAmount DECIMAL(10, 2) NOT NULL,
                         bookingId INT NOT NULL,
                         FOREIGN KEY (bookingId) REFERENCES Booking(bookingId) ON DELETE CASCADE
);

-- Create UserBooking junction table (for many-to-many relationship between User and Booking)
CREATE TABLE UserBooking (
                             bookingId INT NOT NULL,
                             userId INT NOT NULL,
                             PRIMARY KEY (bookingId, userId),
                             FOREIGN KEY (bookingId) REFERENCES Booking(bookingId) ON DELETE CASCADE,
                             FOREIGN KEY (userId) REFERENCES User(userId) ON DELETE CASCADE
);

-- Create BookingAdmin junction table (relates Admin to Booking)
CREATE TABLE BookingAdmin (
                              adminId INT NOT NULL,
                              bookingId INT NOT NULL,
                              PRIMARY KEY (adminId, bookingId),
                              FOREIGN KEY (adminId) REFERENCES Admin(adminId) ON DELETE CASCADE,
                              FOREIGN KEY (bookingId) REFERENCES Booking(bookingId) ON DELETE CASCADE
);

-- Create AdminFlight junction table (relates Admin to Flight)
CREATE TABLE AdminFlight (
                             adminId INT NOT NULL,
                             flightId INT NOT NULL,
                             PRIMARY KEY (adminId, flightId),
                             FOREIGN KEY (adminId) REFERENCES Admin(adminId) ON DELETE CASCADE,
                             FOREIGN KEY (flightId) REFERENCES Flight(flightId) ON DELETE CASCADE
);
