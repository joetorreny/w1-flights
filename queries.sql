****TASK1****
SELECT 
count(*) as NoOFListedPlanesWithSpeed,
min(speed) as MinSpeed,
max(speed) as MaxSpeed 
FROM planes
where speed is not null
INTO OUTFILE "C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\t1.csv "
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'

****TASK2****
SELECT 
sum(distance) as TotalDistance,
sum(case when tailnum is null then distance else 0 end) as TotalDistanceNoTailnum
 FROM flights
 where year = 2013
 and month = 1
 INTO OUTFILE "C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\t2.csv "
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'

****TASK3****
SELECT sum(distance) as distance ,p.manufacturer FROM flights f
inner join planes p on p.tailnum = f.tailnum
where f.year = 2013 and f.month = 7 and f.day = 5
group by p.manufacturer
INTO OUTFILE "C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\t31.csv "
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'

SELECT sum(distance) as distance ,p.manufacturer FROM flights f
left outer join planes p on p.tailnum = f.tailnum
where f.year = 2013 and f.month = 7 and f.day = 5
group by p.manufacturer
INTO OUTFILE "C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\t32.csv"
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'

**Using inner join the result is given if value is in both tables, using left join all results are given that are in flights table, even nulls.

****TASK4****
Carrier and plane name that has the most flights in 2013 January.

SELECT count(*)as numberOfFlights,p.model,a.name FROM flights f
inner join planes p on p.tailnum = f.tailnum
inner join airlines a on a.carrier = f.carrier
and f.year = 2013 and f.month = 1
order by 
count(*) desc
limit 1
INTO OUTFILE "C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\t4.csv "
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
