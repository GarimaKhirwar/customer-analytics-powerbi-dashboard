with duplicaterecords as(
select JourneyID,
CustomerID,
ProductID,
VisitDate,
Stage,
Action,
Duration,
row_number() over(
partition by CustomerID,
ProductID,
VisitDate,
Stage,
Action,
Duration
order by JourneyID) as row_num 
from customer_journey)
-- to see the duplicate records 
select * from duplicaterecords
where row_num=2

-- now we will only choose unique records and provide the value where duration is null
select JourneyID,
CustomerID,
ProductID,
VisitDate,
Stage,
Action,
coalesce(Duration, avg_duration) as Duration
from
(select JourneyID,
CustomerID,
ProductID,
VisitDate,
UPPER(Stage) as Stage,
Action,
Duration,
avg(Duration) over(partition by VisitDate) as avg_duration,
row_number() over(
partition by CustomerID,
ProductID,
VisitDate,
Stage,
Action,
Duration
order by JourneyID) as row_num 
from customer_journey) as subquery
where row_num = 1;