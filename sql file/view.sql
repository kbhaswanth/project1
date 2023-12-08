CREATE VIEW PendingBookings AS
SELECT Bookings.Booking_id, Bookings.Customer_id, Bookings.Ride_id, Bookings.BookingDate
FROM Bookings
WHERE Bookings.Status = 'Pending';

CREATE VIEW CompletedRides AS
SELECT Ride_id, Customer_id, Driver_id, RideDate, Fare
FROM Ride02
WHERE Ride_id IN (SELECT Ride_id FROM Bookings WHERE Status = 'Confirmed');

SELECT * FROM CompletedRides;
