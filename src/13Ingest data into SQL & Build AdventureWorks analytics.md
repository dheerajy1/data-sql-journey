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

## iii AdventureWorks Sales Data 2022

create table

```sql
BEGIN TRY

    BEGIN TRANSACTION T5SDT2022; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022] EXISTS')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022] DOES NOT EXIST')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022] (
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
    COMMIT TRANSACTION T5SDT2022;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T5SDT2022;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

bulk import

```sql
BEGIN TRY

    BEGIN TRANSACTION T6SDBI2022; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]
		FROM 'Path\AdventureWorks Sales Data 2022.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T6SDBI2022;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T6SDBI2022;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

## iv. Combining into sales data:

table:

```sql
BEGIN TRY
	BEGIN TRANSACTION T7SDDT;
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data]') IS NOT NULL
			BEGIN 
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data]
				PRINT('SUCCESSFULLY DROPPED')
			END
	COMMIT TRANSACTION T7SDDT;
END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T7SDDT;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

select \* into

```sql
BEGIN TRY
	BEGIN TRANSACTION T8SDCD;

		SELECT *
		INTO [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data]
		FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020]
		UNION ALL
		SELECT * FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]
		UNION ALL
		SELECT * FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]

	COMMIT TRANSACTION T8SDCD;
END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T8SDCD;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714547847430/cc181ca3-c50f-440b-a706-e2ad455b5359.png)

## v. AdventureWorks Product Lookup:

create table

bulk import

Faced Error:

(0 rows affected) Error occurred: Cannot fetch a row from OLE DB provider "BULK" for linked server "(null)".

data got pushed and hence data types failing

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714561671977/ffac5136-8587-4e48-a6ec-71241d19dd09.png)

Solution:

\[[Link](https://stackoverflow.com/questions/4123875/commas-within-csv-data)\]

Text qualifier (write only ")

now good:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714562211705/b5a21b12-273c-4014-9a43-0e51ff4e9ace.png)

In T-SQL query: not solved though used `FIELDQUOTE = '"',` as hint

Another Error:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714564702703/2cf711dc-72bb-4959-ac6e-f51935e523dd.png)

Solution:

using import flat file wizard

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714565803904/70c18dd6-2bec-4328-83ec-bfbcac04ac4a.png)

success using import flat file wizard:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714566190636/a78667ba-cdf2-4d65-b029-27fde1022c76.png)

Data:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714566331665/faf7a2f9-9af5-4848-8f0c-0ed06577dbd4.png)

## vi. AdventureWorks Product Categories Lookup

create table

```sql
BEGIN TRY

    BEGIN TRANSACTION T11PCT; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Categories Lookup]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Categories Lookup] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Categories Lookup] DOES NOT EXIST, Created')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Categories Lookup] (
					[ProductCategoryKey] varchar(50),
					[CategoryName] varchar(50)
					)
			END

	-- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T11PCT;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T11PCT;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

bulk import

```sql
BEGIN TRY

    BEGIN TRANSACTION T12PCBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Categories Lookup]
		FROM 'path\AdventureWorks Product Categories Lookup.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T12PCBI;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T12PCBI;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714567069671/c67303bb-de47-456a-b9f2-79fd764f05f0.png)

## vi. AdventureWorks Product Subcategories Lookup

create table

```sql
BEGIN TRY

    BEGIN TRANSACTION T13PSCT; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Subcategories Lookup]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Subcategories Lookup] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Subcategories Lookup]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Subcategories Lookup] DOES NOT EXIST, Created')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Subcategories Lookup] (
					[ProductSubcategoryKey] int,
					[SubcategoryName] varchar(50),
					[ProductCategoryKey] int
					)
			END

	-- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T13PSCT;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T13PSCT;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

bulk import

```sql
BEGIN TRY

    BEGIN TRANSACTION T14PSCBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Subcategories Lookup]
		FROM 'path\AdventureWorks Product Subcategories Lookup.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T14PSCBI;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T14PSCBI;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714567251819/a620cce4-07f3-4650-8268-4f88ed655ca2.png)

## vii. AdventureWorks Customer Lookup

create table

```sql
BEGIN TRY

    BEGIN TRANSACTION T15CULT; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup] DOES NOT EXIST, Created')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup] (
					[CustomerKey] int NOT NULL,
					[Prefix] varchar(50),
					[FirstName] varchar(50),
					[LastName] varchar(50),
					[BirthDate] date,
					[MaritalStatus] varchar(50),
					[Gender] varchar(50),
					[EmailAddress] varchar(50),
					[AnnualIncome] int,
					[TotalChildren] int,
					[EducationLevel] varchar(50),
					[Occupation] varchar(50),
					[HomeOwner] varchar(50)
					)
			END

	-- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T15CULT;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T15CULT;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

bulk import

```sql
BEGIN TRY

    BEGIN TRANSACTION T16CULBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup]
		FROM 'path\AdventureWorks Customer Lookup.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T16CLBI;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T16CULBI;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714567514889/51b38a42-1233-40fa-8bac-10f40a4a3e71.png)

---

## viii. AdventureWorks Calendar Lookup

create table

```sql
BEGIN TRY

    BEGIN TRANSACTION T17CALT; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Calendar Lookup]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Calendar Lookup] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Calendar Lookup]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Calendar Lookup] DOES NOT EXIST, Created')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Calendar Lookup] (
					[Date] date
					)
			END

	-- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T17CALT;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T17CALT;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

bulk import

```sql
BEGIN TRY

    BEGIN TRANSACTION T18CALBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Calendar Lookup]
		FROM 'path\AdventureWorks Calendar Lookup.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T18CALBI;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T18CALBI;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714568453650/35dbbb2e-b54d-4295-8869-52553d760e1a.png)

## ix. AdventureWorks Territory Lookup

create table

```sql
BEGIN TRY

    BEGIN TRANSACTION T19TLT; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Territory Lookup]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Territory Lookup] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Territory Lookup]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Territory Lookup] DOES NOT EXIST, Created')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Territory Lookup] (
					[SalesTerritoryKey] int NOT NULL,
					[Region] varchar(50),
					[Country] varchar(50),
					[Continent] varchar(50)
					)
			END

	-- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T19TLT;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T19TLT;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

bulk import

```sql
BEGIN TRY

    BEGIN TRANSACTION T20TLBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Territory Lookup]
		FROM 'path\AdventureWorks Territory Lookup.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T20TLBI;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T20TLBI;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714568555328/3707ca08-4167-4954-902e-12538970f6a4.png)

## x. AdventureWorks Returns Data

create table

```sql
BEGIN TRY

    BEGIN TRANSACTION T21RDT; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Returns Data]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Returns Data] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Returns Data]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Returns Data] DOES NOT EXIST, Created')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Returns Data] (
					[ReturnDate] date,
					[TerritoryKey] int NOT NULL,
					[ProductKey] int NOT NULL,
					[ReturnQuantity] int
					)
			END

	-- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T21RDT;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T21RDT;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

bulk import

```sql
BEGIN TRY

    BEGIN TRANSACTION T22RDBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Returns Data]
		FROM 'path\AdventureWorks Returns Data.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T22RDBI;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T22RDBI;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714580814479/c6f7d5b9-b365-4e78-b2d5-cfb848432782.png)

---

# 2\. Ingest Data into Power BI

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714569673534/320fe72f-a4ff-4205-835a-341da460f8c0.png)

---

# 4\. Transformations

## i. AdventureWorks Sales Data

no transformations

## ii. AdventureWorks Product Lookup

Changed to Currency

* I changed the column data types in sql server itself as I want to use Direct query instead of import.
    

RemoveColumns

* ProductSize
    

AddColumn

* based on a condition before hypen delimiter on column ProductSKU
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714580852771/c2fa24ca-4753-41f6-a956-89597af8605e.png)

column rename

* SKU Type
    

change data type

* Text
    

Replace

* "0", to "NA" for column ProductStyle
    

AddColumn

* based on a condition ProductPrice \* 0.9
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714580887339/a456c941-21cc-4577-9c06-dbe47da42229.png)

Transformation done for Product lookup:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714580914937/9e6d7e88-4459-41b7-a731-cf694b7501bc.png)

## iii. AdventureWorks Product Categories Lookup

change column type

* ProductCategoryKey to Int
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714580715203/7421322c-8d2a-4333-b1b4-d076e15e248c.png)

## iv. AdventureWorks Product Subcategories Lookup

None for me.

## v. AdventureWorks Customer Lookup

RemoveRowsWithErrors:

* CustomerKey
    

Filter rows

* CustomerKey remove nulls, remove empty
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714581353265/b956db18-d611-447f-b675-238b878d5d50.png)

Capital S starting letter of the word

* Prefix, Firstname, Lastname
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714581537891/89fb3281-a051-4661-aace-f37ef9644f3d.png)

AddColumn

* Combine Prefix, FirstName, LastName
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714581869843/1a9698af-ca43-4145-9ac5-8567d24f8aa4.png)

addcolumn

* extract from emailaddress column and rename to Domain Name
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714582354889/b45a4ec8-14a5-441c-9a5a-168f3277299c.png)

## vi. AdventureWorks Calendar Lookup

add columns

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714584337965/2a610932-3b8b-4c6c-ad5f-14a70c1324c1.png)

## vii. AdventureWorks Territory Lookup

None

## viii. AdventureWorks Returns Data

None

## ix. Rolling Calendar

Blank Query and enter 01-01-2023

right click source and choose insert step after to get custom1

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714584314680/59c3ec24-25c0-4601-81f6-21ba91723fe5.png)

## x. Measure Table

select Enter data option and do not type any info.

Note:

remove the column the measure table.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714636159999/101570cb-4c35-4e41-a4b3-8de84d36bea2.png)



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