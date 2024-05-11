This article contains information about Economic Data Analysis Project with Python Pandas.

# Pull Economic Data

import lib and key

```python
import pandas as pd
import os
from fredapi import Fred

fred_api_key = os.environ.get('Fred_API_Key')
```

fred obj and auth api

```python
fred = Fred(api_key = fred_api_key)
```

search for economic data and order by

```python
sp_search = fred.search('S&P', order_by = 'popularity')
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714799892626/d4063afc-49bc-4dc9-9897-0c79281a89ea.png)

## Pull Raw Data & Plot

pass the id obtained

```python
sp500 = fred.get_series(series_id = 'sp500')
sp500
```

plot

```python
sp500.plot(figsize=(10,5), title = 'S&P 500', lw = 2)
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714815062252/6bc52022-f209-403a-833a-bad07be76fad.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715350251243/07ab1746-f315-4d0d-9a0f-96e7975dbd4d.png)

---
# Transformations

## Pull Multiple Data Series

```python
unemp_search_df = fred.search('unemployment rate state', filter = ('frequency', 'Monthly'))
unemp_search_df
```

filtering

```python
unemp_search_df_filtered = unemp_search_df.loc[
    (unemp_search_df['seasonal_adjustment'] == 'Seasonally Adjusted') &
    (unemp_search_df['units'] == 'Percent') &
    (unemp_search_df['title'].str.contains('Unemployment Rate'))
  ]
unemp_search_df_filtered
```

Filter the 'unemp\_search\_df\_filtered' dataframe to only include rows where the 'id' string length is less than 5:

```python
# Filter the 'unemp_search_df_filtered' dataframe to only include rows where the 'id' string length is less than 5
unemp_search_df_filtered_states = unemp_search_df_filtered.loc[
    unemp_search_df_filtered['id'].str.len() < 5
]

# Print the shape of the filtered dataframe to check the number of rows and columns
unemp_search_df_filtered_states.shape
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714832592574/a126d228-edc8-43ff-9956-e5c18f06157f.png)

```python
# Create an empty list to store all results
all_results = []

# Loop through each index in the filtered states dataframe
for myid in unemp_search_df_filtered_states.index:

    # Get the series for the current index from the fred API, convert it to a dataframe and name the column as the current index
    results = fred.get_series(myid).to_frame(name = myid)

    # Append the results dataframe to the all_results list
    all_results.append(results)

    # Pause execution for 0.1 seconds to avoid overwhelming the API with requests
    time.sleep(0.1)

# Concatenate all the dataframes in the all_results list into a single dataframe along the columns axis
unemp_states_df = pd.concat(all_results, axis = 1)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714834617100/ab014092-948e-4cee-9c2e-83d13f0d5a0a.png)

columns to drop:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714835218262/e492da99-e73a-417b-8a0d-331dcca5a282.png)

findings nulls and visualizing nulls distribution:

```python
unemp_states_df_filtered.isna().sum(axis = 1)
```

```python
unemp_states_df_filtered.isna().sum(axis = 1).plot()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714835864286/2c73088e-c843-4435-830a-7a3d6d7f91d2.png)

replacing the serices Id's with actual state name:

```python
id_to_state = unemp_search_df_filtered_states['title'].str.replace('Unemployment Rate in ','').to_dict()
unemp_states.columns = [id_to_state[c] for c in unemp_states.columns]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714887716740/62e6d9cd-36f3-43f8-bece-c1bd0d73c1ce.png)

# Conclusion

Learning Objectives,

1. Ingest data via API
    

# Source: Rob Mulla [\[Link\]](https://www.youtube.com/watch?v=R67XuYc9NQ4&list=LL&index=36)

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)