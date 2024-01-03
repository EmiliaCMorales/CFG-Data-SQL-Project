-- Create a view using JOINS - Abinayaa B
CREATE VIEW BookingDetails AS
SELECT
    B.Booking_ID,
    B.Date_of_journey,
    B.Destination,
    B.Mode_of_transport,
    B.No_of_persons,
    B.Price,
    C.Customer_ID,
    C.FirstName AS Customer_FirstName,
    C.LastName AS Customer_LastName,
    C.Email AS Customer_Email,
    C.Phone AS Customer_Phone,
    T.Agent_ID,
    T.FirstName AS Agent_FirstName,
    T.LastName AS Agent_LastName,
    T.Email AS Agent_Email,
    T.Phone AS Agent_Phone
FROM
    Bookings B
    JOIN Customers C ON B.CUSTOMER_ID = C.Customer_ID
    JOIN TravelAgents T ON B.Agent_ID = T.Agent_ID;
    SELECT * From BookingDetails;
    
-- Create a stored function - Emilia MV
DELIMITER $$

CREATE FUNCTION GetTotalBookingsPerAgent(agentID INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE totalBookings INT;

    SELECT COUNT(*) INTO totalBookings
    FROM Bookings
    WHERE Agent_ID = agentID;

    RETURN totalBookings;
END $$

DELIMITER ;

SELECT GetTotalBookingsPerAgent(103); -- Change Agent_ID

-- Provide example query with a subquery to demonstrate how to extract data from your DB for analysis - Aasifa Noor

 -- Query to fetch Agent First name, Surname with Commission against bookings in Descending order.
 SELECT f.FirstName, f.LastName, Commission 
 from (SELECT c.Agent_ID, sum(commission) as commission from
 (SELECT a.agent_id, (CommisionRate * price) AS commission
    FROM travelagents as a,
    bookings as b 
    where a.agent_id = b.agent_id) as c
    group by c.agent_id) as d
    , travelagents f
 where d.agent_id = f.agent_id 
 order by commission desc;
 
 
 -- Query to fetch Transport and Non-Transport cost to analyse Customer preference on Transport and Non-transport expenses.
 -- Subquery selection within column 
SELECT C.TRANSPORT_ID, C.BOOKING_ID, (c.PRICE - TC) as Non_Transport_Cost, TC as Transport_cost 
from (SELECT a.transport_id, (No_of_persons * Price_per_person) as tc
from TRANSPORT A,
     BOOKINGS b
WHERE A.TRANSPORT_ID = B.TRANSPORT_ID) as d
    , bookings as c
where d.transport_id = c.transport_id 
order by TRANSPORT_COST DESC
;

-- Create a view that uses at least 3-4 base tables - Abinayaa B
    CREATE VIEW BookingDetails2 AS
SELECT
    b.Booking_ID,
    c.Customer_ID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    b.Agent_ID,
    CONCAT(ta.FirstName, ' ', ta.LastName) AS AgentName,
    b.Date_of_journey,
    b.Destination,
    b.Mode_of_transport,
    b.No_of_persons,
    b.Price,
    sp.Package_ID,
    sp.Season,
    sp.Activity,
    sp.Location
FROM
    Bookings b
    JOIN Customers c ON b.CUSTOMER_ID = c.Customer_ID
    JOIN TravelAgents ta ON b.Agent_ID = ta.Agent_ID
    LEFT JOIN Season_Packages sp ON b.Agent_ID = sp.Agent_ID;
    
Select * From BookingDetails2;

--  prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis - Emilia MV
SELECT
    Booking_ID,
    Customer_ID,
    CustomerName,
    Agent_ID,
    AgentName,
    Date_of_journey,
    Destination,
    Mode_of_transport,
    No_of_persons,
    Price,
    Package_ID,
    Season,
    Activity,
    Location
FROM
    BookingDetails2
ORDER BY
    Date_of_journey;
        
-- In your database, create a trigger and demonstrate how it runs - Ketana
CREATE TRIGGER AfterBookingInsert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET Status = 'Booked'
    WHERE Room_ID = NEW.Room_ID;
END;

-- In your database, create an event and demonstrate how it runs - Ketana
CREATE EVENT RoomUpdate
ON COMPLETION PRESERVE 
DO BEGIN UPDATE Rooms 
SET Status = 'Available'; 
END; 

-- Create stored procedure and demonstrate how it runs - Rhona B
DELIMITER //
CREATE PROCEDURE GetHotelInfo(IN hotelID VARCHAR(20))
BEGIN
	SELECT *
    FROM Hotels
    WHERE Hotel_ID = hotelID;
    END//
DELIMITER ;
CALL GetHotelInfo ('SRE');

-- Prepare an example query with GROUP BY and having to demonstrate how to extract data from your DB for analysis - Rhona B
-- The query is Find hotels with an average room rate greater than 60
Select
H. Hotel_ID,
H. HotelName,
AVG (R.RoomRate) AS AvgRoomRate
From
Hotels H
JOIN Rooms R ON H. Hotel_ID = R.Hotel_ID
GROUP BY
H. Hotel_ID, H.HotelName
HAVING
AVG(R.RoomRate) > 60.00;
