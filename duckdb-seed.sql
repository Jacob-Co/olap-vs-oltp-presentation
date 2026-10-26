SET force_compression = 'Uncompressed';
-- create_and_seed_sales.sql
-- Creates and seeds sales table to ~50MB for DuckDB

-- ============================================================
-- CREATE TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS sales (
    id          INTEGER,
    category    VARCHAR,
    region      VARCHAR,
    amount      DOUBLE,
    quantity    INTEGER
);


-- ============================================================
-- SEED DATA
-- ============================================================
-- Row size estimate:
--   id        INTEGER  ~4  bytes
--   category  VARCHAR  ~8  bytes  (avg string length)
--   region    VARCHAR  ~6  bytes  (avg string length)
--   amount    DOUBLE   ~8  bytes
--   quantity  INTEGER  ~4  bytes
--   overhead           ~20 bytes
--   Total              ~50 bytes per row
--
-- 50MB = 52,428,800 bytes
-- Rows needed = 52,428,800 / 50 = ~1,048,576 rows
-- Using 1,400,000 rows to be safe
-- ============================================================

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

    -- Random amount between 1.00 and 9999.99
    ROUND((random() % 999999) / 100.0 + 1.0, 2) AS amount,

    -- Random quantity between 1 and 100
    (abs(random()) % 100 + 1)::INTEGER AS quantity

-- FROM range(1, 1400001) t(n)     -- DuckDB has native range()!
-- FROM range(1, 700001)  t(n)  -- 700K  rows ≈  25MB
-- FROM range(1, 1400001) t(n)  -- 1.4M  rows ≈  50MB
-- FROM range(1, 2800001) t(n)  -- 2.8M  rows ≈ 100MB
-- FROM range(1, 2000001) t(n)  -- 2M rows
FROM range(1, 20000001) t(n)  -- 20M rows
WHERE NOT EXISTS (SELECT 1 FROM sales LIMIT 1);

