Create Database Getaways;

Use Getaways;

 -- Customer (Rhona B) & travel agents (Abinayaa B) data tables
Create Table Customers (
CUSTOMER_ID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR (50),
LastName VARCHAR (50),
Email VARCHAR (100),
Phone VARCHAR (20)
 );
 
INSERT INTO Customers
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
(3, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-123-4567'),
(4, 'Alice', 'Williams', 'alice.williams@example.com', '333-999-8888'),
(5, 'Charlie', 'Brown', 'charlie.brown@example.com', '111-222-3333'),
(6, 'Eva', 'Miller', 'eva.miller@example.com', '777-888-9999'),
(7, 'David', 'Clark', 'david.clark@example.com', '444-555-6666'),
(8, 'Sophia', 'Lee', 'sophia.lee@example.com', '999-888-7777'),
(9, 'Daniel', 'Wilson', 'daniel.wilson@example.com', '222-333-4444'),
(10, 'Olivia', 'Moore', 'olivia.moore@example.com', '666-777-8888'),
(11, 'Liam', 'Anderson', 'liam.anderson@example.com', '888-999-0000'),
(12, 'Ava', 'Thomas', 'ava.thomas@example.com', '444-333-2222');

Create Table TravelAgents (
Agent_ID INT UNIQUE PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) UNIQUE,
Phone VARCHAR (20),
CommisionRate DECIMAL(5,2) DEFAULT 0.1 );

INSERT INTO TravelAgents (Agent_ID, FirstName, LastName, Email, Phone, CommisionRate)
VALUES
('101', 'Adam', 'Smith', 'smith.adam@getaways.com', '07485266890', 0.1),
('102', 'Naushad', 'Khan', 'khan.naushad@getaways.com', '07265893251', 0.1),
('103', 'Daniel', 'Hood', 'hood.daniel@getaways.com', '07389456219', 0.1),
('104', 'Abigail', 'Lawrence', 'lawrence.abigail@getaways.com', '07534210890', 0.08),
('105', 'Roma', 'Shood', 'shood.roma@getaways.com', '07563210089', 0.08);

-- Hotel & rooms tables (Emilia MV)
CREATE TABLE Hotels (
Hotel_ID VARCHAR (20) PRIMARY KEY,
HotelName VARCHAR(100) NOT NULL,
HotelAddress VARCHAR(255),
RoomsAvailable BOOLEAN DEFAULT true,
City VARCHAR(100) NOT NULL,
Email VARCHAR(255) UNIQUE,
Phone VARCHAR (20) NOT NULL);

CREATE INDEX idx_city ON Hotels (City);

INSERT INTO Hotels (Hotel_ID, HotelName, HotelAddress, RoomsAvailable, City, Email, Phone)
VALUES
('GPH', 'Grand Plaza Hotel', '123 Main Street', true, 'New York', 'bookings@grandplaza.com', '+15551234567'),
('SRE', 'Sunset Resort', 'Orizaba 95, Roma Norte, CDMX 6700,', true, 'Mexico City', 'reservaciones@sunsetresort.com', '+552345678'),
('MVL', 'Mountain View Lodge', 'Av. Gonzalez Suarez N27-142', true, 'Quito', 'reservaciones@mountainview.ec', '+59323964900'),
('CLI', 'City Lights Inn', 'Herengracht 341, 1016 AZ', true, 'Amsterdam', 'info@citylights.nl', '+310205550222'),
('GOH', 'Golden Oasis Hotel', '234 Desert Highway', true, 'Cairo', 'reservation.cairo@go.com', '+20227980000'),
('URH', 'Urban Retreat Hotel', 'Bedford Avenue, London WC1B 3GH', true, 'London', 'bookings@urbanretreat.co.uk', '02084571254'),
('ESR', 'Eternal Sunshine Resort', 'Jl. Gunung Soputan No.88, Bali - Indonesia, 80361', true, 'Denpasar', 'stay@eternalsunshine.com', '+623618466220');

CREATE TABLE Rooms (
Room_ID INT PRIMARY KEY,
Hotel_ID VARCHAR (20),
RoomType VARCHAR(20),
RoomRate DECIMAL(5, 2),
Status VARCHAR(20) DEFAULT 'Available',
CUSTOMER_ID INT NULL,
FOREIGN KEY (CUSTOMER_ID) REFERENCES Customers(CUSTOMER_ID) ON UPDATE CASCADE);

ALTER TABLE Rooms
ADD CONSTRAINT fk_Hotel_ID
FOREIGN KEY (Hotel_ID)
REFERENCES Hotels(Hotel_ID)
ON UPDATE CASCADE;

INSERT INTO Rooms (Room_ID, Hotel_ID, RoomType, RoomRate, CUSTOMER_ID)
VALUES
('238', 'GPH', 'Single', '200.00', NULL),
('564', 'GPH', 'Double', '300.00', NULL),
('789', 'SRE', 'Villa', '40.00', NULL),
('123', 'SRE', 'Single', '25.00', NULL),
('456', 'MVL', 'Double', '50.00', NULL),
('890', 'MVL', 'Villa', '70.00', NULL),
('333', 'CLI', 'Single', '70.00', NULL),
('222', 'CLI', 'Double', '100.00', NULL),
('888', 'GOH', 'Villa', '50.00', NULL),
('444', 'GOH', 'Single', '30.00', NULL),
('678', 'URH', 'Double', '250.00', NULL),
('543', 'URH', 'Villa', '500.00', NULL),
('901', 'ESR', 'Single', '50.00', NULL),
('876', 'ESR', 'Double', '75.00', NULL);

-- Transport table (Emilia MV)
CREATE TABLE Transport (
    Transport_ID VARCHAR(10) PRIMARY KEY,
    City VARCHAR(100),
    FOREIGN KEY (City) REFERENCES Hotels(City),
    Transport_type VARCHAR(25),
    Company_name VARCHAR(50),
    Price_per_person DECIMAL
);

INSERT INTO Transport (Transport_ID, City, Transport_type, Company_name, Price_per_person)
VALUES
    -- Destination: 'Amsterdam'
    ('AM1', 'Amsterdam', 'Bus', 'CityLink ', 10),
    ('AM2', 'Amsterdam', 'Air', 'KLM', 150),
    ('AM3', 'Amsterdam', 'Rail', 'Eurorail', 25),

    -- Destination: 'Denpasar'
    ('DP4', 'Denpasar', 'Bus', 'Travel Ride', 2),
    ('DP5', 'Denpasar', 'Air', 'SkyQuest', 200),
    ('DP6', 'Denpasar', 'Rail', 'SwiftRail Express', 10),

    -- Destination: 'Cairo'
    ('CI7', 'Cairo', 'Bus', 'SwiftTrans', 5),
    ('CI8', 'Cairo', 'Air', 'Nimbus Flights', 100),
    ('CI9', 'Cairo', 'Rail', 'HorizonExpress Rails', 10),

    -- Destination: 'New York'
    ('NY10', 'New York', 'Bus', 'SkyHopper', 10),
    ('NY11', 'New York', 'Air', 'United Airlines', 250),
    ('NY12', 'New York', 'Rail', 'MetroLink Trains', 20),

    -- Destination: 'Quito'
    ('QU13', 'Quito', 'Bus', 'Horizon Busways', 2),
    ('QU14', 'Quito', 'Air', 'StarCruise Airlines', 150),
    ('QU15', 'Quito', 'Rail', 'CityConnect Railways', 10),
    
    -- Destination: 'Mexico City'
    ('MX16', 'Mexico City', 'Bus', 'Urban Transit', 5),
    ('MX17', 'Mexico City', 'Air', 'HorizonAir Express', 170),
    ('MX18', 'Mexico City', 'Rail', 'InterCity Rail Co', 5),
    
    -- Destination: 'London'
    ('LD19', 'London', 'Bus', 'TFL', 10),
    ('LD20', 'London', 'Air', 'British Airways', 250),
    ('LD21', 'London', 'Rail', 'Eurorail', 20);

-- Bookings table (Aasifa N)
CREATE TABLE Bookings(
Booking_ID VARCHAR (20) PRIMARY KEY,
CUSTOMER_ID INT,
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
FOREIGN KEY (Agent_ID) REFERENCES TravelAgents(Agent_ID), -- EMV Added to conenct tables
FOREIGN KEY (Transport_ID) REFERENCES Transport (Transport_ID), -- EMV Added to conenct tables
Agent_ID INT,
Date_of_journey DATE,
Destination VARCHAR (20),
Mode_of_transport VARCHAR (25),
Transport_ID VARCHAR(10),
No_of_persons INT,
Price DECIMAL);

INSERT INTO Bookings
values
('NY005', 3, 103, '2024-06-25', 'New York', 'Air','NY11', 2, 650),
('MX010', 5, 104, '2023-10-28', 'Mexico City', 'Air','MX17', 5, 1000),
('LON008', 2, 103, '2024-07-01', 'London', 'Eurorail','LD21', 1, 300),
('NY015', 8, 101, '2024-01-15', 'New York', 'Air','NY11', 3, 1250),
('ADM021', 1, 105, '2024-06-09', 'Amsterdam','Eurorail','AM3', 2, 900),
('CAI024', 6, 102, '2024-02-12', 'Cairo', 'Air','CI8', 2, 850),
('QUI011', 9, 105, '2024-08-30', 'Quito', 'Air','QU14', 1, 400);

-- Season Packages (Ketana)
CREATE TABLE Season_Packages
(
    Package_ID VARCHAR(10) PRIMARY KEY NOT NULL,
    Season VARCHAR(50),
    Agent_ID INT,  -- Adding the Agent_ID column
    FOREIGN KEY (Agent_ID) REFERENCES TravelAgents(Agent_ID),
    Activity VARCHAR (50),
    Location VARCHAR (50));
    
INSERT INTO Season_Packages (Package_ID, Season, Agent_ID, Activity, Location)
VALUES
('PKG1', 'WINTER', 101, 'Adventure', 'Amsterdam'),
('PKG2', 'WINTER', 102, 'Luxury', 'New York'),
('PKG3', 'AUTUMN', 104, 'Spa', 'Mexico City'),
('PKG4', 'AUTUMN', 105, 'Luxury', 'Denpasar'),
('PKG5', 'SUMMER', 101, 'Safari', 'Quito'),
('PKG6', 'SUMMER', 103, 'Spa', 'Denpasar'),
('PKG7', 'SPRING', 101, 'Adventure', 'Cairo'),
('PKG8', 'SPRING', 102, 'Luxury', 'London');

-- Payments table (Aasifa Noor)
CREATE table Payments (
Payment_ID int Primary key,
Booking_ID VARCHAR(20),
foreign key (Booking_ID) references Bookings(Booking_ID),
Payment_Date DATE,
Amount Decimal,
Payment_method VARCHAR (20));

INSERT INTO Payments
values
(111, 'ADM021', '2023-12-12', 900, 'credit_card'),
(222, 'LON008', '2023-12-05', 300, 'credit_Card'),
(333, 'MX010', '2023-11-30', 1000, 'bank_transfer'),
(444, 'NY015', '2023-12-10', 1250, 'bank_transfer'),
(555, 'CAI024', '2023-12-06', 850, 'credit_card');