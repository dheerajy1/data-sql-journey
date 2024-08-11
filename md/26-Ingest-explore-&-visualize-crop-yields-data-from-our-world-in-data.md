This article talks about the performing data ingesting, exploration, analysis and building data visualizations for crop yields across the world.


# 1\. Data Source

Data for

1. crop yields across the world. \[[**Link\]**](https://ourworldindata.org/explorers/crop-yields)

# **2\. Ingest Data**

```javascript
fetchUrl = async (targetUrl, typed = false) => {
  try {
    const response = await fetch(targetUrl);

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const contentType = response.headers.get("Content-Type");

    if (contentType?.startsWith("text/csv")) {
      const csvData = await response.text();
      if (typed) {
        return d3.csvParse(csvData, d3.autoType);
      }
      return d3.csvParse(csvData);
    } else if (contentType?.startsWith("application/json")) {
      const data = await response.json();
      if (typed) {
        return data.map(d3.autoType);
      }
      return data;
    } else if (contentType === null) {
      const csvData = await response.text();
      if (typed) {
        return d3.csvParse(csvData, d3.autoType);
      }
      return csvData;
    } else {
      throw new Error("Unsupported content type: ${contentType}");
    }
  } catch (error) {
    return `Error: ${error.message}`;
  }
};
```

Error:

- faced as issue where the content type is null, hence unable to determine the parsing type automatically, therefore placed a null condition. ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722878281242/cbb62094-2b23-4ef3-bf3e-a8ac1588893a.png)


![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722878111018/a860820f-0263-47c5-971a-67a7926b7c65.png)


# **3\. Explore Data**

## **3.1 Exploring country column data**

```javascript
CropYieldsCountryData = Array.from(
  d3.rollup(
    CropYieldsData,
    (v) => v.length,
    (d) => d.country
  ),
  ([key, value]) => ({ country: key, rows: value })
)
```

country viz js plot

```javascript
Plot.plot({
  width,
  marginBottom: 90,
  marks: [
    Plot.barY(CropYieldsCountryData, {
      x: "country",
      y: "rows",
      title: (d) => `${d.country}\nrows:${d.rows}`
    }),
    Plot.ruleY([0])
  ],
  x: {
    tickRotate: -45
  }
})
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722964201839/be03984a-9d2d-49ea-aef3-2a5fa818b57f.png)


filtering through the count of grouped country data

```javascript
viewof slicingRange = Inputs.range(
  [
    1,
    d3
      .groups(
        CropYieldsCountryData.map((obj) => obj.rows),
        (d) => d
      )
      .map(([, value]) => value[0]).length
  ],
  { step: 1, value: 0 }
)
```

plot code

```javascript
Plot.plot({
  width,
  marginBottom: 90,
  marks: [
    Plot.barY(
      CropYieldsCountryData.filter(
        (obj) =>
          obj.rows ===
          d3
            .groups(
              CropYieldsCountryData.map((obj) => obj.rows),
              (d) => d
            )
            .map(([, value]) => value[0])[slicingRange - 1]
      ),
      {
        x: "country",
        y: "rows",
        title: (d) => `${d.country}\nrows:${d.rows}`
      }
    ),
    Plot.ruleY([0])
  ],
  x: {
    tickRotate: -45
  }
})
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723046439103/36fe5d98-d621-46ae-9497-c6f0d5587eb9.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723046605285/305798e3-1605-4745-9336-7daed7aeca86.png)



Input select

```javascript
viewof CropName = Inputs.select(
  Object.keys(CropYieldsData[0]).filter((key) => key.includes("yield"))
)
```

and grouping

```javascript
Array.from(
  d3.rollup(
    CropYieldsData,
    (v) => v.length,
    (d) => d.country
  ),
  ([key, value]) => ({ country: key, rows: value })
)
```

and filtering:

```javascript
CropYieldsData.filter((obj) =>
  ["United States", "Italy", "Hungary", "Bulgaria"].includes(obj.country)
)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723135145048/5a7c7f19-e2fb-4d42-b288-d7f77387dada.png)


Multi select countries
default countries

```javascript
viewof Country = Inputs.table(countrydata, {
  value: countrydata.filter((obj, i) =>
    ["United States", "Italy", "Hungary", "Bulgaria"].includes(obj.country)
  ),
  width: 800,
  maxHeight: 200,
  multiple: true,
  required: false
})
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723217101782/a4ae9f3e-bb62-4053-a036-ae030895a93c.png)

# 3.2 Exploring year column data

```javascript
CropYearData = Array.from(
  d3.rollup(
    CropYieldsData,
    (v) => v.length,
    (d) => d.year
  ),
  ([key]) => key
)
  .sort((a, b) => a - b)
  .slice(90)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723390511392/a0b53970-744c-42bc-be42-e0b554fffc12.png)


# Crop Almond viz

```javascript
Plot.plot({
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(
      CropYieldsData.filter((obj) =>
        Country.map((obj) => obj.country).includes(obj.country)
      ),
      {
        x: "year",
        y: `${CropName}`,
        z: "country",
        title: (d) => `${d.year}\n${d.country}:${d[CropName]}`
      }
    )
  ]
})
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723306049254/abb96e7a-af57-4b4c-9e38-661b1f58c185.png)

# Conclusion

Learning Objectives,

1. Data Ingestion

2. Observable Notebook

# Source: Observablehq \[Link\]

# Author: Dheeraj. Yss

# Connect with me:

- [My Twitter](https://twitter.com/yssdheeraj)
- [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
- [My GitHub](https://github.com/dheerajy1)
- [My Hashnode](https://dheerajy1.hashnode.dev/)
