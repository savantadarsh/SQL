use tech_comp;

-- Business Problem 1
WITH monthly_revs AS (
    SELECT 
        DATE_FORMAT(s.orderdate, '%M') AS orderdate,
        p.productname, 
        SUM(s.revenue) AS revenue 
    FROM subscriptions AS s 
    JOIN products AS p 
      ON s.productid = p.productid
    WHERE s.orderdate BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY DATE_FORMAT(s.orderdate, '%M'), p.productname
)

SELECT
    productname,
    MIN(revenue) AS min_rev,
    MAX(revenue) AS max_rev,
    AVG(revenue) AS avg_rev,
    STDDEV(revenue) AS std_dev_rev
FROM 
    monthly_revs
GROUP BY 
    productname;



