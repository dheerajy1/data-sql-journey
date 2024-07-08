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

# Conclusion

Learning Objectives,



# Source: Self \[[Link](https://atlas.eia.gov/datasets/eia::power-plants/api)\], \[[Link](https://datahelpdesk.worldbank.org/knowledgebase/topics/125589-developer-information)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)