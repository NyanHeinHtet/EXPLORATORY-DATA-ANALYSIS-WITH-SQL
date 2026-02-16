--Key Matrics of the Dataset
--Average Price
SELECT avg(CAST (price as float)) as AVG_price FROM vw_Bayut_Properties_Cleaned

--Total Building
SELECT COUNT (building_name) as Total_building FROM vw_Bayut_Properties_Cleaned

--Total Area
SELECT COUNT (Area) as Total_area FROM vw_Bayut_Properties_Cleaned

--Avergae Square feet
SELECT avg(total_building_area_sqft) as AVG_sqft FROM vw_Bayut_Properties_Cleaned

--Total House Type
SELECT COUNT (type) as Total_Housetype FROM vw_Bayut_Properties_Cleaned

--Report for Key Matrics of the Dataset
SELECT 'AVG_price' as Measure_Name, avg(CAST (price as float)) as Measure_Value FROM vw_Bayut_Properties_Cleaned
UNION ALL
SELECT 'Total_building' as Measure_Name, COUNT (building_name) as Measure_Value FROM vw_Bayut_Properties_Cleaned
UNION ALL
SELECT 'Total_area' as Measure_Name, COUNT (Area) as Measure_Value FROM vw_Bayut_Properties_Cleaned
UNION ALL
SELECT 'AVG_sqft' as Measure_Name, avg(total_building_area_sqft) as Measure_Value FROM vw_Bayut_Properties_Cleaned
UNION ALL
SELECT 'Total_Housetype' as Measure_Name, COUNT (type) as Measure_Value FROM vw_Bayut_Properties_Cleaned


--Which Areas offer the best "Value for Money" (Price per Sqft)

SELECT 
    City, 
    Area, 
    AVG(price / NULLIF(total_building_area_sqft, 0)) AS Avg_Price_Per_Sqft,
    COUNT(*) AS Total_Listings
FROM vw_Bayut_Properties_Cleaned
GROUP BY City, Area
HAVING COUNT(*) > 10 
ORDER BY Avg_Price_Per_Sqft DESC;


--Where are the highest Rental Yields (ROI)

SELECT City, Area, AVG (CAST (CleanRent as float)/price)*100 as ROI
FROM vw_Bayut_Properties_Cleaned
WHERE CleanRent > 0
GROUP BY City, Area
ORDER BY ROI DESC;

--How does "Ready" vs. "Off-Plan" pricing compare?

SELECT beds, completion_status, AVG (CAST (price as float)) as AVG_Price
FROM vw_Bayut_Properties_Cleaned
GROUP BY beds, completion_status 
ORDER BY beds, completion_status desc

--What is price Category by Area?

SELECT 
CASE 
    WHEN price < 1000000 then 'Affordable (<1M)'
    WHEN price between 1000000 and 3000000 then 'Medium (1M-3M)'
    WHEN price > 3000000 then 'Luxury (>3M)'
    END as Price_Category,
    price, Area
FROM vw_Bayut_Properties_Cleaned


