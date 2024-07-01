This article will demonstrate the data ingestion and exploration for Meteorite Landings dataset provided by NASA Open Data Portal.


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


### 2.1.6 Transfromations

##### 2.1.6.1 Renaming column

```python
nasa_ml_filt = nasa_ml.rename(columns={'mass': 'mass (g)', 'geolocation': 'GeoLocation'})
```

##### 2.1.6.2 Check isna() alias isnulls() , empty strings

* Viz 📉
    

```python
# Count the number of empty string rows for each column
df_var = nasa_ml_filt.isna().sum().to_frame().reset_index(names='Column names').rename(columns={0: 'isna row count'}).merge(nasa_ml_filt.eq('Aggregates').sum().to_frame().reset_index(names='Column names').rename(columns={0: 'Aggregates row count'})).merge(nasa_ml_filt.eq('').sum().to_frame().reset_index(names='Column names').rename(columns={0: 'empty string row count'}))

fig, axs = plt.subplots(1, 1, figsize=(25, 8))

sns.set_theme(style="darkgrid")

sns.barplot(
    data=df_var,
    x = 'Column names',
    y= 'isna row count',
    hue= 'isna row count',
    palette='Pastel1',
    ax=axs
)

# Move the hue legend for axs2 to the right middle
axs.legend(title='isna row count', bbox_to_anchor=(0.10, 0.93), loc='center right')

# Create the second y-axis for Aggregates row count
axs2 = axs.twinx()
sns.barplot(
    data=df_var,
    x = 'Column names',
    y= 'Aggregates row count',
    hue= 'Aggregates row count',
    palette='coolwarm',
    ax=axs2,
)

# Adjust the position of the spines for axs2
axs2.spines['right'].set_position(('outward', 60))

# Create the third y-axis for empty string row count
axs3 = axs.twinx()

sns.lineplot(
    data=df_var,
    x = 'Column names',
    y= 'empty string row count',
    ax=axs3,
)

# Adjust the position of the spines for axs3
axs3.spines['right'].set_position(('outward', 120))

# Get the current tick positions and labels
tick_positions = axs.get_xticks()
tick_labels = [label.get_text() for label in axs.get_xticklabels()]

# Set the tick positions and labels with rotation and Rotate x-axis labels by 90 degrees
axs.set_xticks(tick_positions)
axs.set_xticklabels(labels=tick_labels, rotation=90)


plt.title(label='isna(), Aggregates and empty string row count', loc='center')

axs.grid(False)
axs2.grid(False)
axs3.grid(False)

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717565473641/a29b5edf-5cb6-461f-a1e3-a12a67c121ab.png)

```python
nasa_ml_filt
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717565521618/bbed6dcb-0dfe-45a3-beec-2722cb5070be.png)

##### 2.1.6.3 Extract year using str.extract

```python
nasa_ml_filt['year'] = nasa_ml_filt['year'].str.extract(r'(\d{4})')
```

```python
nasa_ml_filt
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717587592786/f7acfecb-592d-4574-94e6-6e862714da25.png)

Error:

* OutOfBoundsDatetime: Out of bounds nanosecond timestamp: 1583-01-01T00:00:00.000, at position 174
    
* **OutOfBoundsDatetime**: Out of bounds nanosecond timestamp: 1583-01-01T00:00:00.000, at position 125. You might want to try: - passing `format` if your strings have a consistent format; - passing `format='ISO8601'` if your strings are all ISO8601 but not necessarily in exactly the same format; - passing `format='mixed'`, and the format will be inferred for each element individually. You might want to use `dayfirst` alongside this.

# Conclusion

Learning Objectives,

    

# Source: Self \[[Link](https://databank.worldbank.org/reports.aspx?source=2&series=NY.GDP.MKTP.CD&country=)\], \[[Link](https://datahelpdesk.worldbank.org/knowledgebase/topics/125589-developer-information)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)