This article will demonstrate the data ingestion and exploration for Power plants dataset provided by US EIA Open Data Portal.

# U.S. Energy Information Administration

EIA Open Data

# 1\. Import libraries

```python
import requests
import pandas as pd
import copy
import pyodbc
from sqlalchemy import create_engine, text
from sqlalchemy.engine import URL
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import OperationalError
import seaborn as sns
import matplotlib.pyplot as plt
import os

# Set the display option to show all max column width
pd.set_option('display.max_colwidth', None)

# Set the display option to show all columns
pd.set_option('display.max_columns', None)
```

# 2\. Ingest data from EIA of ([<mark>Power Plants</mark>](https://atlas.eia.gov/datasets/eia::power-plants/about))

* These data identify operable electric generating plants in the United States by energy source.
    
* [https://atlas.eia.gov/datasets/eia::power-plants/api](https://atlas.eia.gov/datasets/eia::power-plants/api)
    
* [https://developers.arcgis.com/rest/services-reference/enterprise/query-feature-service-layer/](https://developers.arcgis.com/rest/services-reference/enterprise/query-feature-service-layer/)
    

## 2.1 [<mark>Get Power Plants</mark>](https://atlas.eia.gov/datasets/eia::power-plants/api) data

### 2.1.1 Url Connection setup

```python
resultOffset = 0
resultRecordCount = 2000

def eia_powplt_url(resultOffset):

    return  "".join(f"""
            https://services7.arcgis.com
            /FGr1D95XCGALKXqM/arcgis/rest/services
            /Power_Plants_Testing
            /FeatureServer
            /0
            /query
            ?where=1%3D1
            &outFields=*
            &outSR=4326
            &f=json
            &resultOffset={resultOffset}
            &resultRecordCount={resultRecordCount}
            """.split()
        )
```

### 2.1.2 using Get request to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
raw_data = []

# Make the HTTP request.
response = requests.get(eia_powplt_url(resultOffset))

# Check the status of the request
if response.status_code == 200:
    
    print("Request was successful and made more requests",response.headers['Content-Type'])
    
    while resultOffset < 12275:
        
        data = response.json()
        
        records = data.get("features", []) # to return an empty list if 'features' key is empty or not present
        
        raw_data.extend(records)
        
        # Check if there are more records to retrieve
        if len(records) < resultRecordCount or resultOffset > 12275:
            break;
        
        # Update the offset for the next request
        resultOffset += resultRecordCount
        
        # Make requests until all records are retrieved
        response = requests.get(eia_powplt_url(resultOffset))
        
        if response.status_code != 200:
            print(f"Request failed with status code: {response.status_code} at {resultOffset} resultOffset")
            break;
    
else:
    print(f"Request failed with status code: {response.status_code} at {resultOffset} resultOffset")
```

* headers
    

```python
response.headers
```

```python
response.content
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002286587/ea0193e0-96c0-479c-be1b-01bc61a81a96.png)

### 2.1.3 Exploring json response

```python
type(data), len(data)
```

```python
data
```

```python
data.keys()
```

```python
data['exceededTransferLimit']
```

```python
pd.DataFrame(data=data['fields'])
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002455403/f6f657c3-8c64-4977-ac92-530658842844.png)

```python
data['features']
```

```python
type(data['features']), len(data['features'])
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002480355/e276e3c0-60cd-43ef-8552-07666db5c736.png)

```python
raw_data # all records
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002500008/a4665f6f-146e-4d6a-867b-b016cad4b36d.png)

```python
json_eia_powplt = copy.deepcopy(raw_data)
type(json_eia_powplt), len(json_eia_powplt)
```

```python
json_eia_powplt[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002524494/c3530834-1865-49c6-a20a-48e5e1073a82.png)

### 2.1.4 Destructuring json response

```python
destrc_json_eia_powplt = []

for powplt in json_eia_powplt:
    emtdict = {}
    for data in powplt.values():
        emtdict.update(data) 
    destrc_json_eia_powplt.append(emtdict)
```

### 2.1.5 Use pandas DataFrame to convert the JSON data:

```python
eia_powplt = pd.DataFrame(data=destrc_json_eia_powplt)
eia_powplt.dtypes, eia_powplt.shape
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002553579/9001fb64-fd8c-46d7-8830-2b2a81819954.png)

```python
eia_powplt
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002575758/ac912f4e-9f96-4c67-bf2e-a015078a6b2d.png)

### 2.1.6 Transformations

```python
eia_powplt_filt = eia_powplt.copy()
```

#### 2.1.6.1 Check for duplicates

```python
eia_powplt.merge(eia_powplt.duplicated().to_frame().rename(columns={0: "Isduplicate"}), left_index=True, right_index=True).query("Isduplicate == True")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002638462/ea6f1a7b-46fa-4245-b290-b627b39a010a.png)

```python
eia_powplt_filt.loc[
    eia_powplt_filt['OBJECTID'] == 23578
]
```

```python
eia_powplt_filt
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002606213/ea06cf8d-a883-48c2-ae27-51cc2d3fb331.png)

# 3\. Store final dataframe in SQL Server

## 3.1 Configuring Database connection setup

### 3.1.1 Check the driver

```python
pyodbc.drivers()
```

### 3.1.2. Configure the connection string

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

### 3.1.3. Create an engine using the create\_engine() function, specifying the database URL

```python
engine = create_engine(connection_url)
```

### 3.1.4 Create a session using sessionmaker

* only run this if you are not using pandas read sql query or to sql i.e if you want to perform DDL or DML oprations:
    

```python
Session = sessionmaker(bind=engine)
session = Session()
```

## 3.2 Read the existing tables in the SQL Server Database

### 3.2.1 Using Pandas read\_sql\_query() method - DQL: Select

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

```python
table_name = 'Power Plants'

qlist_tables = f"""
    SELECT TOP 10000 *
    FROM [dballpurpose].INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE IN ('BASE TABLE')
        AND TABLE_NAME = '{table_name}'
    ORDER BY TABLE_NAME ASC
"""

df_var = pd.read_sql_query(qlist_tables,engine)

if df_var.empty:
    print(f"Table [{table_name}] does not exist")
else:
    print(f"Table [{table_name}] exists")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002792098/f18df447-f607-4bf7-b0ac-d39c53a6d745.png)

### 3.2.2 Using sqlalchemy Session() method - DDL: DROP

* Drop table if n only if exists
    

**<mark>Caution: Below is a DROP SQL statement</mark>**

```python
# Define the DROP SQL statement

table_name = 'Power Plants'

qdrp_table = f"""
IF OBJECT_ID(N'[dbo].[{table_name}]', N'U') IS NOT NULL
BEGIN
    DROP TABLE [dballpurpose].[dbo].[{table_name}]
END
"""

try:
    # Execute the SQL statement using the session's execute() method
    session.execute(text(qdrp_table))

    # Commit the changes
    session.commit()
    print(f"{table_name} dropped successfully!")
except OperationalError as e:
    # Handle the OperationalError exception
    session.rollback()
    print(f"An error occurred: {str(e)}")
finally:
    # Close the session
    session.close()
```

## 3.3 Send the ingested data in dataframes to SQL Server tables

## 3.3.1 Using Pandas to\_sql() method - DDL: Create

**<mark>Run the below cell only once</mark>**

```python
table_name = 'Power Plants'

eia_powplt_filt.to_sql(table_name, engine, if_exists='replace', index=False)
```

# 4\. Query the data from SQL table

* Read from your database Using Pandas read\_sql\_query() method - DQL: Select
    

```python
table_name = 'Power Plants'

sql_string = f"""
  SELECT TOP 100
    *
  FROM [dballpurpose].[dbo].[{table_name}]
"""

df_var = pd.read_sql(sql_string, engine)
df_var
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002928469/161c0662-726b-405e-b5d3-865456be6fd4.png)

* Viz 📉
    

```python
df_var = df_var.groupby(['State', 'sector_name']).agg({'Total_MW': 'mean'})

fig, axs = plt.subplots(1, 1, figsize=(25, 8))

sns.set_theme(style="darkgrid")

sns.barplot(
    data=df_var,
    x= 'State',
    y = 'Total_MW',
    hue = 'sector_name',
    palette = 'Pastel1',
    ax=axs
)

# Get the current tick positions and labels
tick_positions = axs.get_xticks()
tick_labels = [label.get_text() for label in axs.get_xticklabels()]

# Set the tick positions and labels with rotation and Rotate x-axis labels by 90 degrees
axs.set_xticks(tick_positions)
axs.set_xticklabels(labels=tick_labels, rotation=90)

plt.title(label='Mean Mass of Power Plants by sector_name Type', loc='center')

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718002951201/7b600c9b-5e9b-4e69-aff4-bcbe96cf12f9.png)


# 5\. Save nasa\_ml\_filt as CSV file

## 5.1 Check file if exists

```python
os.getcwd()
```

```python
# Define the file path
path = r'C:\Users\HP\Downloads\\'
file_name = 'Power Plants'

os.chdir(f'{path}')

csv_files = [file for file in os.listdir() if file.endswith('.csv')]

if any(file_name in file for file in csv_files):
    print(f'Found a file with {file_name} in the name.')
else:
    print(f'No {file_name} in any file name.')
```

## 5.2 Remove file if exists

**<mark>Caution: Below is a remove file statement</mark>**

```python
# Define the file path
path = r'C:\Users\HP\Downloads\\'
file_name = 'Power Plants'
file_path = f"{path}{file_name}.csv"

try:
    # Check if the file exists
    if os.path.exists(file_path):
        # Delete the file
        os.remove(file_path)
        print(f"File {file_name} deleted successfully!")
    else:
        print(f"File {file_name} does not exist.")
except Exception as e:
    # Handle any exceptions that occur during file deletion
    print("An error occurred:", str(e))
```

## 5.3 Using pandas to\_csv() to save dataframe as CSV file

**<mark>Run the below cell only once</mark>**

```python
# Define the file path
path = r'C:\Users\HP\Downloads\\'
file_name = 'Power Plants'
file_path = f"{path}{file_name}.csv"

try:
    eia_powplt_filt.to_csv(f'{file_path}', index=False)
    print(f'CSV file {file_name}.csv is successfully saved')
except Exception as e:
    print(f"An error occurred while saving the CSV file: {e}")
```

# 6\. Read from CSV file

## 6.1 Using pandas

```python
# Define the file path
path = r'C:\Users\HP\Downloads\\'
file_name = 'Power Plants'
file_path = f"{path}{file_name}.csv"

try:
    df_var = pd.read_csv(filepath_or_buffer=f'{file_path}', delimiter=',')
    print(f'CSV file {file_name} is successfully read')
except Exception as e:
    print(f"An error occurred while reading the CSV file: {e}")
```

```python
df_var
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1718003024164/cbc6bc21-7814-471b-9f40-4275da802dae.png)

# Conclusion

Learning Objectives,

* Python & Pandas: Import libraries and use Pandas for data manipulation and analysis.
    
* Database Connectivity: Configuring database connections and creating engines with SQLAlchemy in Python.
    
* Data Ingestion: Ingesting data from NYC OpenData using Python requests and Pandas functions.
    
* SQL Operations: Perform CRUD operations and query data from SQL Server using Python.
    
* Data Visualization: Visualize data using Python libraries such as Matplotlib and Seaborn for insightful charts and graphs.
    

# Source: Self \[[Link](https://atlas.eia.gov/datasets/eia::power-plants/api)\], \[[Link](https://datahelpdesk.worldbank.org/knowledgebase/topics/125589-developer-information)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)