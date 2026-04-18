# SEO Traffic & CTR Analysis using SQL

## Overview
This project analyzes Google Search Console data using SQL to identify high-impression queries with low CTR and recommends optimization strategies to improve organic traffic.

## 1. Problem Statement

Despite receiving high impressions from organic search, several queries were generating very low clicks. This indicates a gap between search visibility and user engagement.

---

## 2. Objective

* Identify underperforming queries with high impressions but low CTR
* Analyze the relationship between ranking position and CTR
* Diagnose potential causes of low CTR
* Recommend actionable improvements to increase traffic

---

## 3. Dataset Description

The dataset was sourced from Google Search Console and includes:

* Query (search keyword)
* Clicks
* Impressions
* CTR (Click-Through Rate)
* Average Position

---

## 4. Approach & SQL Analysis

### Step 1: Identify High-Opportunity Queries

```sql
SELECT query, impressions, clicks, ctr, position
FROM queries_data
WHERE impressions > 3000
ORDER BY ctr ASC;
```

---

### Step 2: Analyze CTR vs Position

```sql
SELECT 
    ROUND(position) AS position_group,
    AVG(ctr) AS avg_ctr,
    COUNT(*) AS query_count
FROM queries_data
WHERE impressions > 3000
GROUP BY position_group
ORDER BY position_group;
```

---

## 5. Key Insights

* Queries such as **“temu discount saudi arabia”** (~17,000 impressions, ~0% CTR, position ~5.8) show extremely low engagement despite strong visibility
* Queries like **“temu coupon code”** (~11,000 impressions, 1.42% CTR, position ~3.9) indicate underperformance even at higher rankings
* Several queries ranking in **positions 4–6 (page 1)** fail to generate clicks
* This suggests that **ranking alone is not sufficient to drive traffic**

CTR underperformance is driven more by SERP presentation than ranking position.

---

## 6. Diagnosis

Low CTR is likely caused by:

* **Generic titles** lacking specificity
* **Weak intent match**, especially for location-based queries
* **Lack of freshness indicators** (e.g., year, “latest”, “today”)
* **High SERP competition** with more optimized titles

---

## 7. Recommendations (Before → After)

Improve SERP Titles (Simulation)

Query: temu coupon code

Before:
Temu Coupon Code

After:
Temu Coupon Code April 2026 – Get Up to 50% Off Today

Query: temu discounts Saudi Arabia

Before:
Temu Discounts Saudi Arabia

After:
Temu Discounts Saudi Arabia 2026 – Latest Deals & Offers

### Strategic Actions

- Optimize titles to better match search intent  
- Add freshness signals (year, latest updates) 
- Include value-driven hooks (discount %, offers, urgency)  
- Prioritize high-impression queries for maximum traffic gain

---

## 8. Impact Estimation

Example scenario:

* Impressions = 20,000
* Current CTR = 0.5% → 100 clicks
* Improved CTR = 2% → 400 clicks

Potential gain: **+300 clicks**

This demonstrates that **CTR optimization can significantly increase traffic without improving rankings**.

---

## 9. Conclusion

The analysis revealed that high search visibility does not always translate into clicks. Several high-impression queries underperform due to weak SERP presentation and intent mismatch.

Improving titles with clear value propositions, localization, and freshness indicators can significantly enhance CTR and overall organic performance.

---

## 10. Tools Used

* SQL (SQLite)
* Google Search Console

---

## 11. Future Scope

* Cohort analysis for user behavior insights
* Power BI dashboard for visualization
* A/B testing for title optimization
