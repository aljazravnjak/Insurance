-- A. Average insurance cost relative to smoking status
SELECT 
    smoker,
    (SELECT ROUND(AVG(charges), 2) 
     FROM insurance AS sub 
     WHERE sub.smoker = main.smoker) AS avg_charges
FROM insurance AS main
GROUP BY smoker;

-- B. Charges by region 
SELECT 
    region,
    COUNT(*) AS count,
    ROUND(SUM(charges)::NUMERIC, 2) AS total_charges,
    ROUND(AVG(charges)::NUMERIC, 2) AS avg_charges
FROM insurance
GROUP BY region;

-- C. Categorizing BMI
SELECT
    CASE 
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,
    ROUND(AVG(charges), 2) AS avg_charge
FROM insurance
GROUP BY 1
ORDER BY avg_charge DESC;
