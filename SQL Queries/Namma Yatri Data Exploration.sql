
/*SQL PROJECT - NAMMA YATRI: ANALYSIS AND DATA EXPLORATION*/


--THE DATA IS OF A SINGLE DAY--


Create database dataexploration; 

use dataexploration

select*from assembly;
select*from duration;
select*from payment;
select*from trip_details;
select*from trips;



--ANALYSIS AND DATA EXPLORATION--



--1. Difference between trips and trip_details table

Select count(*) as trips_count
from trips;                              -- contains all the details of trips that finally ended or thr driver ended

Select count(*) as trip_details_count
from trip_details;                       --contains all the details on all the searches happend

--On count the numbers are matching

Select count(*) as trips_count from trips;

Select count(*) as trip_details_count from trip_details
where end_ride=1;

--2. Total No Of Trips 

select count(distinct TripID) as total_trips
from trip_details;

--3. To check duplicate Ids are present or not

select TripID, count(TripID) as trip_count from trip_details
group by TripID
having count(TripID)>1;               --No Duplicate TripID value is present here

--4. Total No Of Distinct Drivers

select*from trips;

select count(distinct DriverID) as total_drivers 
from trips;

--5. Total Earnings

select sum(Fare) as total_earning 
from trips;

--6. Total Completed Trips

select count(distinct TripID) as Trips 
from trips;

--7. Total No Of Searches which took place

select sum(searches) as total_search 
from trip_details;            --2161

--8. Total No Of Searches which got estimate

select sum(searches_got_estimate) as got_estimate 
from trip_details;            --1758 

--9. Total Searches For Quotes

select sum(searches_for_quotes) as quote_search 
from trip_details;            --1455 

--10. Total seaches which got quotes

select sum(searches_got_quotes) as got_quotes
from trip_details;            --1277 

--11. Total Number of trips which is not cancelled by drivers

select sum(driver_not_cancelled) as notcancelled_trip 
from trip_details;            --1140 


--12. Total Number of trips which got cancelled by drivers

select count(*) - sum(driver_not_cancelled) as cancelled_trip 
from trip_details;            --1021

--13. Total OTP Entered

select sum(otp_entered) as otp 
from trip_details;             --983

--14. Total Number of End Ride

select sum(end_ride) as ride 
from trip_details;             --983

--15. Average Distance Per Trip

select round(avg(Distance),0) as avg_distance
from trips;

--16. Average Fare Per Trip

select round(avg(Fare),0) as avg_fare 
from trips;

--17. Distance Travelled

select sum(Distance) as total_distance
from trips;

--18. Which is the most used payment method

select*from trips;
select*from payment;

select FareMethod, count(distinct TripID) as fare_count 
from trips
group by FareMethod
order by count(distinct TripID) desc;       --4th payment method is the most used one

--19. Name of the most used fare method

select a.method from payment a inner join
(select top 1 FareMethod, count(distinct TripID) as fare_count from trips
group by FareMethod
order by count(distinct TripID) desc) b
on a.FareMethod=b.FareMethod;               --credit card is the most used fare method

--20. The highest payment was made through which instrument

--in the entire day which payment method had the max sum of payment amount for trip

select*from trips;

select top 1* from trips
order by Fare desc;

--name of the method which has max sum of payment amount for trip

select a.method from payment a inner join
(select top 1* from trips
order by Fare desc) b
on a.FareMethod=b.FareMethod;

--which is the payment instrumnet through which the highest amount was paid into the entire day

select top 1 FareMethod, sum(Fare) as day_total_fare from trips
group by FareMethod
order by sum(Fare) desc;

--number of the payment instrumnet through which the highest amount was paid into the entire day

select a.FareMethod 
from payment as a 
inner join
(select top 1 FareMethod, sum(Fare) as total_fare
from trips
group by FareMethod
order by sum(Fare) desc
) b
on a.FareMethod=b.FareMethod; 

--21. Which Two locations had the most no of trips

select* from trips;

select loc_from, loc_to, count(distinct TripID) as tripid_count
from trips
group by  loc_from, loc_to
order by count(distinct TripID) desc;

--top 2 locations 

select top 2  loc_from, loc_to, count(distinct TripID) as trip  from trips
group by  loc_from, loc_to
order by count(distinct TripID) desc;

-- if there are 4 diff location having the same number of highest trips - use dense rank() [it will not skip the next value]

select*from
(select*,dense_rank() over(order by trip desc) as rnk
from
(select loc_from, loc_to, count(distinct TripID) as trip  from trips
group by  loc_from, loc_to
)a)b
where rnk=1;

--22. Top 5 Earning Drivers

select*from trips;

select*from
(select *, dense_rank() over(order by Fare desc) as rnk
from
(select DriverID, sum(Fare) as fare from trips
group by DriverID)b)c
where rnk<6;

--23. Which duration/ hours had more number of trips

select*from
(select*, rank() over(order by cnt desc) as rnk
from
(select DurationID, count(distinct TripID) as cnt from trips
group by DurationID)b)c
where rnk=1;

-- 24. Which driver, customer pair nhad more orders

select*from trips;

select DriverID, CustID, count( distinct TripID) as cnt from trips
group by DriverID, CustID;

--top 2

select*from
(select*, rank() over(order by cnt desc) rnk
from
(select DriverID, CustID, count( distinct TripID) as cnt from trips
group by DriverID, CustID)c)d
where rnk = 1;

--25. Search to Estimate Rate

select*from trip_details;

select concat(sum(searches_got_estimate)*100.0/sum(searches) , '%') as drop_prcnt
from trip_details;

--26. Estimate to search for quote rates

select concat(sum(searches_for_quotes)*100.0/sum(searches_got_estimate) , '%') as drop_prcnt
from trip_details;

--27. Quote Acceptance Rate

select concat(sum(searches_got_quotes)*100.0/sum(searches_for_quotes) , '%') as drop_prcnt
from trip_details;

--28. Quote Booking Rate

select concat(sum(customer_not_cancelled)*100.0/sum(searches_got_quotes) , '%') as drop_prcnt
from trip_details;

--29. Booking Cancellation Rate

select*from trip_details;

--Driver Cancellation
--Customer Cancellation

select concat(round(
(sum(case when customer_not_cancelled = 0 then 1 else 0 end) + 
sum(case when driver_not_cancelled = 0 then 1 else 0 end)) * 100.0 / 
sum(searches_got_quotes), 2), '%') as cancellation_rate
from trip_details;

--30. Conversion Rate

select concat(sum(end_ride)*100.0/sum(searches) , '%') as drop_prcnt
from trip_details;

--31. Which area got Highest trips in which duration

select*from trips;

select DurationID, loc_from, count(distinct TripID) as cnt
from trips
group by DurationID, loc_from;

select*, rank() over(partition by DurationID order by  cnt desc) rnk from
(select DurationID, loc_from, count(distinct TripID) as cnt from trips
group by DurationID, loc_from)a;

--partition by durationid

select* from
(select*, rank() over(partition by DurationID order by  cnt desc) rnk from
(select DurationID, loc_from, count(distinct TripID) as cnt from trips
group by DurationID, loc_from)a)c
where rnk=1;

--32. Which duration got the highest number of trips in each of the location present

--partition by location

select* from
(select*, rank() over(partition by loc_from order by  cnt desc) rnk from
(select DurationID, loc_from, count(distinct TripID) as cnt from trips
group by DurationID, loc_from)a)c
where rnk=1;

--33. Which area got the highest fare

select*from trips;
select*from trip_details;

select loc_from, sum(Fare) as total_fair from trips
group by loc_from;

select*from(select*, rank() over(order by Fare desc) rnk
from
(select loc_from, sum(Fare) as fare from trips
group by loc_from)b)c
where rnk=1;                   --location 6 got the highest number of fare

--34. Which area got the highest number of cancellations

--Customer Cancellation
--Driver Cancellation

select loc_from,Count(*)- sum(driver_not_cancelled) as driver_cancelled
from trip_details
group by loc_from;

select*from(select*, rank() over(order by cancelled desc) rnk
from
(select loc_from,Count(*)- sum(driver_not_cancelled) as cancelled
from trip_details
group by loc_from)b)c
where rnk=1;                    --location 1 has got the maximum number of driver cancellation


select*from(select*, rank() over(order by cancelled desc) rnk
from
(select loc_from,Count(*)- sum(customer_not_cancelled) as cancelled
from trip_details
group by loc_from)b)c
where rnk=1;                    --location 4 has got the highest number of customer cancellation

--35. Which duration got the highest fare

select*from(select*, rank() over(order by Fare desc) rnk
from
(select DurationID, sum(Fare) as fare from trips
group by DurationID)b)c
where rnk=1;                   --duration number 1 has got the highest number of fare

--36. Which duration got the highest number of trips

select*from(select*, rank() over(order by Fare desc) rnk
from
(select DurationID, count(distinct TripID) as fare from trips
group by DurationID)b)c
where rnk=1;                  --duration number 1 only had the highest number of trips

--37. Total number of customers

select count(distinct CustID) as total_customers 
from trips;

--38. Average duration per trip

select avg([Duration(in hours)]) as avg_duration 
from duration 
inner join trips 
on duration.DurationID = trips.DurationID;

--39. Total revenue per order

select DriverID, sum(Fare) as total_fare 
from trips 
group by DriverID;

--40. Total revenue per location

select loc_from, sum(Fare) as total_fare 
from trips 
group by loc_from;

--41. Average Fare per driver

select DriverID, avg(Fare) as avg_fare 
from trips 
group by DriverID;

--42. Average distance per driver

select DriverID, avg(Distance) as avg_distance 
from trips 
group by DriverID;

--43. Total number of trips per customer

select CustID, count(*) as total_trips 
from trips 
group by CustID;

--44. Most Frequent customers

select CustID, count(*) as trip_count 
from trips 
group by CustID 
order by trip_count desc;

--45. Revenue per hour 

select duration.DurationID, sum(Fare) as total_fare
from trips 
inner join duration 
on trips.DurationID = duration.DurationID 
group by duration.DurationID;

--46. Trip frequency by hour 

select duration.DurationID, count(*) as trip_count
from trips 
inner join duration 
on trips.DurationID = duration.DurationID 
group by duration.DurationID;






