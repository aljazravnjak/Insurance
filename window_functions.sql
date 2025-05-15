-- D. Charges compared to regional average
SELECT
    region,
    age,
    sex,
    smoker,
    charges,
    ROUND(AVG(charges) OVER (PARTITION BY region), 2) AS regional_avg,
    ROUND(charges - AVG(charges) OVER (PARTITION BY region), 2) AS difference_from_avg
FROM insurance
ORDER BY region, difference_from_avg DESC;

-- E. Ranking smokers within each region
SELECT
    region,
    age,
    sex,
    charges,
    RANK() OVER (PARTITION BY region ORDER BY charges DESC) AS smoker_region_rank
FROM insurance
WHERE smoker = 'yes'
ORDER BY region, smoker_region_rank;
