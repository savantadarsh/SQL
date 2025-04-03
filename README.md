# Project Overview: CloudFlow SaaS Revenue & Retention Optimization
## Business Objective:
The goal of this project is to investigate revenue trends, customer retention challenges, and payment process efficiency in order to surface recommendations for optimizing product investments, improving customer loyalty, and streamlining operational workflows.
For making quick insights, descriptive statistics are calculated. The minimum, maximum, average and standard deviation of monthly revenue for each product for the year 2022 are calculated. 

## Company Background:
Founded in 2018, CloudFlow is a fast-growing SaaS company offering cloud-based workflow automation tools to businesses globally. Its subscription plans (Basic, Pro, Enterprise) cater to diverse customer segments, with a focus on recurring revenue through subscriptions, upsells, and renewals.
Recent initiatives include a new email engagement campaign, a redesigned customer support page, and a pilot for an upcoming product tier. Leadership seeks to address:
•	Declining customer retention rates.
•	Inconsistent revenue growth across product lines.
•	Bottlenecks in the payment and renewal processes.

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


