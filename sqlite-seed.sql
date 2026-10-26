CREATE TABLE IF NOT EXISTS sales (
    id        INTEGER  PRIMARY KEY,
    category  TEXT,
    region    TEXT,
    amount    REAL,
    quantity  INTEGER
);

WITH RECURSIVE counter(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM counter
    -- WHERE n < 1000000       -- 1 million rows ≈ 50MB
    -- WHERE n < 2000000   -- 2M  rows ≈ 100MB
    WHERE n < 20000000   -- 20M  rows ≈ 1000MB
)
INSERT INTO sales (id, category, region, amount, quantity)
SELECT
    n AS id,

    -- Cycle through categories using modulo
    CASE (n % 5)
        WHEN 0 THEN 'electronics'
        WHEN 1 THEN 'clothing'
        WHEN 2 THEN 'food'
        WHEN 3 THEN 'furniture'
        WHEN 4 THEN 'toys'
    END AS category,

    -- Cycle through regions using modulo
    CASE (n % 4)
        WHEN 0 THEN 'north'
        WHEN 1 THEN 'south'
        WHEN 2 THEN 'east'
        WHEN 3 THEN 'west'
    END AS region,

    -- Pseudo random amount between 1.00 and 9999.99
    -- SQLite has no rand(), use rowid math as substitute
    ROUND(
        (((n * 1103515245 + 12345) & 0x7fffffff) % 999999) / 100.0 + 1.0
    , 2) AS amount,

    -- Pseudo random quantity between 1 and 100
    ((n * 214013 + 2531011) & 0x7fffffff) % 100 + 1 AS quantity

FROM counter
WHERE NOT EXISTS (SELECT 1 FROM sales LIMIT 1); -- skip if already seeded

