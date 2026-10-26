WITH RECURSIVE gen(n) AS (
    SELECT 1
    UNION ALL
--   SELECT n + 1 FROM gen WHERE n < 50000
    SELECT n + 1 FROM gen WHERE n < 5000000 -- 5,000,000
)
UPDATE sales
SET    quantity = quantity + 1
WHERE  id IN (
    SELECT ABS(RANDOM()) % 20000000
    FROM   gen
);
