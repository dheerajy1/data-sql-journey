This article will demonstrate the data ingestion and exploration for World Development Indicator datasets like World Bank Country & World Bank CO2 emissions (kt) & World Bank GDP & World Bank Life expectancy provided by The World Bank Open Data.

# The World Bank

World Bank Open Data

# <mark>10 june</mark>

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

# 2\. Ingest data from World Bank of ([<mark>World Development Indicators</mark>](https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators))

* [API Basic Call Structures](https://datahelpdesk.worldbank.org/knowledgebase/articles/898581-api-basic-call-structures)
    

## 2.1 [<mark>World Bank Country</mark>](https://datahelpdesk.worldbank.org/knowledgebase/articles/898590-country-api-queries) data

* Requesting Country Data to list all countries: The following information will appear, when available, in the response when using this country query through the World Bank API:
    
    * 3 letter ISO 3166-1 alpha-3 code
        
    * 2 letter ISO 3166-1 alpha-2 code
        
    * Name
        
    * Region: ID, name and World Bank 2 letter code
        
    * Income Level: ID, name and World Bank 2 letter code
        
    * Lending Type: ID, name and World Bank 2 letter code
        
    * Capital City
        
    * Longitude
        
    * Latitude
        

### 2.1.1 Url Connection setup

```python
wbctry_code_url = (
    f"http://api.worldbank.org/v2/country"
    f"?format=json"
    f"&per_page=50000"
)
```

### 2.1.2 using Get request to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
# Make the HTTP request.
response = requests.get(wbctry_code_url)

# Check the status of the request
if response.status_code == 200:
    raw_data = response.json()
    print("Request was successful.",response.headers['Content-Type'])
else:
    print(f"Request failed with status code: {response.status_code}")
```

* headers
    

```python
response.headers
```

* contents
    

```python
response.content
```

### 2.1.3 Exploring json response

```python
type(raw_data), len(raw_data)
```

```python
raw_data[0]
```

```python
raw_data[1][0]
```

```python
json_wbctry = copy.deepcopy(raw_data[1])
type(json_wbctry)
```

```python
len(json_wbctry)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717394938478/2e56c1e5-aa11-47e5-8df6-960cde40fe82.png)

```python
json_wbctry[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717394970799/8e031e66-10ad-4e6c-a7e8-5513179260c4.png)



# Conclusion

Learning Objectives,

- Python & Pandas: Import libraries and use Pandas for data manipulation and analysis.

- 
    

# Source: Self \[[Link](https://databank.worldbank.org/reports.aspx?source=2&series=NY.GDP.MKTP.CD&country=)\], \[[Link](https://datahelpdesk.worldbank.org/knowledgebase/topics/125589-developer-information)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)