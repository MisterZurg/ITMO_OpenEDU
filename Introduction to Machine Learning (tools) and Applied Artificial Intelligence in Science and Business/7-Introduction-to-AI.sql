-- ======== Dataset ========

-- The database Public Transport stores the data on public transport routes (buses and trolleys) of some selected routes.
-- The routes are listed in the table ROUTE_BY_STOPS, the public transport routes for September, the 9 and the 10 of the year 2019 are listed in the table TRACK.
-- However, the data on public transport are collected with the help of sensors, and therefore there are a lot of missing values.
-- However, even taking into account the conditions, it would be worth to provide each stop with a smart display, showing the real arrival time of the public transport in the desired direction.
-- How to forecast the arrival time based on the given public transport data? The exercise of this lecture is devoted to this problem.


-- ======== Task ========

-- Let's assume that that smart stops are installed along the entire route of the bus no. 10 .
-- On the screen of each smart stop the following information is shown:
-- the location of the nearest bus in this direction,
-- as well as the number of minutes before its arrival.
--If the passenger is at the stop with the identifier 18077, and the nearest bus in this direction is at the stop with the identifier 19157.
--
-- What number of minutes before the bus arrival should be shown on the screen of the smart stop,
-- assuming that the average bus speed is 10 km per hour at this time of day.
--
-- Round the obtained result to integers (whole minutes), for example, if the bus arrives in 1.5 minutes, enter 2.
--
-- Enter the number of minutes:


-- Common Language
SELECT
    round(SUM(distance_back) / (10000.00 / 60))
FROM
    route_by_stops,
    vehicle,
    (SELECT id_direction, stop_number AS stop_number_start FROM route_by_stops WHERE route_number = 10 AND id_stop = 19157)
    start_stop,
    (SELECT stop_number AS stop_number_end FROM route_by_stops WHERE route_number = 10 AND id_stop = 18077) end_stop
WHERE route_number = 10
    AND route_by_stops.id_vehicle = vehicle.id_vehicle
    AND vehicle_name = 'BUS'
    AND route_by_stops.id_direction = start_stop.id_direction
    AND stop_number > stop_number_start
    AND stop_number <= stop_number_end


-- RU course
select round(sum(distance_back) / (10000.00 / 60))
from route_by_stops,
vehicle,
(select id_direction, stop_number as stop_number_start from route_by_stops where route_number = 10 and id_stop = 19157) start_stop,
(select stop_number as stop_number_end from route_by_stops where route_number = 10 and id_stop = 19067) end_stop
where route_number = 10
and route_by_stops.id_vehicle = vehicle.id_vehicle
and vehicle_name = 'АВТОБУС'
and route_by_stops.id_direction = start_stop.id_direction
and stop_number > stop_number_start
and stop_number <= stop_number_end
