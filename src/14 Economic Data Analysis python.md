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