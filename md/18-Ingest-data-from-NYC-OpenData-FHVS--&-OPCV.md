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



# Conclusion

Learning Objectives,

- Python & Pandas: Import libraries and use Pandas for data manipulation and analysis.

- Data Ingestion: Ingesting data from NYC OpenData using Python requests and Pandas functions.


# Source: Meghan Maloy \[[Link](https://www.youtube.com/watch?v=tqk9RL8FEGU&list=LL&index=3)\], \[[Link](https://2024.open-data.nyc/event/intro-to-sql/)\], \[[Link](https://drive.google.com/drive/folders/1Z39aC3sypkBhphlX_YyW04HjxdBlddGv)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)
