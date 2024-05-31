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



# Conclusion

Learning Objectives,

- Python & Pandas: Import libraries and use Pandas for data manipulation and analysis.

- Data Ingestion: Ingesting data from NYC OpenData using Python requests and Pandas functions.

- using pandas read_json()

- Transforming dataframe


# Source: Meghan Maloy \[[Link](https://www.youtube.com/watch?v=tqk9RL8FEGU&list=LL&index=3)\], \[[Link](https://2024.open-data.nyc/event/intro-to-sql/)\], \[[Link](https://drive.google.com/drive/folders/1Z39aC3sypkBhphlX_YyW04HjxdBlddGv)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)
