Today's topic, I am learning how to establish connection between Power BI & MS SQL Server to get the data into Power BI and work with the data.

# I. Data Loading & simple queries in SQL Server

Head to this link to download the backup file of the database. \[[Link](https://chandoo.org/wp/wp-content/uploads/2023/06/ac-sql-server-backup.zip)\]

Restore in the MS SQL Server and perform the sample queries to get familiar with the data.

* Restore database / device
    
* verify backup media
    
* relocate files
    

Image showing successful restoration:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1711638663030/6ef1fb6b-daf6-4f7b-80bb-6e258fe4ddc3.png)

Query results:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1711692209208/1bed7c85-1677-48ae-b9c0-941c87426fb3.png)

# II. Create sales Report in Power BI

## a. Establishing connection between Power BI and SQL

You will be asked for login credentials When connecting first time to a server after that the credentials will be stored to prevent reentering.

To clear the login credentials in Power BI:

File/Options and settings/Data source settings/search for the server name/ Clear Permissions.

Now,

Select Get Data/more/SQL Server/provide the server with IP.

```sql
localhost:portnumber
```

To identify the port number run the below query in Azure Data Studio / SSMS:

```sql
USE MASTER
GO
xp_readerrorlog 0, 1, N'Server is listening on'
GO
```

Data connectivity mode:

1. Import: Will store the data in power BI, Use this when less data in SQL server.
    
2. Direct Query: Will make call to SQL server every time, use this when dealing with large data.
    

select windows auth

select the tables/load

Faced an error:

* Feedback Type: Frown (Error)
    
* Error Message: We couldn't connect to your DirectQuery data source or internal model. Double-check that your server and database names are correct, and that you have permission to access them.
    

Successfully connected second time when used import Data connectivity mode.

## b. Report in Power BI

Measure in Sales tables:

Sum of total sales measure:

```sql
Total Sales = SUM(sales[Amount])
```

Sum of total box's amount measure:

```sql
Total Boxes = SUM(sales[Boxes])
```

Number of shipments measure:

```sql
Shipment Count = COUNTROWS(sales)
```

Low Box shipment measure:

```sql
Low Box Shipments = CALCULATE([Shipment Count], sales[Boxes] < 50)
```

LBS % measure:

```sql
LBS % = DIVIDE([Low Box Shipments],[Shipment Count])
```

Now,

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1711716119653/7265022f-8a06-450a-a89c-da3c9294007d.png)

# III. Dynamic queries with Power Query parameters

Parameterize the queries & set a variable with power BI so that changing the values the whole reports gets updated.

Power BI/ Home/get data/ provide credentials along with database/ select advanced/ SQL statement / write the SQL query / ok

```sql
SELECT TOP 10000
    *
FROM products
WHERE product_id  ='P06'
```

Power Query / Home/ query 1/ right click / edit query/

```sql
= Sql.Database("localhost:1433", "chocolatesdb", [Query="SELECT TOP 10000#(lf)    *#(lf)FROM sales#(lf)WHERE product  ='"& #"Product code"&"'"])
```

click edit permission / run.

Go to sales table / applied steps / delete navigation/ choose source / paste the formula.

Creating a measure for the parameter at measure level:

```sql
Selected product = SELECTEDVALUE(sales[Product])
```

Finally,

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1711722547513/dee28a3d-dd43-450c-96e2-c90170050f94.png)

# Conclusion

Learning Objectives,

1. Data Loading & simple queries
    
2. Create sales report:
    
    1. Measures:
        
        1. Total sales
            
        2. Total boxes
            
        3. Shipment count
            
        4. Low Box percentage
            
    2. Visuals
        
        1. Execute summary
            
        2. sales by product
            
        3. Top sales-persons
            
        4. sales trend
            
3. Make dynamic queries with Power Query parameters.
    

# Source: Chandoo \[[Link](https://www.youtube.com/watch?v=UQJAHUUFK-o&list=PLTVZiPyvt_H6oFcEtnlFZOP4Z6eNRd1KB&index=14)\]\[[Link](https://chandoo.org/wp/learn-sql-for-data-analysis/)\]

# Author: Dheeraj.y

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)