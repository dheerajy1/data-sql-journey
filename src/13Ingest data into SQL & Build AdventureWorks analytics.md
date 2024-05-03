In this article, I am going to log my learnings about building an adventure works dashboard in Power BI desktop.

> Build a dashboard from scratch in Power BI using features like bookmarks, drill through filters, parameters, tooltips, and more.

# Power BI Desktop Benchmark Assessment

\[[Link](https://brillium-resources.s3.amazonaws.com/downloads/mavenanalytics.onlinetests.app/reports/20240430_TDWU27C7L10Q/POWERBI-439327-BENCHMARK_RespReviewResults_20240430_063158.pdf)\]

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714458708863/7472f49e-a05d-40ec-9526-33983ce9a138.png)

---

# 1\. Get Data into SQL Server

## i. AdventureWorks Sales Data 2020

table schema

```sql
CREATE TABLE [dbo].[AdventureWorks Sales Data 2020] (
[OrderDate] date,
[StockDate] date,
[OrderNumber] varchar(50),
[ProductKey] int,
[CustomerKey] int,
[TerritoryKey] int,
[OrderLineItem] int,
[OrderQuantity] int
)
```

Importing data from a CSV flat file into SQL Server using import wizard.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714498044612/422fe553-ff1f-42e0-98ef-91f229583f6b.png)

Data in SQL server:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714547590550/e31c1ae9-7972-4f2d-a895-7aa47ca454b6.png)

Now,

## ii. AdventureWorks Sales Data 2021:

Import using T-SQL Script

create a table

```sql
BEGIN TRY

    BEGIN TRANSACTION T3SDT2021; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021] EXISTS')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021] DOES NOT EXIST')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021] (
					[OrderDate] date,
					[StockDate] date,
					[OrderNumber] varchar(50) NOT NULL,
					[ProductKey] int NOT NULL,
					[CustomerKey] int NOT NULL,
					[TerritoryKey] int NOT NULL,
					[OrderLineItem] int NOT NULL,
					[OrderQuantity] int NOT NULL
					)
			END

	-- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T3SDT2021;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T3SDT2021;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

Bulk insert:

```sql
BEGIN TRY

    BEGIN TRANSACTION T4SDBI2021; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]
		FROM 'Path\AdventureWorks Sales Data 2021.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T4SDBI2021;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T4SDBI2021;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

---


# Conclusion

Learning Objectives,

1. Ingest data into SQL

    

# Source: \[[Link]()\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)