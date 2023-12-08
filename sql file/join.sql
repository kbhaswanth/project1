--join--
SELECT Customer1.FirstName, Customer1.LastName, Ride02.Ride_id, Ride02.RideDate
FROM Customer1
JOIN Ride02 ON Customer1.Customer_id = Ride02.Customer_id;


SELECT 
    Customer1.FirstName AS CustomerFirstName,
    Customer1.LastName AS CustomerLastName,
    Ride02.Ride_id,
    Ride02.RideDate,
    Bookings.Booking_id,
    Payments.Amount
FROM Customer1
JOIN Ride02 ON Customer1.Customer_id = Ride02.Customer_id
JOIN Bookings ON Ride02.Ride_id = Bookings.Ride_id
JOIN Payments ON Bookings.Booking_id = Payments.Booking_id;
