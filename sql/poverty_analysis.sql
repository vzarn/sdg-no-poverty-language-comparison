DROP TABLE IF EXISTS poverty_data;

CREATE TABLE poverty_data (
    country TEXT,
    region TEXT,
    year INTEGER,
    poverty_rate REAL,
    income_group TEXT
);

INSERT INTO poverty_data (country, region, year, poverty_rate, income_group) VALUES
('Philippines', 'East Asia and Pacific', 2018, 2.7, 'Lower middle income'),
('Philippines', 'East Asia and Pacific', 2021, 3.0, 'Lower middle income'),
('Indonesia', 'East Asia and Pacific', 2018, 2.2, 'Lower middle income'),
('Indonesia', 'East Asia and Pacific', 2021, 2.5, 'Lower middle income'),
('Vietnam', 'East Asia and Pacific', 2018, 1.7, 'Lower middle income'),
('Vietnam', 'East Asia and Pacific', 2021, 1.0, 'Lower middle income'),
('India', 'South Asia', 2018, 12.9, 'Lower middle income'),
('India', 'South Asia', 2021, 11.9, 'Lower middle income'),
('Bangladesh', 'South Asia', 2018, 9.2, 'Lower middle income'),
('Bangladesh', 'South Asia', 2021, 8.4, 'Lower middle income'),
('Kenya', 'Sub-Saharan Africa', 2018, 29.4, 'Lower middle income'),
('Kenya', 'Sub-Saharan Africa', 2021, 29.0, 'Lower middle income'),
('Nigeria', 'Sub-Saharan Africa', 2018, 38.9, 'Lower middle income'),
('Nigeria', 'Sub-Saharan Africa', 2021, 38.0, 'Lower middle income'),
('Brazil', 'Latin America and Caribbean', 2018, 4.4, 'Upper middle income'),
('Brazil', 'Latin America and Caribbean', 2021, 5.8, 'Upper middle income');

DROP VIEW IF EXISTS cleaned_poverty_data;

CREATE VIEW cleaned_poverty_data AS
SELECT *
FROM poverty_data
WHERE country IS NOT NULL
  AND region IS NOT NULL
  AND year IS NOT NULL
  AND poverty_rate IS NOT NULL
  AND income_group IS NOT NULL;

SELECT
    region,
    year,
    ROUND(AVG(poverty_rate), 2) AS mean_poverty_rate
FROM cleaned_poverty_data
GROUP BY region, year
ORDER BY region, year;
