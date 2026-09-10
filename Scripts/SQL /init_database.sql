USE master;
GO

-- Drop and recreate the 'YoutubeDB' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'YoutubeDB')
BEGIN
    ALTER DATABASE YoutubeDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE YoutubeDB;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE YoutubeDB;
GO

USE YoutubeDB;
GO
