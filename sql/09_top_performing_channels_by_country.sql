WITH ChannelPerformance AS (
    SELECT 
        m.Country,
        UNNEST(ARRAY['Bulkmail', 'Twitter', 'Instagram', 'Facebook', 'Brochure']) AS Channel,
        UNNEST(ARRAY[a.Bulkmail_ad::INT, a.Twitter_ad::INT, a.Instagram_ad::INT, a.Facebook_ad::INT, a.Brochure_ad::INT]) AS Success
    FROM production_marketing m
    JOIN production_ads a ON m.ID = a.ID
),
RankedChannels AS (
    SELECT 
        Country,
        Channel,
        SUM(Success) AS Total_Successes,
        RANK() OVER (PARTITION BY Country ORDER BY SUM(Success) DESC) as Rank
    FROM ChannelPerformance
    GROUP BY Country, Channel
)
SELECT Country, Channel, Total_Successes
FROM RankedChannels
WHERE Rank = 1
ORDER BY Total_Successes DESC;