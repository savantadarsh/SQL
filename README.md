# Projects in SQL
## Business Problem 1
1)	How much revenue does each product usually generate each month?  
2)	Which product has the most success throughout all of last year?  
3)	Did either product fluctuate greatly each month or was the month-to-month trend consistent?  

For making quick insights, descriptive statistics are calculated. The minimum, maximum, average and standard deviation of monthly revenue for each product for the year 2022 are calculated. 
A common table expression (CTE) is used to achieve the business objectives.

The dataset can be found [here](assets/BP1/tc.zip).

### SQL Script
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

![Descriptive Statistics](assets/BP1/BP1.png)

## Business Problem 2
Tracking how many users have clicked the link in the campaign email. In particular, how many users clicked the email link one time, two times, three times, and so on?

### SQL Script
    with cte as (
    select userid, count(userid) as num_link_clicks from frontendeventlog
    where eventid = 5
    group by userid
    )
    select distinct(num_link_clicks), count(userid) as num_users from cte
    group by num_link_clicks;

![Output](assets/BP2/BP2.png)


