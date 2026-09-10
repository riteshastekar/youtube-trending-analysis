CREATE VIEW vw_latest_trending AS
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY country,title,channel_title, country
        ORDER BY trending_date DESC
    ) AS latest_record
    FROM country_data
) o
WHERE latest_record = 1;


 