--Drivers Table
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    FirstName VARCHAR(225),
    LastName VARCHAR(225),
    Email VARCHAR(100),
    Phone_num VARCHAR(20),
    VehicleID INT,
    JoinDate DATE
);

INSERT INTO Drivers VALUES   (1, 'David', 'Johnson', 'david.johnson@example.com', '123-456-7890', 101, TO_DATE('2022-05-15', 'YYYY-MM-DD'));
INSERT INTO Drivers VALUES   (2, 'Sarah', 'Smith', 'sarah.smith@example.com', '987-654-3210', 102, TO_DATE('2021-10-08', 'YYYY-MM-DD'));
INSERT INTO Drivers VALUES   (3, 'Michael', 'Brown', 'michael.brown@example.com', '555-123-4567', 103, TO_DATE('2023-01-20', 'YYYY-MM-DD'));
INSERT INTO Drivers VALUES   (4, 'Emily', 'Jones', 'emily.jones@example.com', '222-333-4444', 104, TO_DATE('2023-03-12', 'YYYY-MM-DD'));

--Customer table:
CREATE TABLE Customer1 (
    Customer_id  INT PRIMARY KEY,
    FirstName VARCHAR(225),
    LastName VARCHAR(225),
    Email VARCHAR(100),
    Phone_num VARCHAR(20),
    RegistrationDate DATE
);


INSERT INTO Customer1 VALUES   (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', TO_DATE('2023-08-19', 'YYYY-MM-DD'));
INSERT INTO Customer1 VALUES   (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', TO_DATE('2023-08-19', 'YYYY-MM-DD'));
INSERT INTO Customer1 VALUES   (3, 'Michael', 'Johnson', 'michael.johnson@example.com', '555-123-4567', TO_DATE('2023-08-18', 'YYYY-MM-DD'));
INSERT INTO Customer1 VALUES   (4, 'Emily', 'Brown', 'emily.brown@example.com', '222-333-4444', TO_DATE('2023-08-17', 'YYYY-MM-DD'));

--Vehicles Table:
CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    VehicleType VARCHAR(100),
    Model VARCHAR(100),
    RegistrationPlate VARCHAR(20),
    ManufacturingYear INT,
    FuelType VARCHAR(50),
    SeatingCapacity INT
);

INSERT INTO Vehicles VALUES   (101, 'Car', 'Maruti Suzuki Swift', 'MH01AB1234', 2022, 'Petrol', 5);
INSERT INTO Vehicles VALUES   (102, 'Bike', 'Honda Activa', 'KA02CD5678', 2021, 'Petrol', 2);
INSERT INTO Vehicles VALUES   (103, 'Car', 'Hyundai Venue', 'DL03EF9876', 2020, 'Diesel', 5);
INSERT INTO Vehicles VALUES   (104, 'Bike', 'Royal Enfield Classic 350', 'TN05GH4321', 2019, 'Petrol', 2);

--Locations/Cities Table:
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    CityName VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);


INSERT INTO Locations  VALUES  (1, 'Mumbai', 'Maharashtra', 'India', 19.076090, 72.877426);
INSERT INTO Locations  VALUES  (2, 'Delhi', 'Delhi', 'India', 28.704060, 77.102493);
INSERT INTO Locations  VALUES  (3, 'Bangalore', 'Karnataka', 'India', 12.971599, 77.594566);
INSERT INTO Locations  VALUES   (4, 'Chennai', 'Tamil Nadu', 'India', 13.082680, 80.270721);

--Service Areas Table:

CREATE TABLE ServiceAreas (
    AreaID INT PRIMARY KEY,
    AreaName VARCHAR(100),
    CityName VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);

INSERT INTO ServiceAreas  VALUES  (201, 'South Mumbai', 'Mumbai', 'Maharashtra', 'India');
INSERT INTO ServiceAreas  VALUES  (202, 'Central Delhi', 'Delhi', 'Delhi', 'India');
INSERT INTO ServiceAreas  VALUES  (203, 'Koramangala', 'Bangalore', 'Karnataka', 'India');
INSERT INTO ServiceAreas  VALUES  (204, 'T Nagar', 'Chennai', 'Tamil Nadu', 'India');


--Transcation table:
--Rides Table:
CREATE TABLE Ride02 (
    Ride_id INT PRIMARY KEY,
    Customer_id INT,
    Driver_id INT,
    StartLocation_id INT,
    EndLocation_id INT,
    RideDate TIMESTAMP,
    Fare DECIMAL(10, 2),
    PaymentMethod_id INT,
    FOREIGN KEY (Customer_id) REFERENCES Customer1(Customer_id)
);


INSERT INTO Ride02 VALUES(01, 1, 201, 301, 401, TO_TIMESTAMP('2023-08-19 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 25.50, 501);
INSERT INTO Ride02 VALUES (02, 2, 202, 302, 402, TO_TIMESTAMP('2023-08-20 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 15.75, 502);

--Bookings Table:
CREATE TABLE Bookings (
    Booking_id INT PRIMARY KEY,
    Customer_id INT,
    Ride_id INT,
    BookingDate TIMESTAMP,
    Status VARCHAR(50),
    FOREIGN KEY (Ride_id) REFERENCES Ride02(Ride_id)
);

INSERT INTO Bookings VALUES (601, 101, 1, TO_TIMESTAMP('2023-08-19 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Confirmed');
INSERT INTO Bookings VALUES  (602, 102, 2, TO_TIMESTAMP('2023-08-20 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pending');
 





--Payments Table:
CREATE TABLE Payments (
    Payment_id INT PRIMARY KEY,
    Booking_id INT,
    Amount DECIMAL(10, 2),
    PaymentDate TIMESTAMP,
    PaymentMethod_id INT,
    FOREIGN KEY (Booking_id) REFERENCES Bookings(Booking_id)
);


INSERT INTO Payments  VALUES (901, 601, 20.00, TO_TIMESTAMP('2023-08-19 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 301);
INSERT INTO Payments  VALUES (902, 602, 30.50, TO_TIMESTAMP('2023-08-20 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 302);

--Feedback and Ratings Table:

 CREATE TABLE FeedbackRatings01 (
    Feedback_id INT PRIMARY KEY,
    Booking_id INT,
    Rating INT,
    DriverID INT,
    Comments VARCHAR(255),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

INSERT INTO FeedbackRatings01 VALUES (2001, 601, 4, 1, 'Great experience with the driver.');
INSERT INTO FeedbackRatings01 VALUES (2002, 602, 5, 2, 'Driver was punctual.');


--Driver Assignments Table:
CREATE TABLE DriverAssignments (
    AssignmentID INT PRIMARY KEY,
    DriverID INT,
    RideID INT,
    AssignmentDate DATE,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
   
);
INSERT INTO DriverAssignments  VALUES  (4001, 1, 201, TO_DATE('2023-08-19', 'YYYY-MM-DD'));
INSERT INTO DriverAssignments  VALUES  (4002, 2, 202, TO_DATE('2023-08-20', 'YYYY-MM-DD'));
  
--Cancellation History Table:
CREATE TABLE CancellationHistory (
    Cancellation_id INT PRIMARY KEY,
    Booking_id INT,
    CancellationDate TIMESTAMP,
    Reason VARCHAR(255),
    FOREIGN KEY (Booking_id) REFERENCES Bookings(Booking_id)
);


 INSERT INTO CancellationHistory  VALUES (5001, 601, TO_TIMESTAMP('2023-08-19 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Change of plans');
 INSERT INTO CancellationHistory  VALUES (5002, 602, TO_TIMESTAMP('2023-08-20 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Unexpected event');


--Ride History Table:
CREATE TABLE RideHistory (
    RideHistory_id INT PRIMARY KEY,
    Customer_id INT,
    Driver_id INT,
    StartLocation_id INT,
    EndLocation_id INT,
    RideDate TIMESTAMP,
    Fare DECIMAL(10, 2),
    PaymentMethod_id INT,
    FOREIGN KEY (Customer_id) REFERENCES Customer1(Customer_id)
 );   


INSERT INTO RideHistory  VALUES  (6001, 1, 201, 301, 401, TO_TIMESTAMP('2023-08-19 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 25.50, 501);
INSERT INTO RideHistory  VALUES  (6002, 2, 202, 302, 402, TO_TIMESTAMP('2023-08-20 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 15.75, 502);


select * from BOOKINGS;


---

DELETE FROM Drivers WHERE DriverID = 3;

DELETE FROM Customer1 WHERE Customer_id = 4;

DELETE FROM Vehicles WHERE VehicleID = 104;

DELETE FROM ServiceAreas WHERE AreaID = 204;

--

UPDATE Drivers SET Email = 'new.email@example.com' WHERE DriverID = 1;

UPDATE Customer1 SET Phone_num = '999-888-7777' WHERE Customer_id = 2;

UPDATE ServiceAreas SET AreaName = 'Downtown' WHERE AreaID = 201;

UPDATE FeedbackRatings01 SET Comments = 'Driver was friendly and professional.' WHERE Feedback_id = 2001;

