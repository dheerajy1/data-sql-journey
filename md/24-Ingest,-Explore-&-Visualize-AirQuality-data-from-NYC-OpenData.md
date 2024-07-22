This article will demonstrate the data ingestion & exploration and visualization for dataset AirQuality \[[<mark>NYC AQ</mark>](https://data.cityofnewyork.us/Environment/Air-Quality/c3uy-2p5r/about_data)\] provided by NYC OpenData.

# 1\. Data Source

Data for

1. nyc opendata airquality \[[Link](https://data.cityofnewyork.us/resource/c3uy-2p5r.csv)\]

# 2\. Ingest Data

```javascript
csvdata = (async () => {
  const response = await fetch(
    "https://data.cityofnewyork.us/resource/c3uy-2p5r.csv"
  );
  return await response.text();
})();
```

to parse

```javascript
airquality = d3.csvParse(csvdata);
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1721665184621/cac9859f-e4eb-4f16-a81a-a44ec5352255.png)

# Conclusion

Learning Objectives,

1. Observable Plot
2. Data Ingestion

# Source: NYC OpenData \[[Link](https://data.cityofnewyork.us/Environment/Air-Quality/c3uy-2p5r/about_data)\], Observablehq NoteBook \[Link\]

# Author: Dheeraj. Yss

# Connect with me:

- [My Twitter](https://twitter.com/yssdheeraj)
- [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
- [My GitHub](https://github.com/dheerajy1)
- [My Hashnode](https://dheerajy1.hashnode.dev/)
