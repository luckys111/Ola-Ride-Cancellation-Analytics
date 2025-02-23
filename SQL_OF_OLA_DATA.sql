create database Ola;
use Ola;
drop table bookings;

#1.Retrive all successful Bookings
create view Successful_Bookings as 
select * from Booking2 where Booking_Status = "Success";
select * from Successful_Bookings ;

#2.Find the average ride distance for each vehicle type:
create view AVERAGE_RIDE_DISTANCE AS
SELECT Vehicle_Type, avg(Ride_Distance) as avg_ride_distance from Booking2 group by Vehicle_Type;
select * from AVERAGE_RIDE_DISTANCE ;

#3. Get the total number of cancelled rides by customers:
create view TOTAL_CANCELED_RIDE AS
select count(*) from booking2 where Booking_Status = "Canceled by Customer";
select * from TOTAL_CANCELED_RIDE ;

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW TOP5_CUSTOMER_RIDES AS 
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM booking2 GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;
SELECT * FROM TOP5_CUSTOMER_RIDES;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM booking2
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';
SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;

#6.Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM booking2 WHERE Vehicle_Type = 'Prime Sedan';
SELECT *FROM Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made u
Create View UPI_Payment As
SELECT * FROM booking2
WHERE Payment_Method = 'UPI';
SELECT *FROM UPI_Payment;

#8. Find the average customer rating per vehicle
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as a
FROM booking2
GROUP BY Vehicle_Type;
SELECT * FROM AVG_Cust_Rating;

#9. Calculate the total booking value of rides com
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_
FROM booking2
WHERE Booking_Status = 'Success';
SELECT * FROM total_successful_ride_value;

#10. List all incomplete rides along with the reas
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM booking2
WHERE Incomplete_Rides = 'Yes';
SELECT * FROM Incomplete_Rides_Reason;

