--Nested Queries--

SELECT DriverID, FirstName, LastName
FROM Drivers
WHERE DriverID IN (SELECT DriverID FROM FeedbackRatings01 WHERE Rating = (SELECT MAX(Rating) FROM FeedbackRatings01));


SELECT FirstName, LastName
FROM Customer1
WHERE Customer_id IN (SELECT Customer_id FROM Bookings);



