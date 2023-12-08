-- calculate_fare.sql
DECLARE
    total_fare DECIMAL(10, 2);
BEGIN
    SELECT SUM(Fare) INTO total_fare FROM Ride02;
    DBMS_OUTPUT.PUT_LINE('Total Fare for All Rides: ' || total_fare);
END;
/

-- script.sql
DECLARE
    total_fare DECIMAL(10, 2);
BEGIN
    SELECT SUM(Fare) INTO total_fare FROM CompletedRides;
    DBMS_OUTPUT.PUT_LINE('Total Fare for Completed Rides: ' || total_fare);
END;
/
