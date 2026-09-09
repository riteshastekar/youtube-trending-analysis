CREATE TABLE CAvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),  
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),   
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE DEvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE FRvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE GBvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE INvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE JPvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE KRvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE MXvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE RUvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
CREATE TABLE USvideos (
    video_id                NVARCHAR(20),
    trending_date            NVARCHAR(20),
    title                    NVARCHAR(MAX),
    channel_title            NVARCHAR(MAX),
    category_id              INT,
    publish_time              NVARCHAR(50),
    tags                      NVARCHAR(MAX),
    views                     BIGINT,
    likes                     BIGINT,
    dislikes                  BIGINT,
    comment_count             BIGINT,
    thumbnail_link            NVARCHAR(MAX),
    comments_disabled         BIT,
    ratings_disabled          BIT,
    video_error_or_removed    BIT,
    description               NVARCHAR(MAX)
);
GO
 
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
