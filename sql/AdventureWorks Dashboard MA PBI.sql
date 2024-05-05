USE CustomAdventureWorksDW;

----------------------------------------------------------------------------------------------------------------


-- AdventureWorks Sales Data 2020


BEGIN TRY

    BEGIN TRANSACTION T1SDT2020; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020] DOES NOT EXIST, Created')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020] (
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
    COMMIT TRANSACTION T1SDT2020;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T1SDT2020;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;


SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020]



BEGIN TRY

    BEGIN TRANSACTION T2SDBI2020; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\sales data\AdventureWorks Sales Data 2020.csv'
		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			ROWTERMINATOR = '0x0a'
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T2SDBI2020;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T2SDBI2020;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;


SELECT TOP 10000
COUNT(*) -- 29481
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020] 




----------------------------------------------------------------------------------------------------------------



-- AdventureWorks Sales Data 2021


BEGIN TRY

    BEGIN TRANSACTION T3SDT2021; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021] DOES NOT EXIST, Created')
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


SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]



BEGIN TRY

    BEGIN TRANSACTION T4SDBI2021; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\sales data\AdventureWorks Sales Data 2021.csv'
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


SELECT TOP 10000
COUNT(*) -- 29481
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021] 




----------------------------------------------------------------------------------------------------------------

-- AdventureWorks Sales Data 2022


BEGIN TRY

    BEGIN TRANSACTION T5SDT2022; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022] DOES NOT EXIST, Created')
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


SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]



BEGIN TRY

    BEGIN TRANSACTION T6SDBI2022; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\sales data\AdventureWorks Sales Data 2022.csv'
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


SELECT TOP 10000
COUNT(*) -- 29481
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022] 



----------------------------------------------------------------------------------------------------------------

-- Combine data into sales data


SELECT TOP 2 *
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2020]
UNION ALL
SELECT TOP 2 * FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2021]
UNION ALL
SELECT TOP 2 * FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data 2022]



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


SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data]




----------------------------------------------------------------------------------------------------------------


-- AdventureWorks Product Lookup



BEGIN TRY

    BEGIN TRANSACTION T9PLT; -- Start the transaction

	-- Your main content of the script here
		
		IF OBJECT_ID(N'[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]', N'U') IS NOT NULL
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup] EXISTS, Dropped')
				DROP TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]
			END

		ELSE
			BEGIN
				PRINT('[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup] DOES NOT EXIST, Created')
				CREATE TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup] (
					[ProductKey] int NOT NULL,
					[ProductSubcategoryKey] int NOT NULL,
					[ProductSKU] varchar(50),
					[ProductName] varchar(50),
					[ModelName] varchar(50),
					[ProductDescription] text,
					[ProductColor] varchar(50),
					[ProductSize] varchar(50),
					[ProductStyle] varchar(50),
					[ProductCost] money,
					[ProductPrice] money
					)
			END

	-- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T9PLT;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T9PLT;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;





BEGIN TRY

    BEGIN TRANSACTION T10PLBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\AdventureWorks Product Lookup.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR = ',', 
			FIELDQUOTE = '"',
			ROWTERMINATOR = '0x0A', -- LF as the row terminator
			TABLOCK
			)

    -- If no exception occurs, commit the transaction
    COMMIT TRANSACTION T10PLBI;

END TRY

BEGIN CATCH
    -- If an exception occurs, roll back the transaction
    IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION T10PLBI;
			-- Optionally, you can log or handle the error here
			-- For example:
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END
END CATCH;




SELECT TOP 10000
*
FROM  [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]


-- Error: 1. due to comma present in field (use Text qualifier (write only ") in import data wizard) and bulk data in product description column (could not get it resolved suing import data wizard); used import flat file wizard.



-- Change datatype



BEGIN TRY

	BEGIN TRANSACTION TMDTPLPCPP;

	ALTER TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]
	ALTER COLUMN ProductCost money

	ALTER TABLE [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]
	ALTER COLUMN ProductPrice money

	-- COMMIT TRANSACTION TMDTPLPCPP;

END TRY

BEGIN CATCH
	IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION TMDTPLPCPP;
		END

END CATCH



exec sp_help '[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]'





----------------------------------------------------------------------------------------------------------------

-- AdventureWorks Product Categories Lookup



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





BEGIN TRY

    BEGIN TRANSACTION T12PCBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Categories Lookup]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\AdventureWorks Product Categories Lookup.csv'
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



SELECT TOP 10000
*
FROM  [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Categories Lookup]

----------------------------------------------------------------------------------------------------------------

-- AdventureWorks Product Subcategories Lookup



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





BEGIN TRY

    BEGIN TRANSACTION T14PSCBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Subcategories Lookup]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\AdventureWorks Product Subcategories Lookup.csv'
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



SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Product Subcategories Lookup]


----------------------------------------------------------------------------------------------------------------

-- AdventureWorks Customer Lookup



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





BEGIN TRY

    BEGIN TRANSACTION T16CULBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\AdventureWorks Customer Lookup.csv'
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



SELECT
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup]


----------------------------------------------------------------------------------------------------------------


-- AdventureWorks Calendar Lookup


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





BEGIN TRY

    BEGIN TRANSACTION T18CALBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Calendar Lookup]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\AdventureWorks Calendar Lookup.csv'
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



SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Calendar Lookup]


----------------------------------------------------------------------------------------------------------------

-- AdventureWorks Territory Lookup



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





BEGIN TRY

    BEGIN TRANSACTION T20TLBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Territory Lookup]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\AdventureWorks Territory Lookup.csv'
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



SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Territory Lookup]


----------------------------------------------------------------------------------------------------------------

-- AdventureWorks Returns Data



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





BEGIN TRY

    BEGIN TRANSACTION T22RDBI; -- Start the transaction
	
    -- Your main content of the script here
		-- import the file
		BULK INSERT [CustomAdventureWorksDW].[dbo].[AdventureWorks Returns Data]
		FROM 'F:\Power BI\filesfrom internet\adventure-works-main\data\AdventureWorks Returns Data.csv'
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



SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Returns Data]



----------------------------------------------------------------------------------------------------------------



SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup]


SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data]


SELECT TOP 10000
*
FROM [CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup]
INNER JOIN [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data] ON [CustomAdventureWorksDW].[dbo].[AdventureWorks Sales Data].CustomerKey = [CustomAdventureWorksDW].[dbo].[AdventureWorks Customer Lookup].CustomerKey


----------------------------------------------------------------------------------------------------------------

exec sp_help '[CustomAdventureWorksDW].[dbo].[AdventureWorks Product Lookup]'