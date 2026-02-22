select 
ReviewID,
CustomerID,
ProductID,
ReviewDate,
Rating,
REPLACE(ReviewText, '  ', ' ') as ReviewText
from dbo.customer_reviews;
