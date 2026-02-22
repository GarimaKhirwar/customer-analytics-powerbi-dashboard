select 
EngagementID,
ContentID,
ContentType,
Likes,
EngagementDate,
CampaignID,
ProductID,
left(ViewsClicksCombined,charindex('-', ViewsClicksCombined)-1) AS Views,
right(ViewsClicksCombined, len(ViewsClicksCombined) - charindex('-',ViewsClicksCombined)) AS Clicks
from dbo.engagement_data;