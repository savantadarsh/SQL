# CloudFlow Revenue and Retention Optimization Project 
## Business Objective
CloudFlow aims to **maximize recurring revenue and customer retention** by identifying key factors influencing subscription growth and churn. The objective of this project is to leverage data-driven insights to **optimize revenue streams** (through better product uptake and upsells) and **improve customer retention** (by addressing churn causes and engagement gaps). This will guide strategic initiatives to increase customer lifetime value and reduce churn rate.

## Company Background
CloudFlow is a **subscription-based SaaS company** offering cloud solutions on a tiered plan model (e.g. Basic, Pro, Premium). As a B2B-focused platform, CloudFlow serves organizations of varying sizes – from small teams to enterprise clients – on monthly or annual subscriptions. The company’s revenue model relies on **recurring subscription fees** and expansion within accounts (upselling additional product modules or higher-tier plans). Maintaining high customer satisfaction and continual product value is critical in **driving renewals and upgrades** in this SaaS model.

## Project Purpose
The purpose of the Revenue and Retention Optimization project is to **analyze CloudFlow’s usage, financial, and customer interaction data** to uncover actionable insights. By examining subscription revenues, user engagement patterns, support interactions, and conversion funnels, the project addresses key business questions:

*Where are we gaining or losing revenue?*

*Why do customers churn, and how can we prevent it?*

*Where do users encounter friction in the product or sales funnel?*

The analysis of these data points will help CloudFlow develop targeted strategies across product, marketing, engineering, and customer success teams to **boost revenue growth and improve retention.**

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


