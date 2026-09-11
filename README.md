# YouTube Trending Analysis

An end-to-end data analytics project that analyses YouTube Trending content across 10 countries using Python, SQL Server, and Power BI.

## Project Overview

This project extracts the YouTube Trending Videos dataset from Kaggle, loads it into SQL Server, transforms the data using SQL views, and presents insights through an interactive Power BI dashboard.

The analysis focuses on:

- Trending content by country and date
- Trending duration
- Latest recorded views, likes, comments, and engagement
- Category performance
- Top-performing channels
- Viral-content performance: views versus engagement

## Project Workflow

```
Kaggle YouTube Trending Dataset
        ↓
Python: download, clean, and load data into SQL Server
        ↓
SQL Server: create tables and transformation views
        ↓
Power BI: data model, DAX measures, KPIs, and dashboards
```

## Tools Used

- Python
    - Pandas
    - KaggleHub
    - PyODBC
- SQL Server
    - Views
    - `UNION ALL`
    - `ROW_NUMBER()`
    - `CASE`
    - `TRY_CONVERT()`
- Power BI
    - DAX measures
    - KPI cards
    - Data modeling
    - Interactive visualizations

## Dataset

Source: YouTube Trending Videos Dataset on Kaggle

Countries included:

```
Canada
Germany
France
Great Britain
India
Japan
South Korea
Mexico
Russia
United States
```

## Repository Structure

```
youtube-trending-analysis/
│
├── Scripts/
│   ├── Python/
│   │   └── insert_to_sqlserver.py
│   │
│   └── SQL/
│   │   ├── 01_init_database.sql
│   │   ├── 02_create_tables.sql
│   │   ├── 03_create_youtube_views.sql
│   │   └── 04_latest_records.sql
│   │
│   └── Power BI/Images
│       ├── daily_trending_dashboard.PNG
│       └── latest_trending_dashboard.PNG
└── README.md
```

## SQL Process

### 1. `01_init_database.sql`

Creates the SQL Server database used for the project.

### 2. `02_create_tables.sql`

Creates tables for each country’s YouTube Trending dataset and category data.

### 3. `03_create_youtube_views.sql`

Creates views that combine country-level data and standardize the fields used for analysis.

The combined view includes:

```
video_id
trending_date
publish_time
title
channel_title
category_id
views
likes
dislikes
comment_count
country
```

### 4. `04_latest_records.sql`

Creates the latest Trending snapshot for each content item.

The view uses `ROW_NUMBER()` to retain the record with the latest `trending_date` for every content item.

## Data Quality Handling

The India dataset includes records where the `video_id` is recorded as:

```
#NAME?
```

To prevent unrelated records from being grouped as one video, a `content_key` was used:

```
Valid video ID:
country + video_id

Invalid video ID:
country + title + channel_title + publish_time
```

This allows invalid IDs to be handled without losing valid content-level analysis.

## Power BI Dashboard

### Daily Trending Analysis

This dashboard analyses how content appears and remains on the YouTube Trending list.

Key visuals:

- Daily Trending content by country
- Average Trending duration by country
- Top channels by Trending duration
- New videos entering Trending each Month
- Trending content over time

Main KPI:

```
Average Trending Days
```

### Latest Trending Performance Analysis

This dashboard analyses the final available Trending snapshot for each content item.

Key visuals:

- Category engagement
- Category performance
- Latest Trending views versus engagement rate
- Trending content by country
- Top channels by latest Trending views

KPIs:

```
Latest Trending Content
Latest Trending Views
Average Views per Content
Engagement Rate
Latest Trending Likes
Latest Trending Comments
```

## Key DAX Measures

```
Latest Trending Views =
SUM('vw_latest_trending'[views])
```

```
Latest Trending Likes =
SUM('vw_latest_trending'[likes])
```

```
Latest Trending Comments =
SUM('vw_latest_trending'[comment_count])
```

```
Average View Per Content =
DIVIDE(
    [Latest Trending Views],
    [L Trending Content],
    0
)
```

```
Engagement Rate =
DIVIDE(
    [Latest Trending Likes] + [Latest Trending Comments],
    [Latest Trending Views],
    0
)
```

```
Average Trending Days =
AVERAGEX(
    VALUES(vw_country_handlingnulls[content_key]),
    CALCULATE(
        DISTINCTCOUNT(vw_country_handlingnulls[trending_date])
    )
)
```

## How to Run

1. Download the dataset from Kaggle.
2. Update the SQL Server connection details in `Scripts/Python/insert_to_sqlserver.py`.
3. Run the Python script to load the data into SQL Server.
4. Run SQL files in this order:

```
01_init_database.sql
02_create_tables.sql
03_create_youtube_views.sql
04_latest_records.sql
```

1. Open the Power BI dashboard file.
2. Refresh the data model.

## Note

The original Kaggle CSV files are not included in this repository. Download them directly from Kaggle before running the project.

## Author

Ritesh Astekar
