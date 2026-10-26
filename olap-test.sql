.timer on

SELECT
    region,
    SUM(amount)   AS total_revenue,
    AVG(amount)   AS avg_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

/*
SELECT
    category,
    region,
    SUM(amount * quantity)   AS revenue,
    AVG(amount)              AS avg_price,
    COUNT(*)                 AS num_sales
FROM sales
GROUP BY category, region
ORDER BY revenue DESC;
*/

/*
SELECT
    category,
    region,
    SUM(amount * quantity)   AS revenue,
    AVG(amount)              AS avg_price,
    COUNT(*)                 AS num_sales
FROM sales
GROUP BY category, region
ORDER BY revenue DESC;
*/


/*
SELECT
    category,
    region,
    SUM(amount * quantity)   AS revenue,
    AVG(amount)              AS avg_price,
    COUNT(*)                 AS num_sales
FROM sales
GROUP BY category, region
ORDER BY revenue DESC;


SELECT
    category,
    region,
    SUM(amount * quantity)   AS revenue,
    AVG(amount)              AS avg_price,
    COUNT(*)                 AS num_sales
FROM sales
GROUP BY category, region
ORDER BY revenue DESC;
*/
/*
SELECT
    region,
    SUM(amount)   AS total_revenue,
    AVG(amount)   AS avg_revenue,
    COUNT(*)      AS num_transactions,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Second run  (warm cache - pages already in RAM)
SELECT
    region,
    SUM(amount)   AS total_revenue,
    AVG(amount)   AS avg_revenue,
    COUNT(*)      AS num_transactions,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Third run  (cache fully warm)
SELECT
    region,
    SUM(amount)   AS total_revenue,
    AVG(amount)   AS avg_revenue,
    COUNT(*)      AS num_transactions,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;
*/
