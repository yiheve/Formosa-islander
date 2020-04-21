SELECT
       (SELECT COUNT (tags) FROM analytics.user
        WHERE tags LIKE '%subscription-blue%') AS Blue,
        (SELECT COUNT (tags) FROM analytics.user
        WHERE tags LIKE '%subscription-black%') AS Black,
        (SELECT COUNT (tags) FROM analytics.user
        WHERE tags LIKE '%subscription-metal%') AS Metal
FROM analytics.user
GROUP BY Blue;