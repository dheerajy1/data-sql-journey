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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1721844843143/c0c0031b-a98c-4fe9-9103-63286f9525f2.png)

## 5.2 Nitrogen oxide (NOx) trend

```javascript
Plot.plot({
  marks: [
    Plot.ruleY([0]),
    Plot.ruleX(airPollution, {
      x: "Year",
      y: "Nitrogen oxide (NOx)",
      tip: true,
    }),
  ],
  width,
  marginBottom: 60,
  marginLeft: 60,
});
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1721924783854/b4aa218f-42c5-401f-a8c7-d8d03581445d.png)



## 5.3 Nitrogen oxide (NOx) trend for selective countries

```javascript
<div class="card" style="width:95%; height:100%; font-size:2rem;">
  ${(() => {
    const data = airPollution.filter((d) =>
      ["United Kingdom", "United States", "India", "China", "World"].includes(
        d.Entity
      )
    );

    return Plot.plot({
      marks: [
        Plot.line(data, {
          x: "Year",
          y: "Nitrogen oxide (NOx)",
          z: "Entity",
          stroke: "Entity",
          tip: true
        }),
        Plot.ruleX(
          data,
          Plot.pointerX({
            x: "Year",
            py: "Nitrogen oxide (NOx)",
            z: "Entity",
            stroke: "red"
          })
        ),
        Plot.dot(
          data,
          Plot.pointerX({
            x: "Year",
            y: "Nitrogen oxide (NOx)",
            z: "Entity",
            stroke: "red"
          })
        ),
        Plot.text(
          data,
          Plot.selectLast({
            x: "Year",
            y: "Nitrogen oxide (NOx)",
            z: "Entity",
            text: "Entity",
            textAnchor: "start",
            dx: -3,
            dy: 9
          })
        )
      ],
      y: {
        type: "linear",
        grid: true,
        nice: true
      },
      color: {
        scheme: "spectral",
        legend: true
      },
      title: "NOx Trend",
      width,
      marginLeft: 70
    });
  })()}
</div>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722009979949/f1ee5f1b-3a43-464d-8063-27fe57e16f58.png)




# Conclusion

Learning Objectives,

1. Data Ingestion
2. Data Transformation
3. Observable Notebook
4. Data Visualization

- filter data
- vertical ruler
- text at end of line
- Visualization
- filter data
- vertical ruler
- text at end of line
- Visualization
- improved scale units.

# Source: Observablehq EIA \[[Link](https://observablehq.observablehq.cloud/framework-example-eia/)\]

# Author: Dheeraj. Yss

# Connect with me:

- [My Twitter](https://twitter.com/yssdheeraj)
- [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
- [My GitHub](https://github.com/dheerajy1)
- [My Hashnode](https://dheerajy1.hashnode.dev/)
