This article mentions how to ingest and transform wheat data obtained from US DA NAAS.

# <mark>5 june</mark>

# United States Department of Agriculture (US DA)

National Agricultural Statistics Service (NAAS)

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
import seaborn as sns
import matplotlib.pyplot as plt

# Set the display option to show all max column width
pd.set_option('display.max_colwidth', None)

# Set the display option to show all columns
pd.set_option('display.max_columns', None)
```

# 2\. Ingest data of records of wheat commodities with ([<mark>US DA NAAS</mark>](https://quickstats.nass.usda.gov/))

* Returns a set of records with data for wheat Commodity with the corresponding Commodity data:
    

## 2.1 USDA NAAS Connection setup

```python
source_desc = 'CENSUS' #Program
sector_desc = 'CROPS' #Sector
group_desc = 'FIELD CROPS' #Group
commodity_desc = 'WHEAT' #Commodity
statisticcat_desc = 'PRODUCTION' #Category
agg_level_desc = 'STATE' #Geographic Level

cmdt_code_url = (
    f"https://quickstats.nass.usda.gov/api/api_GET/?"
    f"key={API_Key}"
    f"&source_desc={source_desc}"
    f"&sector_desc={sector_desc}"
    f"&group_desc={group_desc}"
    f"&commodity_desc={commodity_desc}"
    f"&statisticcat_desc={statisticcat_desc}"
    f"&agg_level_desc={agg_level_desc}"
    "&format=json"
)
```

## 2.2 using Get request to ingest from url:

```python
# Make the HTTP request.
response = requests.get(cmdt_code_url)

# Check the status of the request
if response.status_code == 200:
    json_whtcmdt = response.json()
    print("Request was successful.",response.headers['Content-Type'])
    display(Markdown("- headers"))
    print(response.headers)
    display(Markdown("- contents"))
    print(response.content)
else:
    print(f"Request failed with status code: {response.status_code}")
```

## 2.3 Destructuring json response

```python
raw_data = json_whtcmdt['data']
type(raw_data)
```

```python
raw_data[0]
```

## 2.4 Use pandas DataFrame to convert the JSON data:

```python
whtcmdt = pd.DataFrame(data=raw_data)
whtcmdt.dtypes, whtcmdt.shape
```

* NASS may suppress individual table cells by explicitly replacing the cell value with an indicator identifying a suppression. NASS uses a (D), in place of the actual number in the affected cells, to indicate the value is withheld to avoid disclosure of an individual operation. [USDA NASS Data Lab Handbook](https://www.nass.usda.gov/Data_and_Statistics/Special_Tabulations/PSM-CS-02-Attachment-A-Handbook.pdf)
    

```python
whtcmdt
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716748167770/f181a90c-4f5e-4050-9c41-c5c7e78b4d49.png align="center")




# Conclusion

Learning Objectives,

- Ingest data of records of wheat commodities

- Destructuring json response

- Use pandas DataFrame to convert the JSON data



# Source: US DA NAAS \[[Link](https://www.nass.usda.gov/index.php)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)