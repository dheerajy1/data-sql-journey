This article depicts about the process of connecting to SQL Server using Python.


# 1\. Install lib using Pip

* !pip install sqlalchemy
    
* !pip install pyodbc
    

```python
import sqlalchemy, pyodbc, os
import pandas as pd
from sqlalchemy import create_engine, text
from sqlalchemy.engine import URL
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import OperationalError
```

```python
os.chdir(r'path\orders')
os.getcwd()
os.listdir()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715004676277/2f61536f-1f0f-49da-86b3-209358ab56bc.png)

# 2\. Connecting to Database

## i. Check the driver

```python
pyodbc.drivers()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715004751535/842a65a0-64f8-41ee-a65c-1d735e2e3636.png)

## ii. Configure the connection string

```python
connection_url = URL.create(
    "mssql+pyodbc",
    username="test",
    password="test",
    host=".",
    port=1433,
    database="test",
    query={
        "driver": "ODBC Driver 18 for SQL Server",
         "TrustServerCertificate": "yes", # When yes, the transport layer will use SSL to encrypt the channel and bypass walking the certificate chain to validate trust. Useful when using self-signed certificates or when the certificate chain cannot be validated.
        "authentication": "SqlPassword", # use SQL login credentials instead of Windows authentication.
        "pool_size": "1", # to limit the number of sessions to one
    },
)
```

## iii. Create an engine using the create\_engine() function, specifying the database URL

```python
engine = create_engine(connection_url)
```

## iv. Define a function that checks the connection using connection.execute("SELECT 1") method

```python
def check_connection():
    try:
        with engine.connect() as connection:
            connection.execute(text('SELECT 1'))
            connection.commit() # Important otherwise will be in open transaction state will eventually leads to slow running queries and leads to blocking.
        return True
    except OperationalError as error:
        print("Error:", str(error))
        return False
```

## v. Use the check\_connection() function to verify the connection before executing any database operations

* To Close the session use session.close()
    

```python
if check_connection():
    # Connection is valid, proceed with database operations
    # Create a session factory
    Session = sessionmaker(bind=engine)
    
    # Create a session
    session = Session()
    # Perform database operations using the session
    print(" Successfully established a connection to the database.")
else:
    # Connection is not valid, handle the error or retry the connection
    print("Error: Unable to establish a connection to the database.")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023122101/84ede1d4-583a-4c4e-8b07-06c15027dc4b.png)

Successfully established a connection to the database.


# 3\. Construct the query

```python
# Construct the query
qlist_tables = """
    SELECT TOP 10000 *
    FROM [db].INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE IN ('BASE TABLE')
    ORDER BY TABLE_NAME ASC
"""
qslt_orders = """
SELECT TOP 10000 
*
FROM [db].[dbo].[orders]
"""

qcrtab_instcus = """
BEGIN TRY
	BEGIN TRANSACTION T1CRTAB

	IF OBJECT_ID(N'[db].[dbo].[instnwnd Customers]', N'U') IS NOT NULL
		DROP TABLE [db].[dbo].[instnwnd Customers]

	CREATE TABLE [db].[dbo].[instnwnd Customers] (
		"CustomerID" nchar (5) NOT NULL ,
		"CompanyName" nvarchar (40) NOT NULL ,
		"ContactName" nvarchar (30) NULL ,
		"ContactTitle" nvarchar (30) NULL ,
		"Address" nvarchar (60) NULL ,
		"City" nvarchar (15) NULL ,
		"Region" nvarchar (15) NULL ,
		"PostalCode" nvarchar (10) NULL ,
		"Country" nvarchar (15) NULL ,
		"Phone" nvarchar (24) NULL ,
		"Fax" nvarchar (24) NULL ,
	)
	COMMIT TRANSACTION T1CRTAB
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION T1CRTAB
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH
"""

qslt_instcus = """
SELECT TOP 10000 
*
FROM [db].[dbo].[instnwnd Customers]
"""


qinst_instcus = """
BEGIN TRY
	BEGIN TRANSACTION T1INSTINCUS

	IF OBJECT_ID(N'[db].[dbo].[instnwnd Customers]', N'U') IS NOT NULL
	BEGIN
		INSERT INTO [db].[dbo].[instnwnd Customers] VALUES('ALFKI','Alfreds Futterkiste','Maria Anders','Sales Representative','Obere Str. 57','Berlin',NULL,'12209','Germany','030-0074321','030-0076545')
		INSERT INTO [db].[dbo].[instnwnd Customers] VALUES('ANATR','Ana Trujillo Emparedados y helados','Ana Trujillo','Owner','Avda. de la Constitución 2222','México D.F.',NULL,'05021','Mexico','(5) 555-4729','(5) 555-3745')
		INSERT INTO [db].[dbo].[instnwnd Customers] VALUES('ANTON','Antonio Moreno Taquería','Antonio Moreno','Owner','Mataderos  2312','México D.F.',NULL,'05023','Mexico','(5) 555-3932',NULL)
	END
	COMMIT TRANSACTION T1INSTINCUS
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION T1INSTINCUS
	PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH
"""
```

# 4\. Construct the dboperation function

```python
def dboperaiton(query, commit = 'nocommit'):
    try:
        result = session.execute(text(query)) # engine.connect().execute(text(query))
        # print(result.keys(), result.fetchall())
        if commit == 'commit':
            session.commit() # Important otherwise will be in open transaction state will eventually leads to slow running queries and leads to blocking.
        # session.close()
        return result, result.keys(), result.fetchall()
    except Exception as e:
        print(f"An error occurred: {str(e)}")
```

# 5\. using execute() method

## i. DQL: Select

```python
# try:
#     result = engine.connect().execute(text(qlist_tables))
#     print(result.all(), result.keys())
# except Exception as e:
#     print(f"An error occurred: {str(e)}")

dboperaiton(result, qlist_tables)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023310538/ff12d236-3924-4066-b9dc-06d65200d1f7.png)

```python
try:
    result2 = session.execute(text(qslt_orders)) # engine.connect() will create another session so use session
    print(type(result2), result2.fetchall(), result2.keys())
except Exception as e:
    print(f"An error occurred: {str(e)}")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715008132600/eace0fe5-4c76-4cbe-ab32-6842fe363f42.png)

Pd dataframe:

```python
# data = engine.connect().execute(text(qslt_orders))

data = dboperaiton(qslt_orders)

# Convert the result to a pandas DataFrame
#df_result2 = pd.DataFrame(data.fetchall(), columns=data.keys())

df_result2 = pd.DataFrame(data[2], columns=data[1])
df_result2
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023370523/41d8bf7f-1715-4541-a5a6-e4182973db7a.png)

## ii. DDL: Create

```python
dboperaiton(qcrtab_instcus, 'commit')
```

```python
dboperaiton(qslt_instcus)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023421915/3a0ef639-4a3e-4e22-b2f4-4161c3c5f029.png)

## iii. DML: Insert

```python
dboperaiton(qinst_instcus, 'commit')
```

```python
dboperaiton(qslt_instcus)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023513166/13c070f1-ac7a-4fdc-93fc-fc19bfd7c511.png)

# 6\. Using Pandas read\_sql\_query() menthod - DQL

## i. DQL: Select

```python
df = pd.read_sql_query(qlist_tables,engine)
df
```

```python
df2 = pd.read_sql_query(qslt_orders,engine)
df2
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023571166/c5923b50-9811-4337-9da3-61fb87ac123e.png)

## ii. DDL: Create

```python
# Create a DataFrame
data = {
    'Name': ['John', 'Jane', 'Mike'],
    'Age': [25, 30, 35],
    'City': ['New York', 'London', 'Paris']
}
df = pd.DataFrame(data)

# Write the DataFrame to a SQL table
table_name = 'tabpdperson'
df.to_sql(table_name, engine, if_exists='replace', index=False)
```

```python
# Confirm the table creation
query = f"""
SELECT * 
FROM {table_name}
"""
result = pd.read_sql(query, engine)
result
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715073646336/8a0e6bba-37b7-4e32-a6af-b035e63020c4.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715073708378/a1e7ca8e-77d2-47a2-a259-82963f0eb2dd.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715074005977/2aff481a-9521-4032-9f46-d6b1d8cbd304.png)

## iii. DML: Insert

```python
insert_data = {
    'Name': ['Mary', 'Peter', 'Mike'],
    'Age': [52, 40, 45],
    'City': ['Colorado', 'Texas', 'Arizonia']
}

df = pd.DataFrame(insert_data)

table_name = 'tabpdperson'

df.to_sql(table_name, engine, if_exists = 'append', index = False)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715074470429/51a54c14-a1a7-4062-a5c5-ddf5060e2eb9.png)

```python
table_name = 'tabpdperson'

query = f"""
SELECT TOP 10000 
*
FROM [dballpurpose].[dbo].[tabpdperson]
"""

df = pd.read_sql_query(query, engine)
df
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715074487337/cf2ab701-1ee7-4600-ac2f-4918c6639295.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715074521159/128f28f1-f420-4021-96bf-a41d5cacf38f.png)

---

Error:

Observed Long running queries and multiple sessions & multiple open transactions

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715013029143/be9a5e52-ed29-4310-b5d1-a74f0309dd2c.png)

Wiaittype: LCK\_M\_S

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715013426923/64f946c4-17b6-4b6a-9825-1fa197f2258e.png)

Sql query from sql handle

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715013757049/5ce87556-b62b-4bf2-8848-4ed6fbcccdd3.png)

DBCC OPENTRAN:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715013886021/2e38b136-fddd-4c02-adf7-457707f23618.png)

killed all open sessions.





# Conclusion

Learning Objectives,

1. Python
    
2. connect to sql server using python.
    
3. verify the connection.
    
4. perform DQL select and DDL create, DML write operations using python
    
5. Using Pandas read\_sql\_query() menthod - DQL
    
6. SQL Server
    
7. sqlalchemy lib, pandas lib
    

# Source: \[Link\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)