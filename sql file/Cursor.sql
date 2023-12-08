-- cursor_script.sql
DECLARE
    CURSOR ride_cursor IS
        SELECT Ride_id, Customer_id, RideDate FROM CompletedRides;
    ride_record ride_cursor%ROWTYPE;
BEGIN
    OPEN ride_cursor;
    LOOP
        FETCH ride_cursor INTO ride_record;
        EXIT WHEN ride_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Ride ID: ' || ride_record.Ride_id ||
                             ', Customer ID: ' || ride_record.Customer_id ||
                             ', Ride Date: ' || ride_record.RideDate);
    END LOOP;
    CLOSE ride_cursor;
END;
/

-- display_assignments.sql
DECLARE
    CURSOR assignment_cursor IS
        SELECT * FROM DriverAssignments;
    assignment_record assignment_cursor%ROWTYPE;
BEGIN
    OPEN assignment_cursor;
    LOOP
        FETCH assignment_cursor INTO assignment_record;
        EXIT WHEN assignment_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Assignment ID: ' || assignment_record.AssignmentID ||
                             ', Driver ID: ' || assignment_record.DriverID ||
                             ', Ride ID: ' || assignment_record.RideID);
    END LOOP;
    CLOSE assignment_cursor;
END;
/
