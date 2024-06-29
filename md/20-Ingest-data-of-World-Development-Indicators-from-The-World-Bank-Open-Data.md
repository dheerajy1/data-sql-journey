This article will demonstrate the data ingestion and exploration for World Development Indicator datasets like World Bank Country & World Bank CO2 emissions (kt) & World Bank GDP & World Bank Life expectancy provided by The World Bank Open Data.

# The World Bank

World Bank Open Data

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


### 2.1.4 Destructuring json response

```python
destrc_json_wbctry = []

for ctry in json_wbctry:
    
    # Destructuring nested objects and sorting the keys
    destrc_json = {f"{k}_{nested_k}": nested_v.strip() for k, v in ctry.items() if isinstance(v, dict) for nested_k, nested_v in v.items()}
    srt_destrc_json = {k: destrc_json[k] for k in sorted(destrc_json.keys())}

    # Adding the main key to the destructured objects
    srt_destrc_json.update({k: v for k, v in ctry.items() if not isinstance(v, dict)})
    destrc_json_wbctry.append(srt_destrc_json)
```

```python
destrc_json_wbctry
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717395015163/9695f67b-defd-4ee1-a02d-550cb36f12e0.png)

### 2.1.5 Use pandas DataFrame to convert the JSON data:

```python
wbctry = pd.DataFrame(data=destrc_json_wbctry)[[
    'id',
    'iso2Code',
    'name',
    'region_id',
    'region_iso2code',
    'region_value',
    'adminregion_id',
    'adminregion_iso2code',
    'adminregion_value',
    'incomeLevel_id',
    'incomeLevel_iso2code',
    'incomeLevel_value',
    'lendingType_id',
    'lendingType_iso2code',
    'lendingType_value',
    'capitalCity',
    'longitude',
    'latitude',
]]
wbctry.dtypes, wbctry.shape
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717395042020/6c2f73bb-de57-48ef-ac02-2e6469df3722.png)

```python
wbctry
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717395068673/dd234abb-6f6b-4dd6-9602-f8671e98bdd8.png)

### 2.1.6 Transfromations

##### 2.1.6.1 Renaming column

```python
wbctry_filt = wbctry.rename(columns={'id': 'iso2Code', 'iso2Code': 'id'})
```

##### 2.1.6.2 Filtering data

```python
wbctry_filt.loc[wbctry_filt['incomeLevel_value'] != 'Aggregates'].reset_index(drop=True, inplace=True)
```

#### 2.1.6.2 Rearranging

```python
wbctry_filt = wbctry_filt[[
    'id',
    'iso2Code',
    'name',
    'region_id',
    'region_iso2code',
    'region_value',
    'adminregion_id',
    'adminregion_iso2code',
    'adminregion_value',
    'incomeLevel_id',
    'incomeLevel_iso2code',
    'incomeLevel_value',
    'lendingType_id',
    'lendingType_iso2code',
    'lendingType_value',
    'capitalCity',
    'longitude',
    'latitude',
]].copy()
```
![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717395831182/fe4fbf01-3fcd-473a-a905-0bf273313e4c.png)


## 2.2 Finding source Id

### 2.2.1 Url Connection setup

```python
wbsrc_code_url = (
    f"https://api.worldbank.org/v2/sources"
    f"?format=json"
    f"&per_page=50000"
)
```

### 2.2.2 using Get request to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
# Make the HTTP request.
response = requests.get(wbsrc_code_url)

# Check the status of the request
if response.status_code == 200:
    raw_data = response.json()
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

### 2.2.3 Exploring json response

```python
type(raw_data), len(raw_data)
```

```python
raw_data[0]
```

```python
json_wbsrc = copy.deepcopy(raw_data[1])
type(json_wbsrc)
```

```python
json_wbsrc
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717395354124/fa17f67f-1b17-4b98-84a0-6907ff63169b.png)

### 2.2.4 Use pandas DataFrame to convert the JSON data:

```python
wbsrc = pd.DataFrame(data=json_wbsrc)
wbsrc.dtypes, wbsrc.shape
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717395390903/e1947c1c-8718-4319-90bf-7db1d55cdad0.png)

```python
wbsrc
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717395414522/da9e0521-272e-4ea1-aeae-7552127b9061.png)

### 2.2.5 Get Source Id for a Database

```python
wdi_srcid = wbsrc.loc[
    wbsrc['name'].str.contains('World Development Indicators', case=False),
    'id'
].to_string(index=False)
wdi_srcid
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717395543666/bd589d3f-8d2f-49e8-9373-3b534e488bcd.png)

---

## 2.3 [<mark>World Bank CO2 emissions (kt)</mark>](https://datahelpdesk.worldbank.org/knowledgebase/articles/898599-indicator-api-queries)

### 2.3.1 Finding indicator Id

#### 2.3.1.1 Url Connection setup

```python
schkeywrd = 'CO2'

wbindicaco_code_url = (
    f"https://api.worldbank.org/v2"
    f"/sources"
    f"/{wdi_srcid}"
    f"/search"
    f"/{schkeywrd}"
    f"?format=json"
    f"&per_page=20000"
)
```

#### 2.3.1.2 using Get request to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
# Make the HTTP request.
response = requests.get(wbindicaco_code_url)

# Check the status of the request
if response.status_code == 200:
    raw_data = response.json()
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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717396061270/44db1cb4-17ac-4c29-8e71-709f812270bc.png)


#### 2.3.1.3 Exploring json response

```python
type(raw_data), len(raw_data)
```

```python
raw_data
```

```python
raw_data.keys()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397350113/88432bad-17a1-43a7-8421-6ec328bc56e7.png)

```python
type(raw_data['source']), len(raw_data['source'])
```

```python
raw_data['source'][0]['concept'][0]['variable']
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397453699/0148d9c1-8c0c-4a98-804c-c6bf7db604cb.png)

```python
json_wbindicaco = copy.deepcopy(raw_data['source'][0]['concept'][0]['variable'])
type(json_wbindicaco)
```

```python
json_wbindicaco[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397480850/28ab91a3-ef21-44b1-b588-ed8dc05b8f5d.png)

#### 2.3.1.4 Destructuring json response

```python
destrc_json_wbindicaco = []

for indica in json_wbindicaco:
    destrc_json = {}

    for k, v in indica.items():
        if isinstance(v, list):
            for i, nested_v in enumerate(v):
                for nested_k, nested_val in nested_v.items():
                    destrc_json[f"{k}_{i}_{nested_k}"] = nested_val
        else:
            destrc_json[k] = v

    destrc_json_wbindicaco.append(destrc_json)
```

```python
destrc_json_wbindicaco
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397537520/facbaead-03be-48f5-9d30-5e5769493b51.png)



#### 2.3.1.5 Use pandas DataFrame to convert the JSON data:

```python
wbindicaco = pd.DataFrame(data=destrc_json_wbindicaco)
wbindicaco.dtypes, wbindicaco.shape
```

#### 2.3.1.6 changing the data type

```python
wbindicaco['metatype_1_value'] = wbindicaco['metatype_1_value'].astype(str)
```

```python
wbindicaco
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397625721/08572be4-e005-4bbc-9d06-80ecb67cc6a1.png)

#### 2.3.1.7 Get indicator Id

```python
coindicaid = wbindicaco.loc[
    wbindicaco['metatype_1_value'].str.contains(r'CO2 emissions \(kt\)', case=False),
    'id'
].to_string(index=False)
coindicaid
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397703643/2dc1d248-f3a1-4e1a-9ffd-11dddf39187a.png)

### 2.3.2 CO2 emissions (kt) data

#### 2.3.2.1 Url Connection setup

```python
wbcoemi_code_url = (
    f"http://api.worldbank.org/v2"
    f"/country"
    f"/all"
    f"/indicator"
    f"/{coindicaid}"
    f"?format=json"
    f"&per_page=20000"
)
```

#### 2.3.2.2 using Get request to ingest from url:

```python
# Make the HTTP request.
response = requests.get(wbcoemi_code_url)

# Check the status of the request
if response.status_code == 200:
    raw_data = response.json()
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

#### 2.3.2.3 Exploring json response

```python
type(raw_data), len(raw_data)
```

```python
raw_data[0]
```

```python
json_wbcoemi = copy.deepcopy(raw_data[1])
type(json_wbcoemi)
```

```python
json_wbcoemi[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397808996/2235576a-43cc-4303-96b0-d546d46eaf41.png)

#### 2.3.2.4 Destructuring json response

```python
destrc_json_wbcoemi = []

for coemi in json_wbcoemi:
    destrc_json = {}
    
    for k, v in coemi.items():
        if isinstance(v, dict):
            for nested_k, nested_v in v.items():
                destrc_json[f'{k}_{nested_k}'] = nested_v
        else:
            destrc_json[k] = v
    destrc_json_wbcoemi.append(destrc_json)
```

```python
destrc_json_wbcoemi
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397859121/dcf7eced-2240-4820-ae39-a0900544c90c.png)

#### 2.3.2.5 Use pandas DataFrame to convert the JSON data:

```python
wbcoemi = pd.DataFrame(data=destrc_json_wbcoemi)
wbcoemi.dtypes, wbcoemi.shape
```

```python
wbcoemi
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397895573/444598c0-ebce-4af1-b4d4-1518533827d0.png)

#### 2.3.2.6 Transformations

##### 2.3.2.6.1 Renaming column

```python
wbcoemi_trnsfmtn = wbcoemi.rename(columns={'date': 'year'}).add_prefix('co2_') #, 'value': 'co2_value'
```

##### 2.3.2.6.2 Sorting

```python
wbcoemi_trnsfmtn.sort_values(['co2_country_value', 'co2_year'], ascending=[True, True], inplace=True)
wbcoemi_trnsfmtn.reset_index(drop=True, inplace=True)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717397966682/84a1640f-ddfd-4bea-a98e-75a639b734f3.png)

## 2.4 [<mark>World Bank GDP</mark>](https://datahelpdesk.worldbank.org/knowledgebase/articles/898599-indicator-api-queries) data

### 2.4.1 Finding indicator Id

#### 2.4.1.1 Url Connection setup

```python
schkeywrd = 'GDP'

wbindicagdp_code_url = (
    f"https://api.worldbank.org/v2"
    f"/sources"
    f"/{wdi_srcid}"
    f"/search"
    f"/{schkeywrd}"
    f"?format=json"
    f"&per_page=20000"
)
```

#### 2.4.1.2 using Get request to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
# Make the HTTP request.
response = requests.get(wbindicagdp_code_url)

# Check the status of the request
if response.status_code == 200:
    raw_data = response.json()
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

#### 2.4.1.3 Exploring json response

```python
type(raw_data), len(raw_data)
```

```python
raw_data
```

```python
raw_data.keys()
```

```python
type(raw_data['source']), len(raw_data['source'])
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717398600685/4555d46b-2fed-4f2c-9a3a-941f663e670b.png)

```python
raw_data['source'][0]['concept'][0]['variable']
```

```python
json_wbindicagdp = copy.deepcopy(raw_data['source'][0]['concept'][0]['variable'])
type(json_wbindicagdp)
```

```python
json_wbindicagdp[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717398761184/89d53e2a-7b15-46ab-9501-7a3da7e62d8c.png)

#### 2.4.1.4 Destructuring json response

```python
destrc_json_wbindicagdp = []

for indica in json_wbindicagdp:
    destrc_json = {}

    for k, v in indica.items():
        if isinstance(v, list):
            for i, nested_v in enumerate(v):
                for nested_k, nested_val in nested_v.items():
                    destrc_json[f"{k}_{i}_{nested_k}"] = nested_val
        else:
            destrc_json[k] = v

    destrc_json_wbindicagdp.append(destrc_json)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717398819836/b1510b0c-c25d-419e-8280-e28752ab4b70.png)


#### 2.4.1.5 Use pandas DataFrame to convert the JSON data:

```python
wbindicagdp = pd.DataFrame(data=destrc_json_wbindicagdp)
wbindicagdp.dtypes, wbindicagdp.shape
```

#### 2.4.1.6 changing the data type

```python
wbindicagdp['metatype_0_value'] = wbindicagdp['metatype_0_value'].astype(str)
```

```python
wbindicagdp
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717398879722/3729d715-6e09-47e1-b7f8-0a88dfd346df.png)

#### 2.4.1.7 Get indicator Id

```python
gdpindicaid = wbindicagdp.loc[
    wbindicagdp['metatype_0_value'].str.contains(r'GDP \(current US\$\)', case=False),
    'id'
].to_string(index=False)
gdpindicaid
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717398940826/28b6a578-d002-4e3c-b719-0c2230eb859f.png)


### 2.4.2 GDP per capita (current US$) data

#### 2.4.2.1 Url Connection setup

```python
wbgdp_code_url = (
    f"http://api.worldbank.org/v2"
    f"/country"
    f"/all"
    f"/indicator"
    f"/{gdpindicaid}"
    f"?format=json"
    f"&per_page=20000"
)
```

#### 2.4.2.2 using Get request to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
# Make the HTTP request.
response = requests.get(wbgdp_code_url)

# Check the status of the request
if response.status_code == 200:
    raw_data = response.json()
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

#### 2.4.2.3 Exploring json response

```python
type(raw_data), len(raw_data)
```

```python
raw_data[0]
```

```python
json_wbgdp = copy.deepcopy(raw_data[1])
type(json_wbgdp)
```

```python
json_wbgdp[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399064761/a2faa66a-2665-4863-9485-742b546b945e.png)

#### 2.4.2.4 Destructuring json response

```python
destrc_json_wbgdp = []

for gdp in json_wbgdp:
    destrc_json = {}
    
    for k, v in gdp.items():
        if isinstance(v, dict):
            for nested_k, nested_v in v.items():
                destrc_json[f'{k}_{nested_k}'] = nested_v
        else:
            destrc_json[k] = v
    destrc_json_wbgdp.append(destrc_json)
```

```python
destrc_json_wbgdp
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399109962/69a044e6-305a-4684-9d55-fc40f3f5d791.png)


#### 2.4.2.5 Use pandas DataFrame to convert the JSON data:

```python
wbgdp = pd.DataFrame(data=destrc_json_wbgdp)
wbgdp.dtypes, wbgdp.shape
```

```python
wbgdp
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399169645/b51cb8b6-bcb2-423a-b813-a186998a061e.png)

#### 2.4.2.6 Transformations

##### 2.4.2.6.1 Renaming column

```python
wbgdp_trnsfmtn = wbgdp.rename(columns={'date': 'year'}).add_prefix('gdp_')#, 'value': 'gdp_value'
```

##### 2.4.2.6.2 Sorting

```python
wbgdp_trnsfmtn.sort_values(['gdp_country_value', 'gdp_year'], ascending=[True, True], inplace=True)
wbgdp_trnsfmtn.reset_index(drop=True, inplace=True)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399246090/de6a8c6e-ef33-4d9d-94a9-6b5a21de847a.png)


## 2.5 [<mark>World Bank Life expectancy</mark>](https://datahelpdesk.worldbank.org/knowledgebase/articles/898599-indicator-api-queries) data

### 2.5.1 Finding indicator Id

#### 2.5.1.1 Url Connection setup

```python
schkeywrd = 'Life expectancy at birth'

wbindicale_code_url = (
    f"https://api.worldbank.org/v2"
    f"/sources"
    f"/{wdi_srcid}"
    f"/search"
    f"/{schkeywrd}"
    f"?format=json"
    f"&per_page=20000"
)
```

#### 2.5.1.2 using Get request to ingest from url:

**<mark>Run the below cell only once</mark>**

```python
# Make the HTTP request.
response = requests.get(wbindicale_code_url)

# Check the status of the request
if response.status_code == 200:
    raw_data = response.json()
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

#### 2.5.1.3 Exploring json response

```python
type(raw_data), len(raw_data)
```

```python
raw_data
```

```python
raw_data.keys()
```

```python
type(raw_data['source']), len(raw_data['source'])
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399380863/d3da85d8-438a-4400-9d70-8b2da1dbfe7d.png

```python
raw_data['source'][0]['concept'][0]['variable']
```

```python
json_wbindicale = copy.deepcopy(raw_data['source'][0]['concept'][0]['variable'])
type(json_wbindicale)
```

```python
json_wbindicale[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399419222/bfdc3cd0-b46a-43b9-85c7-9a0ca6366bd2.png

#### 2.5.1.4 Destructuring json response

```python
destrc_json_wbindicale = []

for indica in json_wbindicale:
    destrc_json = {}

    for k, v in indica.items():
        if isinstance(v, list):
            for i, nested_v in enumerate(v):
                for nested_k, nested_val in nested_v.items():
                    destrc_json[f"{k}_{i}_{nested_k}"] = nested_val
        else:
            destrc_json[k] = v

    destrc_json_wbindicale.append(destrc_json)
```

```python
destrc_json_wbindicale
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399491210/069663b9-c65b-4506-b25a-e5eb74b0f68d.png


#### 2.5.1.5 Use pandas DataFrame to convert the JSON data:

```python
wbindicale = pd.DataFrame(data=destrc_json_wbindicale)
wbindicale.dtypes, wbindicale.shape
```

#### 2.5.1.6 changing the data type

```python
wbindicale['metatype_1_value'] = wbindicale['metatype_1_value'].astype(str)
```

```python
wbindicale
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399564207/f6de5fe7-7041-42fc-8f52-3fafb3a9521b.png)

#### 2.5.1.7 Get indicator Id

```python
leindicaid = wbindicale.loc[
    wbindicale['metatype_1_value'].str.contains(r'Life expectancy at birth, total \(years\)', case=False),
    'id'
].to_string(index=False)
leindicaid
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399613499/ad464499-6d4f-46bf-a05f-b54e98f93d2f.png)



### 2.5.2 Life expectancy at birth, total (years) data

#### 2.5.2.1 Url Connection setup

```python
wble_code_url = (
    f"http://api.worldbank.org/v2"
    f"/country"
    f"/all"
    f"/indicator"
    f"/{leindicaid}"
    f"?format=json"
    f"&per_page=20000"
)
```

#### 2.5.2.2 using Get request to ingest from url:

```python
# Make the HTTP request.
response = requests.get(wble_code_url)

# Check the status of the request
if response.status_code == 200:
    raw_data = response.json()
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

#### 2.5.2.3 Exploring json response

```python
type(raw_data), len(raw_data)
```

```python
raw_data[0]
```

```python
json_wble = copy.deepcopy(raw_data[1])
type(json_wble)
```

```python
json_wble[0]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399698344/48d4f945-104a-409d-8233-557ec5f80798.png)

#### 2.5.2.4 Destructuring json response

```python
destrc_json_wble = []

for le in json_wble:
    destrc_json = {}
    
    for k, v in le.items():
        if isinstance(v, dict):
            for nested_k, nested_v in v.items():
                destrc_json[f'{k}_{nested_k}'] = nested_v
        else:
            destrc_json[k] = v
    destrc_json_wble.append(destrc_json)
```

```python
destrc_json_wble
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399742442/b2b58f87-13ff-4bf5-9f80-3301aa84cc2a.png)


#### 2.5.2.5 Use pandas DataFrame to convert the JSON data:

```python
wble = pd.DataFrame(data=destrc_json_wble)
wble.dtypes, wble.shape
```

```python
wble
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399776015/c58aca30-6ee3-47f1-8dd2-0d5e7b43e045.png)

#### 2.5.2.6 Transformations

##### 2.5.2.6.1 Renaming column

```python
wble_trnsfmtn = wble.rename(columns={'date': 'year'}).add_prefix('life_exp_')#, 'value': 'life_exp_value'
```

##### 2.5.2.6.2 Sorting

```python
wble_trnsfmtn.sort_values(['life_exp_country_value', 'life_exp_year'], ascending=[True, True], inplace=True)
wble_trnsfmtn.reset_index(drop=True, inplace=True)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717399827297/1b81e167-fdcd-4901-a22f-ef8cd8bdd6a5.png)

# 3\. Merge all Dataframes

## 3.1 Countries dataframe

```python
wbctry_filt = wbctry_filt[['iso2Code', 'name', 'region_value', 'incomeLevel_value']]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400002240/f8f70b69-d586-4893-8200-0a901d995d24.png)

```python
wbctry_filt.dtypes
```

## 3.2 CO2 emissions dataframe

```python
wbcoemi_trnsfmtn = wbcoemi_trnsfmtn[['co2_countryiso3code', 'co2_year', 'co2_value']]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400029576/8b15ca05-8c38-4ea1-ac80-936784cd1e97.png)

```python
wbcoemi_trnsfmtn.dtypes
```

## 3.3 GDP dataframe

```python
wbgdp_trnsfmtn = wbgdp_trnsfmtn[['gdp_countryiso3code', 'gdp_year', 'gdp_value']]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400062430/5f0d0cea-586d-4e84-a78c-edc0c062b6e5.png)

```python
wbgdp_trnsfmtn.dtypes
```

## 3.4 Life expectancy dataframe

```python
wble_trnsfmtn = wble_trnsfmtn[['life_exp_countryiso3code', 'life_exp_year', 'life_exp_value']]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400087173/cb723b19-7736-48af-ae59-b39ed4f4979f.png)

```python
wble_trnsfmtn.dtypes
```

## 3.5 Merging

```python
wb_df = wbctry_filt.merge(wbcoemi_trnsfmtn, left_on=["iso2Code"], right_on=["co2_countryiso3code"], how="right")[['iso2Code','name', 'region_value', 'incomeLevel_value', 'co2_year', 'co2_value']]
wb_df = wb_df.merge(wbgdp_trnsfmtn, left_on=["iso2Code","co2_year"], right_on=["gdp_countryiso3code", "gdp_year"], how="right")[['iso2Code','name', 'region_value', 'incomeLevel_value', 'co2_year', 'co2_value', 'gdp_value']]
wb_df = wb_df.merge(wble_trnsfmtn, left_on=["iso2Code","co2_year"], right_on=["life_exp_countryiso3code", "life_exp_year"], how="right")[['iso2Code','name', 'region_value', 'incomeLevel_value', 'co2_year', 'co2_value', 'gdp_value', 'life_exp_value']]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400131519/c0a55ec1-8c5a-4300-ba55-2def2b0a1581.png)

## 3.6 Renaming column names

```python
wb_df.rename(columns={'iso2Code': 'country_code','name': 'country_name', 'region_value': 'region', 'incomeLevel_value': 'income_group', 'co2_year': 'year', 'co2_value': 'co2', 'gdp_value': 'gdp', 'life_exp_value': 'life_exp'}, inplace=True)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400159365/f9798f45-4ed0-4234-949d-d6f0060ae7fc.png)

## 3.7 Rearranging columns

```python
wb_df = wb_df[[
    'country_name',
    'country_code',
    'year',
    'co2',
    'gdp',
    'life_exp',
    'income_group',
    'region',
]].copy()
```

```python
wb_df
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400186108/1e8046fb-d04e-4fb8-94f4-b058e039adef.png)



# 4\. Store final dataframe in SQL Server

## 4.1 Configuring Database connection setup

### 4.1.1 Check the driver

```python
pyodbc.drivers()
```

### 4.1.2. Configure the connection string

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

### 4.1.3. Create an engine using the create\_engine() function, specifying the database URL

```python
engine = create_engine(connection_url)
```

### 4.1.4 Create a session using sessionmaker

* only run this if you are not using pandas read sql query or to sql i.e if you want to perform DDL or DML oprations:
    

```python
Session = sessionmaker(bind=engine)
session = Session()
```

## 4.2 Read the existing tables in the SQL Server Database

### 4.2.1 Using Pandas read\_sql\_query() method - DQL: Select

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
table_name = 'World bank tidy'

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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400318584/a56be331-7d1b-4730-8669-78e92aa6c14b.png)

### 4.2.2 Using sqlalchemy Session() method - DDL: DROP

* Drop table if n only if exists
    

**<mark>Caution: Below is a DROP SQL statement</mark>**

```python
# Define the DROP SQL statement

table_name = 'World bank tidy'
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

## 4.3 Send the ingested data in dataframes to SQL Server tables

## 4.3.1 Using Pandas to\_sql() method - DDL: Create

**<mark>Run the below cell only once</mark>**

```python
table_name = 'World bank tidy'

wb_df.to_sql(table_name, engine, if_exists='replace', index=False)
```

# 5\. Query the data from SQL table

* Read from your database Using Pandas read\_sql\_query() method - DQL: Select
    

```python
sql_string = """
  SELECT 
    *
  FROM [dballpurpose].[dbo].[World bank tidy]
"""

df_var = pd.read_sql(sql_string, engine)
df_var
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400435677/42e7c7bd-fdfa-47c5-aac3-2269220077b3.png)

* Viz 📉
    

```python
df_var = df_var.dropna().groupby(['year', 'income_group']).agg({'co2': 'sum', 'life_exp': 'mean'})

fig, axs = plt.subplots(1, 1, figsize=(25, 8))

sns.set_theme(style="darkgrid")

sns.barplot(
    data=df_var,
    x= 'year',
    y = 'co2',
    hue = 'income_group',
    palette = 'Pastel1',
    ax=axs
)

# Get the current tick positions and labels
tick_positions = axs.get_xticks()
tick_labels = [label.get_text() for label in axs.get_xticklabels()]

# Set the tick positions and labels with rotation and Rotate x-axis labels by 90 degrees
axs.set_xticks(tick_positions)
axs.set_xticklabels(labels=tick_labels, rotation=90)

# Get the current tick positions and labels
tick_positions = axs.get_yticks()
tick_labels = [f'{int(tick/1e6)} PPM' for tick in tick_positions]  # Custom labels in parts per millions

# Set the tick positions and labels
axs.set_yticks(tick_positions)
axs.set_yticklabels(labels=tick_labels)

plt.title(label='Worlds CO2 emission by year', loc='center')

plt.ylabel('CO2 Emissions (PPM)')

plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400458115/2ad72cf3-39b2-43f3-9af7-9197fdd6f121.png)

# 6\. Save wb\_df as CSV file

## 6.1 Check file if exists

```python
os.getcwd()
```

```python
# Define the file path
path = r'nnnn'
file_name = 'wb_tidy'

os.chdir(f'{path}')

csv_files = [file for file in os.listdir() if file.endswith('.csv')]

if any(file_name in file for file in csv_files):
    print(f'Found a file with {file_name} in the name.')
else:
    print(f'No {file_name} in any file name.')
```

## 6.2 Remove file if exists

```python
# Define the file path
path = r'nnnn'
file_name = 'wb_tidy'
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

## 6.3 Using pandas to\_csv() to save dataframe as CSV file

**<mark>Run the below cell only once</mark>**

```python
# Define the file path
path = r'nnnn'
file_name = 'wb_tidy'
file_path = f"{path}{file_name}.csv"

try:
    wb_df.to_csv(f'{file_path}', index=False)
    print(f'CSV file {file_name}.csv is successfully saved')
except Exception as e:
    print(f"An error occurred while saving the CSV file: {e}")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400659378/8aada421-0015-45a1-94fc-cde6b4b53c25.png)

# 7\. Read from CSV file

## 7.1 Using pandas

```python
# Define the file path
path = r'C:\Users\HP\Downloads\\'
file_name = 'wb_tidy'
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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1717400689855/529ae85e-2a14-425b-819e-e37821b5b961.png)

# Conclusion

Learning Objectives,

* Python & Pandas: Import libraries and use Pandas for data manipulation and analysis.
    
* Database Connectivity: Configuring database connections and creating engines with SQLAlchemy in Python.
    
* Data Ingestion: Ingesting data from NYC OpenData using Python requests and Pandas functions.
    
* SQL Operations: Perform CRUD operations and query data from SQL Server using Python.
    
* Data Visualization: Visualize data using Python libraries such as Matplotlib and Seaborn for insightful charts and graphs.

Extended Learning Objectives,

- Python & Pandas: Import libraries and use Pandas for data manipulation and analysis.

- Destructuring json response
- pandas DataFrame to convert the JSON data
- Transfromations: 
    - Renaming column, 
    - Filtering data,
    - Rearranging
- Finding source Id
- using Get request to ingest from url
- Exploring json response
- Merge all Dataframes
- Transformations   
    - Renaming column names   
    - Rearranging columns
- Merging Datafrmaes
- Using sqlalchemy Session() - DDL: DROP
- Using Pandas to_sql() - DDL: Create
- Using Pandas read_sql_query() - DQL: Select
- Data visualization seaborn lib

# Source: Self \[[Link](https://databank.worldbank.org/reports.aspx?source=2&series=NY.GDP.MKTP.CD&country=)\], \[[Link](https://datahelpdesk.worldbank.org/knowledgebase/topics/125589-developer-information)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)