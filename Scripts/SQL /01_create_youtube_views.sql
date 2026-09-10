CREATE VIEW country_data AS
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)   -- year
        + '-' + SUBSTRING(trending_date, 7, 2)   -- month
        + '-' + SUBSTRING(trending_date, 4, 2)   -- day
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'Canada'
FROM CAvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'Germany'
FROM DEvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'France'
FROM FRvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'Great Britain'
FROM GBvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'India'
FROM INvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'Japan'
FROM JPvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'South Korea'
FROM KRvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'Mexico'
FROM MXvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'Russia'
FROM RUvideos
UNION ALL
SELECT video_id,
    CAST(
        '20' + SUBSTRING(trending_date, 1, 2)
        + '-' + SUBSTRING(trending_date, 7, 2)
        + '-' + SUBSTRING(trending_date, 4, 2)
        AS DATE
    ) AS trending_date,
    TRY_CONVERT(DATETIME2, publish_time) AS publish_time,
    title,
    channel_title,
    category_id,
    views,
    likes,
    dislikes,
    comment_count,
    country = 'Usa'
FROM USvideos;





CREATE VIEW categorys as
SELECT id,title FROM CA_category
UNION 
SELECT id,title FROM DE_category
UNION 
SELECT id,title FROM FR_category
UNION 
SELECT id,title FROM GB_category
UNION 
SELECT id,title FROM IN_category
UNION 
SELECT id,title FROM JP_category
UNION 
SELECT id,title FROM KR_category
UNION 
SELECT id,title FROM MX_category
UNION 
SELECT id,title FROM RU_category
UNION 
SELECT id,title FROM US_category;


CREATE OR ALTER VIEW vw_country_handlingnulls AS
SELECT
    *,

    CASE
        WHEN video_id IS NULL
          OR LTRIM(RTRIM(video_id)) = ''
          OR video_id = '#NAME?'
        THEN CONCAT(
            country, '|INVALID_ID|',
            title, '|',
            channel_title, '|',
            CONVERT(varchar(30), publish_time, 126)
        )
        ELSE CONCAT(country, '|', video_id)
    END AS content_key,

    CASE
        WHEN video_id IS NULL
          OR LTRIM(RTRIM(video_id)) = ''
          OR video_id = '#NAME?'
        THEN 'Invalid ID'
        ELSE 'Valid ID'
    END AS video_id_status
FROM country_data;

