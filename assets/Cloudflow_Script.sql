use tech_comp;

-- Business Problem 1a
with monthly_revs as (
    select 
        date_format(s.orderdate, '%M') as orderdate,
        p.productname,
        sum(s.revenue) as revenue 
    from subscriptions as s 
		join products as p 
		on s.productid = p.productid
    group by date_format(s.orderdate, '%M'), p.productname
    order by field(p.productname, 'Basic', 'Pro', 'Premium')
)

select
    productname,
    min(revenue) as min_rev,
    max(revenue) as max_rev,
    round(AVG(revenue),2) as avg_rev,
    round(stddev(revenue),2) as std_dev_rev
from 
    monthly_revs
group by 
    productname;
    
-- Business Problem 1b
with cte1 as (
select 
	date_format(orderdate, '%m') as Month, sum(revenue) as 2022_Product_Basic
from 
	subscriptions
where
	productid = 1 and year(orderdate) = 2022
group by
	date_format(orderdate, '%m')
order by
	date_format(orderdate, '%m') asc
),

cte2 as (
select 
	date_format(orderdate, '%m') as Month, sum(revenue) as 2022_Product_Pro
from 
	subscriptions
where
	productid = 2 and year(orderdate) = 2022
group by
	date_format(orderdate, '%m')
order by
	date_format(orderdate, '%m') asc
),

cte3 as (
select 
	date_format(orderdate, '%m') as Month, sum(revenue) as 2022_Product_Premium
from 
	subscriptions
where
	productid = 3 and year(orderdate) = 2022
group by
	date_format(orderdate, '%m')
order by
	date_format(orderdate, '%m') asc
),

cte4 as(
select 
	date_format(orderdate, '%m') as Month, sum(revenue) as 2023_Product_Basic
from 
	subscriptions
where
	productid = 1 and year(orderdate) = 2023
group by
	date_format(orderdate, '%m')
order by
	date_format(orderdate, '%m') asc
),

cte5 as(
select 
	date_format(orderdate, '%m') as Month, sum(revenue) as 2023_Product_Pro
from 
	subscriptions
where
	productid = 2 and year(orderdate) = 2023
group by
	date_format(orderdate, '%m')
order by
	date_format(orderdate, '%m') asc
),

cte6 as (
select 
	date_format(orderdate, '%m') as Month, sum(revenue) as 2023_Product_Premium
from 
	subscriptions
where
	productid = 3 and year(orderdate) = 2023
group by
	date_format(orderdate, '%m')
order by
	date_format(orderdate, '%m') asc
)

select 
	case cte1.Month
		when 1 then 'Jan'
        when 2 then 'Feb'
        when 3 then 'Mar'
        when 4 then 'Apr'
        when 5 then 'May'
        when 6 then 'Jun'
        when 7 then 'Jul'
        when 8 then 'Aug'
        when 9 then 'Sept'
        when 10 then 'Oct'
        when 11 then 'Nov'
        when 12 then 'Dec'
        else 'Unknown'
	end as Month,
    2022_Product_Basic, 2023_Product_Basic, 2022_Product_Pro, 2023_Product_Pro, 2022_Product_Premium, 2023_Product_Premium
from 
	cte1
    join cte2 on cte1.Month = cte2.Month
    join cte3 on cte1.Month = cte3.Month
    join cte4 on cte1.Month = cte4.Month
    join cte5 on cte1.Month = cte5.Month
    join cte6 on cte1.Month = cte6.Month;

-- Business Problem 2
with cte as (
select 
	userid, count(userid) as num_link_clicks 
from 
	frontendeventlog
where 
	eventid = 5
group by 
	userid
),

total as(
select 
	count(distinct userid) as total_users
from
	frontendeventlog
)

select 
	num_link_clicks, count(userid) as num_users, total.total_users, 
    round(count(userid) / total.total_users * 100, 2) as percent_users
from 
	cte cross join total
group by 
	num_link_clicks, total.total_users
order by 
	num_link_clicks;


-- Business Problem 3
with max_status as (
	select SUBSCRIPTIONID, max(STATUSID) as maxstatus from paymentstatuslog
	group by SUBSCRIPTIONID
)

,
paymentfunnelstage as (
select s.SUBSCRIPTIONID, 
case 
		when maxstatus = 1 then 'PaymentWidgetOpened'
		when maxstatus = 2 then 'PaymentEntered'
		when maxstatus = 3 and currentstatus = 0 then 'User Error with Payment Submission'
		when maxstatus = 3 and currentstatus != 0 then 'Payment Submitted'
		when maxstatus = 4 and currentstatus = 0 then 'Payment Processing Error with Vendor'
		when maxstatus = 4 and currentstatus != 0 then 'Payment Success'
		when maxstatus = 5 then 'Complete'
		else 'User did not start payment process'
		end as paymentfunnelstage
from max_status as ms right join subscriptions as s
on s.SUBSCRIPTIONID = ms.SUBSCRIPTIONID
)

select paymentfunnelstage, count(paymentfunnelstage) as payment_funnel_status from paymentfunnelstage
group by paymentfunnelstage
order by field(paymentfunnelstage, 'PaymentWidgetOpened', 'PaymentEntered', 'User Error with Payment Submission',
'Payment Submitted', 'Payment Processing Error with Vendor', 'Payment Success', 'Complete', 'User did not start payment process');

-- Business Problem 4
with cte as (select customerid,
       count(active) as num_products, 
       sum(NumberofUsers) as Total_Users,
       case
            when count(active) = 1 and sum(NumberofUsers) >= 5000 then 1
            else 0
        end as Upsell_Opportunity
from subscriptions
group by customerid)

select count(upsell_opportunity) as num_Upsell_Opportunity from cte
where upsell_opportunity = 1;

select * from cte;

-- Business Problem 5
select userid, 
    sum(case when a.eventid = 1 then 1 else 0 end) as viewedhelpcenterpage,
    sum(case when a.eventid = 2 then 1 else 0 end) as clickedfaqs,
    sum(case when a.eventid = 3 then 1 else 0 end) as clickedcontactsupport,
    sum(case when a.eventid = 4 then 1 else 0 end) as submittedticket
from frontendeventlog as a join frontendeventdefinitions as b
on a.eventid = b.eventid
where trim(eventtype) = 'Customer Support'
group by userid;

-- Business Problem 6
with all_cancelation_reasons as(
select SUBSCRIPTIONID, CANCELATIONREASON1 as cancelationreason from cancelations
union all
select SUBSCRIPTIONID, CANCELATIONREASON2 as cancelationreason from cancelations
union all
select SUBSCRIPTIONID, CANCELATIONREASON3 as cancelationreason from cancelations
)

select 
    round(cast(count(case
        when cancelationreason regexp 'expensive' 
        then SUBSCRIPTIONID end) as float)
    / count(distinct SUBSCRIPTIONID), 2) AS percent_expensive,
    round(cast(count(case 
        when cancelationreason regexp 'needed' 
        then SUBSCRIPTIONID end) as float)
    / count(distinct SUBSCRIPTIONID),2) AS percent_no_longer_needed,
    round(cast(count(case 
        when cancelationreason regexp 'features' 
        then SUBSCRIPTIONID end) as float)
    / count(distinct SUBSCRIPTIONID),2) AS percent_features,
    round(cast(count(case 
        when cancelationreason regexp 'alternative' 
        then SUBSCRIPTIONID end) as float)
    / count(distinct SUBSCRIPTIONID),2) AS percent_alternative
from all_cancelation_reasons;

-- Business Problem 7
with monthly_revenue as (
	select date_format(orderdate, '%Y-%m') as order_month,
        SUM(revenue) as monthly_revenue
    from subscriptions
    group by DATE_FORMAT(orderdate, '%Y-%m')
)

select 
    order_month,
    monthly_revenue,
    lag(monthly_revenue) over (order by order_month) as previous_month_revenue,
    monthly_revenue - LAG(monthly_revenue) over (order by order_month) as revenue_diff
from monthly_revenue;

-- Business Problem 8
with time_in_status as (
select 
    statusmovementid,
    subscriptionid,
    p.statusid, s.description as Status_Description,
    movementdate,
    lead(movementdate, 1) over(partition by subscriptionid order by movementdate) as nextstatusmovementdate,
    timestampdiff(minute, movementdate, 
        lead(movementdate, 1) over(partition by subscriptionid order by movementdate)
    ) as timeinstatus_minutes
from
    paymentstatuslog as p join statusdefinition as s
    on p.statusid = s.statusid
order by
    timestampdiff(minute, movementdate, 
        lead(movementdate, 1) over(partition by subscriptionid order by movementdate)) desc
), 
status_summary as(
select 
	subscriptionid, round(avg(timeinstatus_minutes), 2) as avg_time_spt, 
    min(timeinstatus_minutes) as min_time_spt, max(timeinstatus_minutes) as max_time_spt, max(statusid) as max_statusid
from 
	time_in_status
group by
	subscriptionid
order by
	avg(timeinstatus_minutes) desc)

select 
	subscriptionid, avg_time_spt, min_time_spt, max_time_spt, max_statusid, sd.description as Last_payment_stage
from
	status_summary as ss join statusdefinition as sd
    on ss.max_statusid = sd.statusid
order by
	avg_time_spt desc;
    
select 
	sd.description, count(ss.max_statusid) as Stage_reach_count
from 
	status_summary as ss left join statusdefinition as sd
    on ss.max_statusid = sd.statusid
group by
	sd.description
order by
	count(ss.max_statusid) desc;


    





