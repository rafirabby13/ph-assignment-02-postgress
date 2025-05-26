DROP TABLE rangers

DROP TABLE species

DROP TABLE sightings

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
) 



   INSERT INTO rangers ("name", region) VALUES
('Alice Johnson', 'North Forest'),
('Bob Smith', 'East Hills'),
('Catherine Lee', 'South Plains'),
('David Kim', 'West Valley'),
('Emily Davis', 'Central Woods'),
('Frank Miller', 'Northern Lakes'),
('Grace Wilson', 'Eastern Highlands'),
('Henry Brown', 'Southern Marsh'),
('Isabella Garcia', 'Western Ridge'),
('Jack Martinez', 'Central Forest');
 






CREATE TABLE species(
    species_id  SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50) 

) 


INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status )
VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01','Endangered'),
('Bengal Tiger', 'Panthera tigris tigris',  '1758-01-01 ','Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01','Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01','Endangered'),
('Afriatic Bandar', 'Elephas maximus indicus', '1758-01-01','Endangered')






CREATE TABLE sightings(
    sighting_id  SERIAL PRIMARY KEY,
    species_id  INT REFERENCES species(species_id),
    ranger_id   INT REFERENCES rangers(ranger_id),
    "location"  VARCHAR(50) NOT NULL,
    sighting_time TIMESTAMP,
    notes  VARCHAR(50) 

) 





INSERT INTO sightings(species_id, ranger_id, "location", sighting_time, notes)
VALUES 
(1,1,'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2,2,'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3,3,'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1,2,'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(4, 10,'Passout area ', '2024-05-8 8:30:00', NULL),
(4, 10,'Passout2 area ', '2024-05-8 8:30:00', NULL),
(3, 10,'Passout3 area ', '2024-05-8 8:30:00', NULL),
(3, 10,'Passout4 area ', '2024-05-8 8:30:00', NULL),
(3, 10,'Passout5 area ', '2024-05-8 8:30:00', NULL),
(2, 10,'Passout6 area ', '2024-05-8 8:30:00', NULL),
(2, 10,'Passout7 area ', '2024-05-8 8:30:00', NULL)





-- Problem - 01
INSERT INTO rangers("name", region)
VALUES ('Derek Fox','Coastal Plains')

-- Problem - 02

SELECT COUNT(DISTINCT species_id) as unique_species_count   from sightings 

-- Problem - 03

SELECT * FROM sightings  WHERE "location" LIKE '%Pass%'

-- Problem - 04
SELECT name, COUNT(sighting_id) as total_sightings  from rangers LEFT JOIN sightings on rangers.ranger_id = sightings.ranger_id GROUP BY (rangers.name, rangers.ranger_id)






SELECT * from species

SELECT * from sightings

-- Problem - 05
SELECT common_name  from sightings FULL JOIN species on sightings.species_id = species.species_id WHERE sightings.sighting_id IS NULL

-- Problem - 06
SELECT common_name, sighting_time, name from rangers JOIN sightings on rangers.ranger_id = sightings.ranger_id JOIN species on sightings.species_id = species.species_id ORDER BY sighting_time DESC LIMIT 2





-- Problem - 07
update species 
SET conservation_status = 'Historic'  WHERE EXTRACT(YEAR FROM discovery_date) < 1800




-- Problem - 08
SELECT sighting_id, 
  CASE  
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) <= 17 THEN 'Afternoon'
    ELSE 'Evening'
END as "time_of_day"
FROM sightings







-- Problem - 09
DELETE  from rangers
where ranger_id IN (SELECT rangers.ranger_id from rangers 
left JOIN sightings on rangers.ranger_id = sightings.ranger_id WHERE sightings.ranger_id is NULL)



