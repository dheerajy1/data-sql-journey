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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714799892626/d4063afc-49bc-4dc9-9897-0c79281a89ea.png align="center")

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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714815062252/6bc52022-f209-403a-833a-bad07be76fad.png align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715350251243/07ab1746-f315-4d0d-9a0f-96e7975dbd4d.png align="center")


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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714832592574/a126d228-edc8-43ff-9956-e5c18f06157f.png align="center")

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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714834617100/ab014092-948e-4cee-9c2e-83d13f0d5a0a.png align="center")

columns to drop:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714835218262/e492da99-e73a-417b-8a0d-331dcca5a282.png align="center")

findings nulls and visualizing nulls distribution:

```python
unemp_states_df_filtered.isna().sum(axis = 1)
```

```python
unemp_states_df_filtered.isna().sum(axis = 1).plot()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714835864286/2c73088e-c843-4435-830a-7a3d6d7f91d2.png align="center")

replacing the serices Id's with actual state name:

```python
id_to_state = unemp_search_df_filtered_states['title'].str.replace('Unemployment Rate in ','').to_dict()
unemp_states.columns = [id_to_state[c] for c in unemp_states.columns]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714887716740/62e6d9cd-36f3-43f8-bece-c1bd0d73c1ce.png align="center")


## Pull May2020 Unemployment Rate Per State

```python
# Select rows from the 'unemp_states' DataFrame where the index is '2020-05-01'
# Transpose the DataFrame and sort the values based on '2020-05-01'
unemp_states_May20 = unemp_states.loc[
    unemp_states.index == '2020-05-01'
].T.sort_values('2020-05-01')

# Plot the DataFrame as a horizontal bar chart with specified figure size, bar width, edge color, and title
unemp_states_May20 = unemp_states_May20.plot(kind = 'barh', figsize = (8,12), width = 0.7, edgecolor = 'black', title = 'Unemployment Rate by State, May 2020')

# Remove the legend from the plot
unemp_states_May20.legend().remove()

# Set the label for the x-axis to '% Unemployed'
unemp_states_May20.set_xlabel('% Unemployed')

# Display the plot
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714892808648/0611195a-e9e2-4103-94fb-098da0a59b96.png align="center")

## Pull Participation Rate

```python
# Search for 'participation rate state' in the 'fred' data source. 
# Filter results to only include those with a 'Monthly' frequency.
part_search = fred.search('participation rate state', filter = ('frequency', 'Monthly'))

# Display the search results
part_search
```

Filter

```python
# Filter the 'part_search' DataFrame based on two conditions:
# 1. The 'seasonal_adjustment' column should be 'Seasonally Adjusted'
# 2. The 'units' column should be 'Percent'
part_filtered = part_search.loc[
    (part_search['seasonal_adjustment'] == 'Seasonally Adjusted') &
    (part_search['units'] == 'Percent')
]

# Display the filtered DataFrame
part_filtered
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714894424358/3f32162a-8384-4029-b6cf-17c27a8499c6.png align="center")

Get data for each series ID

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714895120557/ed8aa4de-a709-42e4-8d7d-4379a11f6ac7.png align="center")

concatenate using pd

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714898715226/d17adab5-9dc4-4713-a570-82818403c64b.png align="center")

columns to drop:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714899057247/89f59e8b-620b-4ccc-b7c5-18d0de31a6e0.png align="center")

Now swap id with actual state name:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714900133153/643d4aaf-632a-41a0-93fc-db36cd6dbe5d.png align="center")

---

## Unemployment vs Participation for each state!

```python
unemp_states.query('index >= 2020 and index < 2022')['New York'].plot()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714901933653/2b6443ec-6682-4632-bb3c-62e71dede52c.png align="center")

```python
fig, ax = plt.subplots()

unemp_states.query('index >= 2020 and index < 2022')['New York'].plot(ax = ax)
part_states_filter_colsw.query('index >= 2020 and index < 2022')['New York'].plot(ax = ax)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714902054601/2d73d89e-5c4b-4f2a-9edb-cc7b5117be05.png align="center")

for any state:

```python
state = 'California'

fig, ax = plt.subplots(figsize = (10,5), sharex = True)

ax2 = ax.twinx()

unemp_states2 = unemp_states.asfreq('MS')

l1 = unemp_states2.query('index >= 2020 and index < 2022')[state] \
    .plot(ax = ax, label = 'Unemployement', color = '#F3CA52')

l2 = part_states_filter_colsw.dropna().query('index >= 2020 and index <2022')[state] \
    .plot(ax = ax2, label = 'Participation', color = '#0A6847')

ax2.grid(False)
ax.set_title(state)
fig.legend(labels = ['Unemployement', 'Participation'])
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714904223537/9bc68445-488b-4aed-928e-e153a1dd5ab5.png align="center")

for all states:

```python
# Create a 10x5 grid of subplots with a shared x-axis, and set the figure size to 30x30
fig, axs = plt.subplots(10, 5, figsize = (30,30), sharex = True)

# Flatten the array of axes (subplots) for easier iteration
axs = axs.flatten()

# Initialize a counter variable
i = 0

# Loop over each column (state) in the unemp_states dataframe
for state in unemp_states.columns:
    # Skip the iteration if the state is 'District of Columbia' or 'Puerto Rico'
    if state in ['District of Columbia','Puerto Rico']:
        continue

    # Create a secondary y-axis for the i-th subplot
    ax2 = axs[i].twinx()

    # Plot the unemployment data for the current state on the i-th subplot's primary y-axis
    unemp_states2.query('index >= 2020 and index < 2022')[state] \
    .plot(ax = axs[i], label = 'Unemployement', color = '#10439F')
    
    # Plot the participation data for the current state on the i-th subplot's secondary y-axis
    part_states_filter_colsw.query('index >= 2020 and index <2022')[state] \
    .plot(ax = ax2, label = 'Participation', color = '#FC4100')

    # Disable the grid for the secondary y-axis
    ax2.grid(False)

    # Set the title of the i-th subplot to the current state
    axs[i].set_title(state)

    # Increment the counter variable
    i += 1

# Adjust the padding between and around the subplots
plt.tight_layout()

# Add a legend to the figure with the labels 'Unemployement' and 'Participation'
fig.legend(labels = ['Unemployement', 'Participation'])


# Display the figure with its subplots
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714905416183/41e1b809-2a00-4345-8505-8a14ef17281d.png align="center")

# Conclusion

Learning Objectives,

1. Ingest data via API
    
2. Pull May2020 Unemployment Rate Per State, Pull Participation Rate, Filter
    
3. Get data for each series ID
    
4. concatenate using pd
    
5. Apply transformations in Pandas
    
6. Build visualizations using matplotlib.pyplot
    

# Source: Rob Mulla YT\[[Link](https://www.youtube.com/watch?v=R67XuYc9NQ4&list=LL&index=36)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)