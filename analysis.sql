-- 1. High impressions, low CTR queries

SELECT query, impressions, clicks, ctr, position
FROM queries_data
WHERE impressions > 3000
ORDER BY ctr ASC;

-- 2. CTR vs Position Analysis

SELECT 
    ROUND(position) AS position_group,
    AVG(ctr) AS avg_ctr,
    COUNT(*) AS query_count
FROM queries_data
WHERE impressions > 3000
GROUP BY position_group
ORDER BY position_group;