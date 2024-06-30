This article will demonstrate the data ingestion and exploration for Meteorite Landings dataset provided by NASA Open Data Portal.

# <mark>30 june</mark>

# NASA

Open Data Portal

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

# 2\. Ingest data from NASA of ([<mark>Meteorite Landings</mark>](https://catalog.data.gov/dataset/meteorite-landings))

* This comprehensive data set from The Meteoritical Society contains information on all of the known meteorite landings.
    

## 2.1 [<mark>Meteorite Landings</mark>](https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh/about_data) data

### 2.1.1 Url Connection setup

```python
# get data from open data endpoints
limit = 100000

nasa_meteorland_url = (
    f"https://data.nasa.gov/resource/gh4g-9sfh.json"
    f"?$limit={limit}"
)
```

### 2.1.2 using Get request to ingest from url:

```python
# Make the HTTP request.
response = requests.get(nasa_meteorland_url)

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
json_nasa_ml = copy.deepcopy(raw_data)
type(json_nasa_ml), len(json_nasa_ml)
```

```python
json_nasa_ml[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717565031980/0a5a47c5-66b0-4bc1-bb15-ee07f8e03741.png)

### 2.1.4 Destructuring json response

```python
destrc_json_nasa_ml = []

for meteor in json_nasa_ml:
    destrc_json = {}
    for k, v in meteor.items():
        if isinstance(v, dict):
            nested_values = tuple(v.values())
            destrc_json[k] = nested_values
        else:
            destrc_json[k] = v
    destrc_json_nasa_ml.append(destrc_json)
```

```python
destrc_json_nasa_ml
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717565104415/3466a91f-d167-4048-a320-bc462968f521.png)

### 2.1.5 Use pandas DataFrame to convert the JSON data:

```python
nasa_ml = pd.DataFrame(data=destrc_json_nasa_ml)
nasa_ml.dtypes, nasa_ml.shape
```

```python
nasa_ml
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717565398133/66fe644a-a413-48c3-aa76-27fd050dcb6a.png)



# Conclusion

Learning Objectives,

    

# Source: Self \[[Link](https://databank.worldbank.org/reports.aspx?source=2&series=NY.GDP.MKTP.CD&country=)\], \[[Link](https://datahelpdesk.worldbank.org/knowledgebase/topics/125589-developer-information)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)