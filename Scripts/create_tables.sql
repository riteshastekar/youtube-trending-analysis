CREATE TABLE CAvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE DEvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE FRvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE GBvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE INvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE JPvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE KRvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE MXvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE RUvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
CREATE TABLE USvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(500),
    channel_title            NVARCHAR(200),
    category_id                INT,
    publish_time            NVARCHAR(50),
    tags                    NVARCHAR(MAX),
    views                    BIGINT,
    likes                    BIGINT,
    dislikes                BIGINT,
    comment_count            BIGINT,
    thumbnail_link            NVARCHAR(300),
    comments_disabled        BIT,
    ratings_disabled        BIT,
    video_error_or_removed    BIT,
    description                NVARCHAR(MAX)
);
 
 
-- ------------------------------------------------------------
--2. Category tables (one per country)
--Match the DataFrames built from the JSON files:
-- ------------------------------------------------------------
 
CREATE TABLE CA_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE DE_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE FR_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE GB_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE IN_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE JP_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE KR_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE MX_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE RU_category (
    id      INT,
    title   NVARCHAR(255)
);
GO
 
CREATE TABLE US_category (
    id      INT,
    title   NVARCHAR(255)
);
