This article will demonstrate the data ingestion and exploration for datasets For Hire Vehicles ([<mark>FHVS</mark>](https://data.cityofnewyork.us/Transportation/For-Hire-Vehicles-FHV-Active/8wbx-tsch/about_data)) & Open Parking and Camera Violations ([<mark>OPCV</mark>](https://data.cityofnewyork.us/City-Government/Open-Parking-and-Camera-Violations/nc67-uf89/about_data)) provided by NYC OpenData.


# 1\. Import libraries

```python
import requests
import sqlalchemy, pyodbc, os
import pandas as pd
from sqlalchemy import create_engine, text
from sqlalchemy.engine import URL
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import OperationalError
from IPython.display import Markdown, display
```

# 2\. Configuring Database connection setup

## i. Check the driver

```python
pyodbc.drivers()
```

## ii. Configure the connection string

```python
connection_url = URL.create(
    "mssql+pyodbc",
    username = sql_login_name,
    password = sql_login_password,
    host = server_name,
    port= port_number,
    database = database_name,
    query = {
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

# 3\. Ingest data of For Hire Vehicles ([<mark>FHVS</mark>](https://data.cityofnewyork.us/Transportation/For-Hire-Vehicles-FHV-Active/8wbx-tsch/about_data)) from NYC openData

```python
# get data from open data endpoints
limit = 1000000

fhvs_url = (
    f"https://data.cityofnewyork.us/resource/8wbx-tsch.json?"
    f"$limit={limit}&"
)
```

## 3.1 using Get request to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
# Make the HTTP request.
response = requests.get(fhvs_url)

# Check the status of the request
if response.status_code == 200:
    json_fhvs = response.json()
    print("Request was successful.",response.headers['Content-Type'])
else:
    print(f"Request failed with status code: {response.status_code}")
```

```python
response.headers
```

```python
response.content
```

## 3.2 Use pandas DataFrame to convert the JSON data:

```python
df_fhvsRaw = pd.DataFrame(data = json_fhvs)
df_fhvsRaw
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716542934338/cc595a7e-9fdb-48a1-b84a-0fbf7b470b7b.png)

```python
fhvs.shape
```

```python
fhvs.dtypes
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716542957265/a20cad5c-6931-43e4-ba6b-bc8e8b87dbc0.png)


# 4\. Ingest data of Open Parking and Camera Violations ([<mark>OPCV</mark>](https://data.cityofnewyork.us/City-Government/Open-Parking-and-Camera-Violations/nc67-uf89/about_data)) from NYC openData

```python
# get data from open data endpoints
limit = 1000000

# only gets violations from 2023-12-25
violations_url = (
    f"https://data.cityofnewyork.us/resource/nc67-uf89.json?"
    f"&issue_date=12/25/2023"
    f"&$limit={limit}&"
)
```

## 4.1 using pandas read\_json() to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
violations = pd.read_json(violations_url)

violations['issue_date'] = pd.to_datetime(violations['issue_date'])
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716543119472/1622ab96-cd66-40e0-911d-ab4accb6f42a.png)

### 4.1.1 Transforming dataframe by changing the column data type

```python
violations['summons_image'] = violations['summons_image'].astype(str)
violations.dtypes
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716487265521/8f3c6af8-f164-4786-83af-d9fb45144ce5.png)

Error faced during pd.to\_sql(), i.e is due to summons\_image column has an obj in its row value.

Solution:

```python
violations['summons_image'] = violations['summons_image'].astype(str)
```

### 4.1.2 Transforming dataframe by extractiong a column contents

The below are the steps performed:

* Create a copy of the 'violations' DataFrame
    
* Extract values from 'summons\_image' column and assign them to new columns
    
* Remove 'summons\_image' column from the DataFrame
    

```python
violations_bronze = violations.copy()
violations_bronze[['summons_image_url', 'summons_image_description']] = violations_bronze['summons_image'].str.extract("url': '(.*?)', 'description': '(.*?)'")
violations_bronze = violations_bronze.drop('summons_image', axis=1)

violations_bronze
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716556203053/5c8a572e-9ae0-420c-b664-cdf747fa1275.png)


# 5\. Read the existing tables in the SQL Server Database

## 5.1 Using Pandas read\_sql\_query() method - DQL: Select

* first, confirm if the tables already exist in the database
    

```python
qlist_tables = """
    SELECT TOP 10000 *
    FROM [dballpurpose].INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE IN ('BASE TABLE')
    ORDER BY TABLE_NAME ASC
"""

df_var = pd.read_sql_query(qlist_tables,engine)
df_var
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716543232891/f9e8ed3f-11a3-4cf5-807a-4ce7a64270d3.png)

# 6\. Send the ingested data in dataframes to SQL Server tables

## 6.1 Using Pandas to\_sql() method - DDL: Create

* fhvs data to for\_hire\_vehicles sql table:
    

```python
fhvs.to_sql('for_hire_vehicles', engine, if_exists='replace', index=False)
```

* violations data to violations sql table:
    

```python
violations.to_sql('violations', engine, if_exists='replace', index=False)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716556430071/1cde87ae-0dee-45d0-8c9a-996d5845ff4d.png)

Error:

* ProgrammingError: (pyodbc.ProgrammingError) ('Invalid parameter type. param-index=16 param-type=dict', 'HY105')
    
    * (Background on this error at: [https://sqlalche.me/e/20/f405](https://sqlalche.me/e/20/f405))
        
    * Like.. the column data has an object as its row value.
        
    * `violations['summons_image'] = violations['summons_image'].astype(str)`


In SQL Server:

for\_hire\_vehicles table:

```sql
SELECT TOP 10000 
FORMAT(COUNT(*), '###,### K') AS [Total no of rows]
FROM [dbo].[for_hire_vehicles]

SELECT TOP 10000 
*
FROM [dbo].[for_hire_vehicles]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716556673602/b6ec1abf-3ffa-401b-beb6-9ce5829d3c08.png)

violations table:

```sql
SELECT TOP 10000 
FORMAT(COUNT(*), '###,### K') AS [Total no of rows]
FROM [dballpurpose].[dbo].[violations]

SELECT TOP 10000 
*
FROM [dballpurpose].[dbo].[violations]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716556751086/aeadfb6e-a91f-4cfc-b682-f2e5a31ba40b.png)

# 7\. Query the data from SQL table

## 7.1 Read a SQL Query out of your database and into a pandas dataframe Using Pandas read\_sql\_query() method - DQL: Select

```python
sql_string = """
  SELECT TOP 5 
    *
  FROM [dballpurpose].[dbo].[violations]
"""

df_var = pd.read_sql(sql_string, engine)
df_var.head(1000000)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716558365983/4425ea97-4d3c-4ed3-b3a0-fc767c96d3c9.png)

# 8 Bonus data

The `[Bonus]` step below will connect to the NYC OpenData platform to pull in data from [Financial Plan Baseline & Initiatives By Funding](https://data.cityofnewyork.us/City-Government/Financial-Plan-Baseline-Initiatives-By-Funding/e64w-ctmw/about_data)

```python
# get data from open data endpoints
limit = 1000000

fbpi_url = (
    f"https://data.cityofnewyork.us/resource/e64w-ctmw.json?"
    f"$limit={limit}&"
)
```

## 8.1 using pandas read\_json() to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
fbpi = pd.read_json(fbpi_url)
```

```python
fbpi
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716559220290/fc259591-fcd0-48a8-b3f4-30a6557aac2f.png)

```python
fbpi.dtypes
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716559247070/9f9b8aa5-db63-4d1e-80c6-05104574e313.png)

* first, confirm if the tables already exist in the database
    

```python
qcheck_tables = """
    SELECT TABLE_NAME
    FROM [dballpurpose].INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE IN ('BASE TABLE')
    AND TABLE_NAME = 'financial_plan'
"""

if (pd.read_sql_query(qcheck_tables,engine).empty):
    print("financial_plan table does not exist in the SQL Server")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716559399854/2ee43419-2d86-48f8-ab3a-e4d91a3d2bc4.png)

## 8.2. Send the ingested data in dataframes to SQL Server tables

### 8.2.1 Using Pandas to\_sql() method - DDL: Create

* fhvs data to for\_hire\_vehicles sql table:
    

```python
fbpi.to_sql('financial_plan', engine, if_exists='replace', index=False)
```

* first, confirm if the tables already exist in the database


# Conclusion

Learning Objectives,

- Python & Pandas: Import libraries and use Pandas for data manipulation and analysis.

- Data Ingestion: Ingesting data from NYC OpenData using Python requests and Pandas functions.

- using pandas read_json()

- Transforming dataframe

- Pandas read_sql_query()

- Pandas to_sql() method

- fixing ProgrammingError: (pyodbc.ProgrammingError) ('Invalid parameter type. param-index=16 param-type=dict', 'HY105') by changing data type of a column

- Exploring data using T-SQL

- Pandas read_sql_query() method

- ingest fbpi

- pandas read_json()

- Pandas to_sql() method



# Source: Meghan Maloy \[[Link](https://www.youtube.com/watch?v=tqk9RL8FEGU&list=LL&index=3)\], \[[Link](https://2024.open-data.nyc/event/intro-to-sql/)\], \[[Link](https://drive.google.com/drive/folders/1Z39aC3sypkBhphlX_YyW04HjxdBlddGv)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)
