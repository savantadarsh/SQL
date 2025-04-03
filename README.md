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

## Core Analysis and Scope
The analysis is organized into four thematic areas, each corresponding to a set of insights drawn from the data. For each theme, we outline the focus, key questions addressed, and relevant metrics (with findings) from the data.

## Revenue Trends and Product Performance
**Focus:** Evaluate how different products (subscription tiers) contribute to revenue and assess revenue trends over time.

**Key Questions:**

- How does revenue break down by subscription tier (Basic, Pro, Premium), and which tier drives the most revenue?

- What are the trends in monthly revenue over 2022–2023? (Are there seasonal spikes or declines, and how does year-over-year growth look?)

**Metrics & Findings:**

- **Revenue by Product Tier:** CloudFlow’s Premium plan generates the highest average monthly revenue per period ($275.15k), followed by the Basic plan ($246.94k) and Pro (~$207.10k). Notably, the Basic tier, despite a lower price point, contributes significantly – indicating a large volume of Basic subscribers. The Basic plan also showed the highest revenue variability (std. dev. ≈ $74.5k) compared to Pro and Premium, suggesting Basic-tier revenue fluctuates more (possibly due to upgrades or churn in a big user base).

- **Year-over-Year Growth:** Overall subscription revenues have grown year-over-year. For example, Basic plan revenue in January increased from $111,900 in 2022 to $132,300 in 2023 (18% growth), and Pro plan grew from $112,900 to $157,500 in the same period【10†】. However, there were exceptions: in February, Premium plan revenue dropped from $165,000 (2022) to $118,300 (2023)【10†】, indicating some churn or downgrade in that segment. Such month-by-month comparison helps pinpoint when certain tiers underperformed.

- **Monthly Revenue Trend:** The monthly total revenue trend (all products combined) showed **significant fluctuations** over the two-year period. For instance, after peaking at $502,800 in Oct 2022, revenue fell sharply by -$172,300 in Nov 2022. 2023 saw a substantial slump in May 2023 (-$204,600 from April), followed by a strong recovery and a **record high** in Dec 2023 (approx. $534,300, a $254.5k increase from Nov). These swings suggest seasonal factors or campaign impacts (e.g., possibly a mid-year drop and a year-end push). Identifying the causes behind the **largest dip (May 2023)** and the **big surge (Dec 2023)** will be important for planning (e.g., smoothing out mid-year churn, replicating successful strategies from year-end).

## Customer Engagement and Support
**Focus:** Understand user engagement with CloudFlow’s features and their usage of support resources, to gauge overall activity levels and potential friction points requiring support.

**Key Questions:**

- How actively are users engaging with CloudFlow (e.g. clicking links or using features)? Is the engagement distributed evenly or are there many low-activity users?

- To what extent do users rely on self-service support (help center, FAQs) versus contacting support or filing tickets? Are support resources effectively helping users, or do many issues escalate to support tickets?

**Metrics & Findings:**

- **User Engagement Distribution:** Engagement analysis (measured here by number of link clicks per user) shows a skewed distribution. A majority of users perform a **moderate number of clicks** in the application, while a smaller group are highly active. For example, about 18.6% of users clicked 4 links in the period analyzed, the largest single group. Around one-third of users (33.9%) clicked 2–3 links, whereas very few users (≈3.4%) clicked 9 or 10 links. This indicates a **drop-off in ultra-engaged users**, suggesting that while typical users do interact with the product, relatively few are power-users. There may be an opportunity to increase engagement (moving users from 1–2 clicks to higher interaction levels) through in-app guides or marketing, as higher engagement often correlates with retention.

- **Support Self-Service vs Tickets:** There is evidence that many users do **not fully utilize self-help resources** before reaching out to support. For instance, one user (ID U381) had **0** help center views or FAQ clicks but submitted **2 support tickets.** This pattern of immediate escalation to support suggests that some customers either can’t find answers in self-service or prefer direct support. On the other hand, some users successfully self-serve – e.g., user U827 viewed FAQs (recorded 1 FAQ click) and submitted **no tickets**, implying their issue was resolved via the knowledge base. Overall, the data shows a mix: a portion of the user base leverages documentation/FAQ (about 25% of the listed sample clicked at least one help article or FAQ) while a significant number proceed straight to support requests. This insight highlights the need to improve **documentation accessibility and effectiveness** to deflect avoidable support tickets (which can improve user satisfaction and reduce support costs).






![Descriptive Statistics](assets/BP1/BP1.png)
![Output](assets/BP2/BP2.png)


