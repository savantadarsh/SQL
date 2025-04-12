# CloudFlow Revenue and Retention Optimization Project 
## 📆Business Objective
CloudFlow aims to **maximize recurring revenue and customer retention** by identifying key factors influencing subscription growth and churn. This project leverages data-driven insights to **optimize revenue streams** (via better product uptake and upsells) and **improve retention** (by addressing churn causes and engagement gaps). These findings will inform strategic initiatives that boost customer lifetime value and reduce churn rate.

## 🏢Company Background
CloudFlow is a **subscription-based B2B SaaS company** offering cloud solutions through a tiered plan model (Basic, Pro, Premium). Its clients range from small teams to large enterprises, paying monthly or annually. Revenue primarily comes from recurring subscriptions and expansion within existing accounts. Success in this model hinges on high customer satisfaction and perceived product value.

## 🔍Project Purpose
This analysis focuses on answering three core business questions:

*Where are we gaining or losing revenue?*

*Why do customers churn, and how can we prevent it?*

*Where do users encounter friction in the product or sales funnel?*

To address these, we examined product usage, revenue data, engagement patterns, support interactions, and conversion funnel behaviour.

The dataset can be found [here](assets/dataset) and the analysis is carried out using mySQL Workbench 8.0. The SQL script can be found [here](assets/Cloudflow_Script.sql)

## Dataset Structure
The dataset consists of nine tables, covering information about users, customers, subscriptions, products, and frontend activity, as well as payment status changes and cancellations.

![Star Schema](assets/Data_Structure/Star_Schema.png)

## 📊Core Analysis Themes & Insights

# Revenue Trends and Product Performance
**Focus:** Evaluate revenue by subscription tier and identify growth/volatility trends

**Guiding Questions**

- *How does revenue break down by subscription tier (Basic, Pro, Premium), and which tier drives the most revenue?*

- *What are the trends in monthly revenue over 2022–2023?*

**Key Insights**

- **Premium** plan has the highest average revenue per month (£275.15k), followed by **Basic** (£246.94k) and **Pro** (£207.10k). The SQL output can be found [here](assets/Output/1a.pdf).

- **Basic** has the highest revenue fluctuation (£74.5k std. dev), suggesting sensitivity to churn or seasonal campaigns. The SQL output can be found [here](assets/Output/1b.pdf).

**Revenue Change Summary (Y-o-Y):**
1. Highly Volatile Mid-Year:
   - Revenue trends experienced substantial swings between June and August
   - Basic product saw sharp declines in July and August (-70.4% and -55.5%)
   - Pro and Premium products spiked dramatically during the same period
2. Strong Finish to the Year:
   - Basic rebounded in November (+77.3%) and December (+146.2%)
   - Premium regained momentum with +72.6% in December
3. Surging Peaks in Late Q3:
   - Pro revenue surged in July (+183.3%) and September (+205.2%)
4. Extreme Fluctuations in Premium Product:
   Premium spiked in April (+187.0%) then dropped steeply in October (-91.1%)


The SQL output can be found [here](assets/Output/7.pdf).

**Quarterly Revenue Trend**

| Quarter  | Key Highlights: 2022 | Key Highlights: 2022 |
| ------------- | ------------- | ----------------------- |
| Q1 | Moderate gains after initial growth  | Strong start, then slight declines  |
| Q2  | Large dip followed by a strong rebound  | Heavy loss in May, major rebound in June  |
| Q3  | Inconsistent with declining trend  | Mixed results., stronger August  |
| Q4  | Huge spike in October, major dip in November  | Gradual rise toward a record December  |

**Summary:** 2022 was a rollercoaster year with extreme highs/lows, while 2023 showed more resilience—especially in Q1 and Q4. Q4 is strategically important in both years.

## Customer Engagement and Support
**Focus:** Measure user activity and support reliance to identify engagement gaps

**Guiding Questions**

- *How actively are users engaging with CloudFlow (e.g. clicking links or using features)? Is the engagement distributed evenly or are there many low-activity users?*

- *To what extent do users rely on self-service support (help center, FAQs) versus contacting support or filing tickets? Are support resources effectively helping users, or do many issues escalate to support tickets?*

**Key Insights:**

- **Majority of users** are moderately active: 33.9% clicked 2–3 links; 18.6% clicked 4 links. The SQL output can be found [here](assets/Output/2.pdf). 


- Only 3.4% of users are high-frequency clickers (9–10 links), signalling a drop-off in "power users." The SQL output can be found [here](assets/Output/5.pdf).

- Support behaviour:
   - Some users escalate directly to tickets without viewing help content
   - Only ~25% interact with help/FAQ content before filing tickets

## Funnel Conversion Analysis
**Focus:** Identify drop-off points and friction in the upgrade/payment process

**Guiding Questions**

- *At which stage of the payment or onboarding funnel do we lose the most prospects?*

- How efficient is the funnel in terms of time – are users spending too long at certain steps or abandoning quickly?

**Key Insights:**

- Of those who open the payment widget, only ~39% complete the transaction The SQL output can be found [here](assets/Output/3.pdf).

- Errors (form inputs or vendor processing) outnumber successful completions (180 errors vs. 72 successes). The SQL output can be found [here](assets/Output/8a.pdf).

- Time Spent in Payment Funnel (The SQL output can be found [here](assets/Output/8b.pdf)
  - Early stages (0–1): avg. 8+ minutes, suggesting high abandonment rates
  - Cumulative time for completion: avg. 25–29 mins with 12 min minimum, suggesting lengthy checkout process


## Retention and Expansion Opportunities
**Focus:** Investigate why customers churn (non-renew or downgrade) and identify opportunities to increase revenue from existing customers via upsells or cross-sells.

**Key Questions:**

- What are the primary reasons customers are canceling or not renewing? Is pricing a major concern?

- How many customers have potential for upselling (e.g., have only one product or a lower tier plan) and thus represent low-hanging fruit for revenue expansion?

- Which segments of the customer base should account management prioritize for retention and expansion efforts?

**Metrics & Findings:**

- **Churn Drivers-Price Sensitivity:** Customer feedback and cancellation reasons point to **pricing (“product is too expensive”) as a significant factor in churn.** In a recent period, roughly **34–37% of churned customers cited cost** as a reason for leaving. This proportion, while gradually declining (from 37% to 34% over the observed timeframe), remains the single largest cited reason. It indicates that over one-third of departing customers feel they are not receiving enough value for the price. Other reasons (not detailed in the snippet) make up the remaining ~63–66%, likely including product fit, missing features, support issues, etc. The high rate of price-related churn suggests CloudFlow may need to **re-evaluate its pricing strategy or better communicate value** – especially to cost-sensitive clients or those on the fence about renewal. The SQL output can be found [here](assets/Output/6.pdf).

- **Upsell Potential:** There is a clear opportunity to **increase revenue from the existing customer base via upselling** additional products/modules. Analysis shows **122 customer accounts have upsell opportunities** identified – these are clients who have only a subset of CloudFlow’s product offerings. Many of these are sizable accounts. For example, one enterprise customer (ID anonymized) with over 6,700 users in their organization is subscribed to only one CloudFlow product【28†】, flagging a strong upsell case to add more modules or upgrade their plan. By targeting such single-product customers (especially those on the Basic tier or using only one module), CloudFlow can not only boost revenue per account but also deepen the customer’s reliance on the platform (which in turn improves retention). The data suggests a number of large clients fall in this category, making it a high-impact focus area for the sales and customer success teams. The SQL output can be found [here](assets/Output/4a.pdf).

- **Retention Segmentation:** Combining the insights above, we can segment the customer base to prioritize retention efforts. For instance, clients who indicate price concerns and have low product adoption (e.g., only one module, or low engagement as seen in support/engagement metrics) are at higher risk of churn and prime candidates for outreach. Meanwhile, satisfied single-product customers represent expansion opportunities. This analysis helps **inform cross-functional teams on where to focus – e.g., Customer Success can focus on value realization for price-sensitive accounts, and Sales can focus on upsell pitches to single-product accounts.** The SQL output can be found [here](assets/Output/4b.pdf).


