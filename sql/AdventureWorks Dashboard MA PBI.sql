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