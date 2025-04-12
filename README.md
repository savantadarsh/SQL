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
**Focus:** Evaluate revenue by subscription tier and identify growth/volatility trends.

**Key Insights:**

- *How does revenue break down by subscription tier (Basic, Pro, Premium), and which tier drives the most revenue?*

- *What are the trends in monthly revenue over 2022–2023?*

**Metrics & Findings:**

- **Premium** plan has the highest average revenue per month (£275.15k), followed by **Basic** (£246.94k) and **Pro** (£207.10k). The SQL output can be found [here](assets/Output/1a.pdf).

- **Basic** has the highest revenue fluctuation (£74.5k std. dev), suggesting sensitivity to churn or seasonal campaigns. The SQL output can be found [here](assets/Output/1b.pdf).

**Revenue Change Summary (Y-o-Y):**
•	Highly Volatile Mid-Year:
o	Revenue trends experienced substantial swings between June and August.
o	Basic product saw sharp declines in July and August (-70.4% and -55.5%).
o	Pro and Premium products spiked dramatically during the same period.
•	Strong Finish to the Year:
o	Basic rebounded in November (+77.3%) and December (+146.2%).
o	Premium regained momentum with +72.6% in December.
•	Surging Peaks in Late Q3:
o	Pro revenue surged in July (+183.3%) and September (+205.2%).
•	Extreme Fluctuations in Premium Product:
o	Premium spiked in April (+187.0%) then dropped steeply in October (-91.1%).

• Highly Volatile Mid-Year:
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

- Quarterly Revenue Trend:

| Quarter  | Key Highlights: 2022 | Key Highlights: 2022 |
| ------------- | ------------- | ----------------------- |
| Q1 | Moderate gains after initial growth  | Strong start, then slight declines  |
| Q2  | Large dip followed by a strong rebound  | Heavy loss in May, major rebound in June  |
| Q3  | Inconsistent with declining trend  | Mixed results., stronger August  |
| Q4  | Huge spike in October, major dip in November  | Gradual rise toward a record December  |

**Summary:** 2022 was a rollercoaster year with extreme highs/lows, while 2023 showed more resilience—especially in Q1 and Q4. Q4 is strategically important in both years.

## Customer Engagement and Support
**Focus:** Understand user engagement with CloudFlow’s features and their usage of support resources, to gauge overall activity levels and potential friction points requiring support.

**Key Questions:**

- How actively are users engaging with CloudFlow (e.g. clicking links or using features)? Is the engagement distributed evenly or are there many low-activity users?

- To what extent do users rely on self-service support (help center, FAQs) versus contacting support or filing tickets? Are support resources effectively helping users, or do many issues escalate to support tickets?

**Metrics & Findings:**

- **User Engagement Distribution:** Engagement analysis (measured here by number of link clicks per user) shows a skewed distribution. A majority of users perform a **moderate number of clicks** in the application, while a smaller group are highly active. For example, about 18.6% of users clicked 4 links in the period analyzed, the largest single group. Around one-third of users (33.9%) clicked 2–3 links, whereas very few users (≈3.4%) clicked 9 or 10 links. This indicates a **drop-off in ultra-engaged users**, suggesting that while typical users do interact with the product, relatively few are power-users. There may be an opportunity to increase engagement (moving users from 1–2 clicks to higher interaction levels) through in-app guides or marketing, as higher engagement often correlates with retention. The SQL output can be found [here](assets/Output/2.pdf). 


- **Support Self-Service vs Tickets:** There is evidence that many users do **not fully utilize self-help resources** before reaching out to support. For instance, one user (ID U381) had **0** help center views or FAQ clicks but submitted **2 support tickets.** This pattern of immediate escalation to support suggests that some customers either can’t find answers in self-service or prefer direct support. On the other hand, some users successfully self-serve – e.g., user U827 viewed FAQs (recorded 1 FAQ click) and submitted **no tickets**, implying their issue was resolved via the knowledge base. Overall, the data shows a mix: a portion of the user base leverages documentation/FAQ (about 25% of the listed sample clicked at least one help article or FAQ) while a significant number proceed straight to support requests. This insight highlights the need to improve **documentation accessibility and effectiveness** to deflect avoidable support tickets (which can improve user satisfaction and reduce support costs). The SQL output can be found [here](assets/Output/5.pdf).

## Conversion Funnel Analysis
**Focus:** Analyze the subscription signup and payment funnel to find where potential customers drop off during the upgrade/purchase process, and identify technical or UX issues hindering conversions.

**Key Questions:**

- At which stage of the payment or onboarding funnel do we lose the most prospects?

- What errors or issues are occurring during the payment process that prevent completion?

- How efficient is the funnel in terms of time – are users spending too long at certain steps or abandoning quickly?

**Metrics & Findings:**

- **Funnel Drop-Off Points:** The funnel data reveals **substantial drop-off at the very start and final stages of the payment process.** Out of all users who showed intent to subscribe, a large number **never initiated the payment** at all (180 users did not start the payment process). Among those who did start (opened the payment widget), many failed to complete: 87 opened the payment page, but only 78 proceeded to enter payment details, and ultimately only 54 submitted their payment. The conversion from payment start to a successful transaction was only ~39% (34 successes out of 87 starts), indicating significant leakage. The biggest drop-offs occurred when users attempted to submit payment info – at least 34 instances of **user input errors** were recorded (e.g. validation errors) and 38 instances of **payment processing errors** from the payment vendor side disrupted transactions. These errors collectively outnumber successful payments (only 34 successes), which is alarming for revenue conversion. The SQL output can be found [here](assets/Output/3.pdf).

- **Error Impact:** An aggregated view of final outcomes shows **error states far exceed completions.** There were 180 total error events counted vs. 72 successful payment completions in the funnel analysis. This means users are more likely to encounter an error than a smooth checkout, which drastically hurts conversion rates. The errors include both user-side issues (possibly form errors or declines) and system issues (payment processing failures), underscoring a need for improvements on both fronts. The SQL output can be found [here](assets/Output/8a.pdf).

- **Time Spent in Funnel:** Timing data suggests that users who abandon at early stages do so quickly. Many users who quit at the **PaymentWidgetOpened** stage spent on average only ~14 seconds on the payment page before giving up【25†】. This short duration implies confusion or frustration – they might not have found what they expected or encountered a blocker almost immediately (e.g., an unintuitive form or a technical glitch). Conversely, if we examine those who ended in an “Error” state, some records show NULL times (likely indicating no meaningful progress before error)【25†】. Overall, the funnel analysis indicates **urgent opportunities to streamline the payment process** (simplify the checkout UI, guide users to avoid input errors, and fix backend issues to reduce processing failures). Even small improvements here could convert dozens of additional customers, given the high drop-off counts. The SQL output can be found [here](assets/Output/8b.pdf).

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


