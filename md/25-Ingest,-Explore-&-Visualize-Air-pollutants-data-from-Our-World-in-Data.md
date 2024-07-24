This article talks about the performing data analysis and building data visualizations for Air pollutants data from Our World in Data.


# 1\. Data Source

Data for

1. Air pollutants \[[**Link**\]](https://ourworldindata.org/explorers/air-pollution?time=1750..latest&uniformYAxis=0&Pollutant=All+pollutants&Sector=From+all+sectors+%28Total%29&Per+capita=false&country=USA~CHN~IND~GBR~OWID_WRL)
    

# **2\. Ingest Data**

File attachement.

# 3\. Explore Data

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1721844703820/9dad49b9-628f-4548-94ad-7d668f9f66c2.png align="center")

# 4\. Data transformations

```sql
SELECT COUNT(*) AS "Total_Rows"
FROM airPollution
```

# 5\. Visualize data

```xml
<div class="card" style="width:10%; margin-left:25rem; font-size:2rem;">
  <div  style="font-size:1rem;">
  TotalRows
</div>
${TotalRows[0].Total_Rows}
</div>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1721844843143/c0c0031b-a98c-4fe9-9103-63286f9525f2.png align="center")

# Conclusion

Learning Objectives,

1. Data Ingestion
    
2. Data Transformation
    
3. Observable Notebook
    
4. Data Visualization
    

# Source: Observablehq EIA \[[Link](https://observablehq.observablehq.cloud/framework-example-eia/)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)