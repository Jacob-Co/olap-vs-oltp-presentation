WITH RECURSIVE gen(n) AS (
    SELECT 1
    UNION ALL
    --SELECT n + 1 FROM gen WHERE n < 10000
    SELECT n + 1 FROM gen WHERE n < 100000
)
INSERT INTO sales (category, region, amount, quantity)
SELECT
    CASE (ABS(RANDOM()) % 3)
        WHEN 0 THEN 'Electronics'
        WHEN 1 THEN 'Clothing'
        ELSE        'Food'
    END,
    CASE (ABS(RANDOM()) % 4)
        WHEN 0 THEN 'North'
        WHEN 1 THEN 'South'
        WHEN 2 THEN 'East'
        ELSE        'West'
    END,
    ROUND((ABS(RANDOM()) % 100000) / 100.0, 2),
    ABS(RANDOM()) % 100 + 1
FROM gen;
