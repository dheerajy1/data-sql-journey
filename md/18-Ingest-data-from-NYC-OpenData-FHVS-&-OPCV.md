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

# 9 Query the data from SQL table

## 9.1 Read a SQL Query out of your database and into a pandas dataframe Using Pandas read\_sql\_query() method - DQL: Select

```python
sql_string = """
  SELECT TOP 5 
    *
  FROM [dballpurpose].[dbo].[financial_plan]
"""

df_var = pd.read_sql(sql_string, engine)
df_var.head(1000000)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716559571427/4f81899f-baf0-4914-bc9f-8c07b974d564.png)

# 10\. Exploring violations data

## 10.1 Total no of Violations:

```python
sql_string = """
SELECT TOP 10000 
FORMAT(COUNT(*), '###,### K') AS [Total no of rows]
FROM [dballpurpose].[dbo].[violations]
"""

df_var = pd.read_sql(sql_string, engine)
df_var.head(1000000)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716629344695/54f02a2e-9a5b-487b-ab26-e45f000b9b26.png)

* Viz 📉
    

```python
fig, axs = plt.subplots(1, 1, figsize=(5, 3))

sns.barplot(
    data=df_var,
    y='Total no of rows',
    hue = 'Total no of rows',
    palette = 'pastel',
    ax=axs
)

plt.xlabel('Total no of violations')
plt.ylabel('')

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716634839557/6427b519-27d7-4b27-9983-e063d75d980a.png)

## 10.2 Retrieving all info about Fire Hydrant violation:

```python
sql_string = """
SELECT
*
FROM [dballpurpose].[dbo].[violations]
WHERE violation = 'FIRE HYDRANT'
"""

df_var = pd.read_sql(sql_string, engine)
df_var.head(1000000)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716629383942/8d6e5226-4107-40e4-8f13-7abe6595ae01.png)

* Viz 📉
    

```python
fig, axs = plt.subplots(1, 1, figsize=(15, 5))

sns.set_theme(style="darkgrid")

sns.scatterplot(
    data=df_var,
    x= 'state',
    y = 'payment_amount',
    hue = 'penalty_amount',
    palette = 'Pastel1',
    ax=axs
)

plt.title(label='Sate wide distribution of payment & penalty amount', loc='center')

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716642913995/a9f64a7e-59e9-4b16-bd3c-4f021dc1705f.png)

## 10.3 Display no of violations, no of unique plates and avg fine amount for each violations:

```python
sql_string = """
SELECT
violation,
COUNT(*) AS [Total no of Violations],
COUNT(DISTINCT plate) AS [Unique no of plate],
AVG(fine_amount) AS [Avg fine]
FROM [dballpurpose].[dbo].[violations]
GROUP BY violation
HAVING COUNT(*) > 100
ORDER BY COUNT(*) DESC
"""

df_var = pd.read_sql(sql_string, engine)
df_var.head(1000000)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716629411429/fdd56fad-1b1c-4194-a913-b0d4cdf4aab3.png)

```python
# Create a figure with two subplots sharing the x-axis
fig, axs = plt.subplots(2, 1, sharex=True, figsize=(20, 10))
fig.subplots_adjust(hspace=0.009)  # Adjust space between the two subplots

# Flatten the array of axes (subplots) for easier iteration
axs = axs.flatten()

# Plot the same data on both subplots
for ax in axs:
    sns.barplot(data=df_var, x='violation', y='Total no of Violations', ax=ax)

# Set the limits for the y-axis on both subplots to 'break' the axis
# For example, if you want to break between 100 and 200:
axs[0].set_ylim(df_var['Total no of Violations'].nlargest(2).iloc[-1] + 100, df_var['Total no of Violations'].max()+500)  # Upper part for outliers
axs[1].set_ylim(0, df_var['Total no of Violations'].nlargest(2).iloc[-1] + 100)  # Lower part for the rest

# Hide the spines between ax1 and ax2
axs[0].spines['bottom'].set_visible(False)
axs[1].spines['top'].set_visible(False)

# Add diagonal lines to indicate the break in the y-axis
kwargs = dict(transform=axs[0].transAxes, color='k', clip_on=False)
axs[0].plot((-0.005, 0.005), (-0.005, 0.005), **kwargs)  # top axes-left diagonal
axs[0].plot((0.995, 1.005), (-0.005, 0.005), **kwargs)  # top axes-right diagonal

kwargs.update(transform=axs[1].transAxes)  # switch to the bottom axes
axs[1].plot((-0.005, 0.005), (0.995, 1.005), **kwargs)  # bottom axes-left diagonal
axs[1].plot((0.995, 1.005), (0.995, 1.005), **kwargs)  # bottom axes-right diagonal

# Set the title
axs[0].set_title('Each violations distribution', loc='center')

# Set the labels
axs[0].set_ylabel('')
axs[1].set_xlabel('Violation')
axs[1].set_ylabel('Total no of Violations')

# Get the current tick positions and labels
tick_positions = axs[1].get_xticks()
tick_labels = [label.get_text() for label in axs[1].get_xticklabels()]

# Set the tick positions and labels with rotation and Rotate x-axis labels by 90 degrees
axs[1].set_xticks(tick_positions)
axs[1].set_xticklabels(labels=tick_labels, rotation=90)


plt.tight_layout()

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716649718925/81f80e9a-5f60-4a82-9c67-959ef653a9ca.png)

## 10.4 Display no of violations, no of unique for hire vehilcles plates and avg fine amount for each violation:

```python
sql_string = """
SELECT
    violation,
    CASE
        WHEN [for_hire_vehicles].[dmv_license_plate_number] IS NOT NULL THEN 'FHV'
        ELSE 'NOT FHV'
    END AS [Category],
    COUNT(DISTINCT summons_number) AS [Total no of Violations],
    COUNT(DISTINCT plate) AS [Unique no of plate],
    AVG(fine_amount) AS [Avg fine]
FROM [dballpurpose].[dbo].[violations]
LEFT JOIN [dballpurpose].[dbo].[for_hire_vehicles] ON [dballpurpose].[dbo].[for_hire_vehicles].[dmv_license_plate_number] = [dballpurpose].[dbo].[violations].[plate]
GROUP BY violation,
    CASE
        WHEN [for_hire_vehicles].[dmv_license_plate_number] IS NOT NULL THEN 'FHV'
        ELSE 'NOT FHV'
    END 
ORDER BY COUNT(*) DESC
"""

df_var = pd.read_sql(sql_string, engine)
df_var.head(1000000)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716629441990/c14210f4-256b-494a-8704-ea8597372c40.png)

* Viz 📉
    

```python
# Create a figure with two subplots sharing the x-axis
fig, axs = plt.subplots(2, 1, sharex=True, figsize=(20, 10))
fig.subplots_adjust(hspace=0.009)  # Adjust space between the two subplots

# Flatten the array of axes (subplots) for easier iteration
axs = axs.flatten()

# Plot the same data on both subplots
for ax in axs:
    sns.barplot(
        data=df_var, 
        x='violation', 
        y='Total no of Violations', 
        hue = 'Category',
        palette = 'Pastel1',
        ax=ax
    )

# Set the limits for the y-axis on both subplots to 'break' the axis
# For example, if you want to break between 100 and 200:
axs[0].set_ylim(df_var['Total no of Violations'].nlargest(3).iloc[-1] + 5, df_var['Total no of Violations'].max()+500)  # Upper part for outliers
axs[1].set_ylim(0, df_var['Total no of Violations'].nlargest(3).iloc[-1] + 5)  # Lower part for the rest

# Hide the spines between ax1 and ax2
axs[0].spines['bottom'].set_visible(False)
axs[1].spines['top'].set_visible(False)

# Add diagonal lines to indicate the break in the y-axis
kwargs = dict(transform=axs[0].transAxes, color='k', clip_on=False)
axs[0].plot((-0.005, 0.005), (-0.005, 0.005), **kwargs)  # top axes-left diagonal
axs[0].plot((0.995, 1.005), (-0.005, 0.005), **kwargs)  # top axes-right diagonal

kwargs.update(transform=axs[1].transAxes)  # switch to the bottom axes
axs[1].plot((-0.005, 0.005), (0.995, 1.005), **kwargs)  # bottom axes-left diagonal
axs[1].plot((0.995, 1.005), (0.995, 1.005), **kwargs)  # bottom axes-right diagonal

# Set the title
axs[0].set_title('Each violations distribution', loc='center')

# Set the labels
axs[0].set_ylabel('')
axs[1].set_xlabel('Violation')
axs[1].set_ylabel('Total no of Violations')

# Get the current tick positions and labels
tick_positions = axs[1].get_xticks()
tick_labels = [label.get_text() for label in axs[1].get_xticklabels()]

# Set the tick positions and labels with rotation and Rotate x-axis labels by 90 degrees
axs[1].set_xticks(tick_positions)
axs[1].set_xticklabels(labels=tick_labels, rotation=90)


plt.tight_layout()

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716650608444/2e3b7c8f-7820-4095-871b-ca0c247d692f.png)


# 11\. Workshop Questions

## 11.1 Choose your favorite violation type and filter the violations table for it!

```python
sql_string = """
SELECT
    *
FROM [dballpurpose].[dbo].[violations]
WHERE violation = 'CROSSWALK'
"""

df_var = pd.read_sql(sql_string, engine)
df_var
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716656798589/6104a837-71fb-4183-8a9e-af3b60c3b265.png)

* Viz 📉
    

```python
fig, axs = plt.subplots(1, 1, figsize=(15, 5))

sns.set_theme(style="darkgrid")

sns.barplot(
    data=df_var,
    x= 'payment_amount',
    y = 'penalty_amount',
    hue = 'state',
    palette= 'Pastel1',
    ax=axs
)

plt.title(label='Sate wide distribution of penalty amount', loc='center')

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716657462774/580d1569-87c2-432f-a7e6-dbf472c91cfb.png)

## 11.2 How many total violations are there in that category?

```python
sql_string = """
SELECT
    COUNT(*) AS [Total no of violations]
FROM [dballpurpose].[dbo].[violations]
WHERE violation = 'CROSSWALK'
"""

df_var = pd.read_sql(sql_string, engine)
df_var
```

* Viz 📉
    

```python
fig, axs = plt.subplots(1, 1, figsize=(15, 5))

sns.set_theme(style="darkgrid")

sns.barplot(
    data=df_var,
    y = 'Total no of violations',
    ax=axs
)

plt.xlabel('CROSSWALK violation')

plt.title(label='Total no of violations for \'CROSSWALK\' violation', loc='center')

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716657770799/17d0b27c-fef9-430a-a30a-2c9143f40a13.png)

## 11.3 What state’s residents are the worst offenders (excluding NY)?

```python
sql_string = """
SELECT
	state,
	COUNT(DISTINCT plate) AS [Total no of Violations]
FROM [dballpurpose].[dbo].[violations]
WHERE violation = 'CROSSWALK'
	AND state <> 'NY'
GROUP BY state
ORDER BY [Total no of Violations] DESC
"""

df_var = pd.read_sql(sql_string, engine)
df_var
```

* Viz 📉
    

```python
fig, axs = plt.subplots(1, 1, figsize=(15, 5))

sns.set_theme(style="darkgrid")

sns.barplot(
    data=df_var,
    x = 'state',
    y = 'Total no of Violations',
    ax=axs
)

plt.xlabel('State')

plt.title(label='Total no of violations for \'CROSSWALK\' violation for each state', loc='center')

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716659175058/ccdef2ed-7f25-4d0c-8bfa-45aef7cb0628.png)

## 11.4 How many of those violations came from FHVs?

```python
sql_string = """
SELECT
    state,
    CASE
        WHEN [for_hire_vehicles].[dmv_license_plate_number] IS NOT NULL THEN 'FHV'
        ELSE 'NOT FHV'
    END AS [Category],
    COUNT(DISTINCT summons_number) AS [Total no of Violations],
    COUNT(DISTINCT plate) AS [Unique no of plate],
    AVG(fine_amount) AS [Avg fine]
FROM [dballpurpose].[dbo].[violations]
LEFT JOIN [dballpurpose].[dbo].[for_hire_vehicles] ON [dballpurpose].[dbo].[for_hire_vehicles].[dmv_license_plate_number] = [dballpurpose].[dbo].[violations].[plate]
WHERE violation = 'CROSSWALK'
	AND state <> 'NY'
GROUP BY state,
    CASE
        WHEN [for_hire_vehicles].[dmv_license_plate_number] IS NOT NULL THEN 'FHV'
        ELSE 'NOT FHV'
    END 
ORDER BY COUNT(*) DESC
"""

df_var = pd.read_sql(sql_string, engine)
df_var
```

* Viz 📉
    

```python
fig, axs = plt.subplots(1, 1, figsize=(15, 5))

sns.set_theme(style="darkgrid")

sns.barplot(
    data=df_var,
    x = 'state',
    y = 'Total no of Violations',
    hue= 'Category',
    palette='Pastel1',
    ax=axs
)

plt.xlabel('CROSSWALK violation')

plt.title(label='Total no of violations for \'CROSSWALK\' violation', loc='center')

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716659218057/587fbc8f-ff45-48f6-b919-f18416f1ea61.png)

# Conclusion

Learning Objectives,

* Python & Pandas: Import libraries and use Pandas for data manipulation and analysis.
    
* Database Connectivity: Configuring database connections and creating engines with SQLAlchemy in Python.
    
* Data Ingestion: Ingesting data from NYC OpenData using Python requests and Pandas functions.
    
* SQL Operations: Perform CRUD operations and query data from SQL Server using Python.
    
* Data Visualization: Visualize data using Python libraries such as Matplotlib and Seaborn for insightful charts and graphs.

- using pandas read_json()

- Transforming dataframe

- Pandas read_sql_query()

- Pandas to_sql() method

- fixing ProgrammingError: (pyodbc.ProgrammingError) ('Invalid parameter type. param-index=16 param-type=dict', 'HY105') by changing data type of a column

- Exploring data using T-SQL

- Pandas read_sql_query() method

- ingest nyc open data

- visualizing data using seaborn lib

- Pandas read_sql() method


# Source: Meghan Maloy \[[Link](https://www.youtube.com/watch?v=tqk9RL8FEGU&list=LL&index=3)\], \[[Link](https://2024.open-data.nyc/event/intro-to-sql/)\], \[[Link](https://drive.google.com/drive/folders/1Z39aC3sypkBhphlX_YyW04HjxdBlddGv)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)
