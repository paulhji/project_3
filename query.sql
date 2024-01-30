-- Database querying

-- Collision database
SELECT * FROM collision;

-- People_affected database
SELECT * FROM people_affected;

-- Vehicle_info database
SELECT * FROM vehicle_info;


-- Finding the top boroughs of accidents
SELECT
	borough,
	COUNT(*) as collision_count
FROM
	collision
GROUP BY
	borough
ORDER BY
	collision_count DESC;


-- Collisions per day
SELECT crash_date, COUNT(*) AS daily_collisions
FROM collision
GROUP BY crash_date
ORDER BY crash_date;


-- Ordering collisions by crash date
SELECT crash_date, borough
FROM collision
ORDER BY crash_date;


-- Identifying collisions with High Pedestrian Casualties
SELECT c.collision_id, c.borough, c.crash_date, c.crash_time,
       p.pedestrians_killed, p.pedestrians_injured
FROM collision c
JOIN people_affected p ON c.collision_id = p.collision_id
WHERE p.pedestrians_killed + p.pedestrians_injured > 0.5;


-- Collisions with Multiple Contributing Vehicles
SELECT c.collision_id, c.borough, c.crash_date, c.crash_time,
       v.vehicle_1, v.vehicle_2, v.vehicle_3,
       v.contributing_vehicle_1, v.contributing_vehicle_2, v.contributing_vehicle_3
FROM collision c
JOIN vehicle_info v ON c.collision_id = v.collision_id
WHERE 
    (v.vehicle_1 IS NOT NULL OR v.vehicle_2 IS NOT NULL OR v.vehicle_3 IS NOT NULL) AND
    (v.contributing_vehicle_1 IS NOT NULL OR v.contributing_vehicle_2 IS NOT NULL OR v.contributing_vehicle_3 IS NOT NULL);


-- Collisions with Cyclist Casualties
SELECT c.collision_id, c.borough, c.crash_date, c.crash_time,
       p.cyclist_killed, p.cyclist_injured
FROM collision c
JOIN people_affected p ON c.collision_id = p.collision_id
WHERE p.cyclist_killed + p.cyclist_injured > 0;


-- Average Casualties per Collision
SELECT AVG(p.persons_injured + p.persons_killed) AS avg_casualties
FROM people_affected p;


-- Common hours of the day
SELECT
    EXTRACT(HOUR FROM TO_TIMESTAMP(crash_time, 'HH24:MI:SS')) AS hour_of_day,
    COUNT(*) AS accident_count
FROM
    collision
GROUP BY
    hour_of_day
ORDER BY
    hour_of_day;


-- Finding common days of the week
SELECT
    CASE EXTRACT(DOW FROM crash_date)
        WHEN 0 THEN 'Sunday'
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
    END AS day_of_week,
    COUNT(*) AS collision_count
FROM
    collision
GROUP BY
    day_of_week
ORDER BY
    collision_count DESC;


-- Identifying Common Contributing Factors
SELECT
    c.borough,
    v.contributing_vehicle_1,
    COUNT(*) AS factor_count
FROM collision c
JOIN vehicle_info v ON c.collision_id = v.collision_id
GROUP BY c.borough, v.contributing_vehicle_1
ORDER BY factor_count DESC;


-- Different collisions based on vehicle types 
SELECT
    v.vehicle_1 AS vehicle_type,
    SUM(p.persons_injured) AS total_injuries,
    SUM(p.persons_killed) AS total_fatalities
FROM vehicle_info v
JOIN people_affected p ON v.collision_id = p.collision_id
GROUP BY v.vehicle_1
ORDER BY total_injuries DESC, total_fatalities DESC;


-- Finding contibuting factors that stand out in the dataset
SELECT
    v.contributing_vehicle_1 AS contributing_factor,
    COUNT(*) AS factor_count
FROM vehicle_info v
GROUP BY v.contributing_vehicle_1
ORDER BY factor_count DESC;



