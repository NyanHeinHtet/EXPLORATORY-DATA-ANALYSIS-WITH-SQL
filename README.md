# EXPLORATORY-DATA-ANALYSIS-WITH-SQL

📊 UAE Real Estate Market: Exploratory Data Analysis (EDA)

📌 **Project Overview**

This project performs an in-depth Exploratory Data Analysis (EDA) on the UAE real estate market using a dataset of property listings from Bayut (via Kaggle). Using SQL (T-SQL), I extracted key market drivers, investment yields, and pricing tiers to understand the current landscape of the Dubai and UAE property markets.


🛠️ **Data Architecture**

The analysis is performed on a cleaned and structured SQL View (vw_Bayut_Properties_Cleaned), ensuring that all metrics are based on validated data (e.g., removing zero-price listings and properties with unrealistic square footage).

🔍 **Key Analysis & SQL Implementation**

1. **Market Health Indicators (KPIs)**
   
     To get a bird's-eye view of the market, I consolidated the primary metrics into a single summary report. This provides an immediate understanding of the average entry price and the scale of available inventory.

      - Metric Logic: Uses UNION ALL to stack different aggregations (Average Price, Total Buildings, Total Areas, and House Types).

2. **"Value for Money" (Price per Sqft)**
   
     I identified the most cost-effective and premium neighborhoods by calculating the Price per Square Foot.

    - Insight: This allows investors to see where they get the most physical space for their capital.
    - Statistical Threshold: Filtered for areas with >10 listings to avoid outliers.

3. **Investment Potential: Rental Yield (ROI)**

     The core of this analysis focuses on Rental Yields. By comparing the CleanRent against the price, I calculated the potential Return on Investment (ROI) for each area.

    - Formula: (Average Rent / Property Price) * 100.
    - Value: Essential for Buy-to-Let investors looking for high-income-generating areas.

4. **Property Segmentation: Ready vs. Off-Plan**

      I analyzed the price gap between Ready properties (immediate move-in) and Off-Plan projects (future delivery).

     - Observation: Grouped by bedroom count to see how the "Ready" premium fluctuates across different property sizes.

5. **Price Tier Categorization**

     To segment the market for different buyer personas, I categorized all listings into three distinct tiers:

      - Affordable: Under 1,000,000 AED
      - Medium: 1,000,000 - 3,000,000 AED
      - Luxury: Above 3,000,000 AED

📈 **Featured SQL Query: The "Key Metrics" Report**

🏁 **Conclusion**

The results of this EDA highlight the high-yield areas in the UAE market and provide a clear distinction between luxury and affordable segments. This structured data is now ready to be visualized in Power BI or Tableau for interactive stakeholder reporting.
