create database Uber;
use Uber;

-- Table for Cab Driver Details
CREATE TABLE CabDriverDetails (
    DRIVER_ID INT AUTO_INCREMENT PRIMARY KEY,
    DRIVER_NAME VARCHAR(100),
    AVAILABLE_VEHICLE VARCHAR(100)
);
-- Inserting data into CabDriverDetails table
INSERT INTO CabDriverDetails(DRIVER_NAME, AVAILABLE_VEHICLE)
VALUES 
('Mike Johnson', 'Toyota Camry'),
('Sarah Parker', 'Honda Accord'),
('Tom Davis', 'Ford Fusion'),
('Emily Clark', 'Chevrolet Malibu'),
('Olivia White', 'Nissan Altima'),
('Jacob Brown', 'Subaru Outback'),
('Lily Wilson', 'Volkswagen Jetta'),
('Lucas Garcia', 'Hyundai Elantra'),
('Sophia Adams', 'Kia Optima'),
('William Lee', 'Mazda 6');

select * from CabDriverDetails;

-- Table for Customer Details
CREATE TABLE CustomerDetails (
    PASSENGER_ID INT AUTO_INCREMENT PRIMARY KEY,
    PASSENGER_NAME VARCHAR(100),
    DATE_OF_TRIP DATE,
    PICK_UP_LOCATION VARCHAR(100),
    DROP_OFF_LOCATION VARCHAR(100),
    FARE DECIMAL(10, 2),
    DRIVER_ID INT,
    FOREIGN KEY (DRIVER_ID) REFERENCES CabDriverDetails(DRIVER_ID)
);

-- Inserting data into CustomerDetails table
INSERT INTO CustomerDetails (PASSENGER_NAME, DATE_OF_TRIP, PICK_UP_LOCATION, DROP_OFF_LOCATION, FARE, DRIVER_ID) 
VALUES 
('John Doe', '2023-11-01', 'Location A', 'Location B', 35.50, 1),
('Jane Smith', '2023-11-02', 'Location C', 'Location D', 42.25, 2),
('Alice Johnson', '2023-11-03', 'Location E', 'Location F', 28.75, 3),
('Bob Williams', '2023-11-04', 'Location G', 'Location H', 50.00, 2),
('Emma Brown', '2023-11-05', 'Location I', 'Location J', 20.00, 1),
('William Davis', '2023-11-06', 'Location K', 'Location L', 38.50, 3),
('Olivia Wilson', '2023-11-07', 'Location M', 'Location N', 45.75, 2),
('James Taylor', '2023-11-08', 'Location O', 'Location P', 32.25, 1),
('Sophia Martinez', '2023-11-09', 'Location Q', 'Location R', 55.00, 3),
('Logan Garcia', '2023-11-10', 'Location S', 'Location T', 28.00, 2);

select * from CustomerDetails;

-- Retrieve all customer trips along with their respective driver details:
select c.DRIVER_NAME, c.AVAILABLE_VEHICLE ,  cu.PASSENGER_NAME, cu.DATE_OF_TRIP, cu.PICK_UP_LOCATION,
 cu.DROP_OFF_LOCATION, cu.FARE from CustomerDetails cu join CabDriverDetails c on c.DRIVER_ID = cu.DRIVER_ID;
 
 -- List drivers along with the total number of trips they have completed:
 
 select d.DRIVER_NAME , d.AVAILABLE_VEHICLE , sum(c.PASSENGER_ID) as TotalTrips from CabDriverDetails d left join CustomerDetails c
 ON c.DRIVER_ID = d.DRIVER_ID GROUP BY d.DRIVER_ID;
 
 select * from customerdetails;
 select * from CabDriverDetails;
 
 -- Find the top 5 highest fares paid by customers:
 
 select PASSENGER_NAME, DATE_OF_TRIP, FARE from customerdetails order by fare desc limit 5;
 
 -- Retrieve driver details for a specific customer's trip:
 
 SELECT c.PASSENGER_NAME, c.DATE_OF_TRIP, c.PICK_UP_LOCATION, c.DROP_OFF_LOCATION, c.FARE,
       d.DRIVER_NAME, d.AVAILABLE_VEHICLE
FROM CustomerDetails c
INNER JOIN CabDriverDetails d ON c.DRIVER_ID = d.DRIVER_ID
WHERE c.PASSENGER_NAME = 'John Doe';

 -- Calculate the average fare for each driver:
 
  select * from customerdetails;

alter table customerdetails change DATE_OF_TRIP  DATE_OF_TRIP DATETIME;
describe customerdetails;

 select * from CabDriverDetails;
 
 select  c.PASSENGER_NAME, c.DATE_OF_TRIP, d.DRIVER_NAME, d.AVAILABLE_VEHICLE , avg(c.fare) AVG_fARE  from customerdetails c  join CabDriverDetails d
 on c.DRIVER_ID = d.DRIVER_ID group by d.DRIVER_ID;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


