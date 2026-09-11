CREATE VIEW vw_latest_trending AS
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY content_key
            ORDER BY trending_date DESC
        ) AS latest_record
    FROM vw_country_handlingnulls
) AS ranked
WHERE latest_record = 1;
