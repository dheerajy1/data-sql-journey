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
);
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
      title: (d) => `${d.country}\nrows:${d.rows}`,
    }),
    Plot.ruleY([0]),
  ],
  x: {
    tickRotate: -45,
  },
});
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
        title: (d) => `${d.country}\nrows:${d.rows}`,
      }
    ),
    Plot.ruleY([0]),
  ],
  x: {
    tickRotate: -45,
  },
});
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
);
```

and filtering:

```javascript
CropYieldsData.filter((obj) =>
  ["United States", "Italy", "Hungary", "Bulgaria"].includes(obj.country)
);
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
  .slice(90);
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723390511392/a0b53970-744c-42bc-be42-e0b554fffc12.png)

# 4. Crop Almond viz

```javascript
Plot.plot({
  width,
  marginRight: 80,
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(CropYieldsData, {
      x: "year",
      y: `${CropName}`,
      z: "country",
      stroke: "country",
      title: (d) => `${d.year}\n${d.country}:${d[CropName]}`,
    }),
    Plot.text(
      CropYieldsData,
      Plot.selectLast({
        x: "year",
        y: `${CropName}`,
        z: "country",
        text: "country",
        textAnchor: "start",
        dx: -3,
        dy: 9,
      })
    ),
    Plot.ruleX(
      CropYieldsData,
      Plot.pointerX({ x: "year", py: `${CropName}`, stroke: "red" })
    ),
    Plot.dot(
      CropYieldsData,
      Plot.pointerX({ x: "year", y: `${CropName}`, stroke: "red" })
    ),
  ],
  color: { legend: true },
});
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723824393252/94ecd532-66f4-4bb3-8f2a-7a31536f9c8a.png)

# **5.** Crop Apples viz

```javascript
Plot.plot({
  width,
  marginRight: 80,
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(CropYieldsData, {
      x: "year",
      y: `${CropName}`,
      z: "country",
      stroke: "country",
      title: (d) => `${d.year}\n${d.country}:${d[CropName]}`,
    }),
    Plot.text(
      CropYieldsData,
      Plot.selectLast({
        x: "year",
        y: `${CropName}`,
        z: "country",
        text: "country",
        textAnchor: "start",
        dx: -3,
        dy: 9,
      })
    ),
    Plot.ruleX(
      CropYieldsData,
      Plot.pointerX({ x: "year", py: `${CropName}`, stroke: "red" })
    ),
    Plot.dot(
      CropYieldsData,
      Plot.pointerX({ x: "year", y: `${CropName}`, stroke: "red" })
    ),
  ],
  color: { legend: true },
});
```


![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723910593670/38790aa1-dcc1-4183-a068-2d44c024620f.png)

# 6\. bean yield viz

countries

```javascript
viewof Country = Inputs.table(countrydata, {
  value: countrydata.filter((obj, i) =>
    [
      "United States",
      "Italy",
      "Hungary",
      "Bulgaria",
      "Austria",
      "Romania",
      "Brazil"
    ].includes(obj.country)
  ),
  width: 800,
  maxHeight: 200,
  multiple: true,
  required: false
})
```

plot

```javascript
Plot.plot({
  width,
  marginRight: 80,
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(CropYieldsData, {
      x: "year",
      y: `${CropName}`,
      z: "country",
      stroke: "country",
      title: (d) => `${d.year}\n${d.country}:${d[CropName]}`
    }),
    Plot.text(
      CropYieldsData,
      Plot.selectLast({
        x: "year",
        y: `${CropName}`,
        z: "country",
        text: "country",
        textAnchor: "start",
        dx: -3,
        dy: 9
      })
    ),
    Plot.ruleX(
      CropYieldsData,
      Plot.pointerX({ x: "year", py: `${CropName}`, stroke: "red" })
    ),
    Plot.dot(
      CropYieldsData,
      Plot.pointerX({ x: "year", y: `${CropName}`, stroke: "red" })
    )
  ],
  color: { legend: true }
})
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1723996687009/89d2c6d4-f048-4290-9f47-53c38beee905.png)

adding card styling:

```xml
<div class="main-container" style=""> 
  <div class="card-svg-container" style="font-size:2rem;">
    
    <div class="svg-container">

      <svg class="svg1" viewBox="0 0 651 710" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g filter="url(#filter0_f_11_2)">
          <path d="M326.28 455.153C301.737 441.546 238.629 302.484 252.684 266.78C266.739 231.076 298.09 257.878 362.004 309.723C386.547 323.33 410.222 379.439 396.167 415.143C382.113 450.847 350.823 468.76 326.28 455.153Z" fill="url(#paint0_linear_11_2)" />
        </g>
        <defs>
          <filter id="filter0_f_11_2" x="0.665921" y="0.475006" width="649.706" height="709.232" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
            <feFlood flood-opacity="0" result="BackgroundImageFix" />
            <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
            <feGaussianBlur stdDeviation="100" result="effect1_foregroundBlur_11_2" />
          </filter>
          <linearGradient id="paint0_linear_11_2" x1="297.484" y1="418.282" x2="409.275" y2="401.649" gradientUnits="userSpaceOnUse">
            <stop stop-color="#3EF3C8" />
            <stop offset="1" stop-color="#3EF3C8" stop-opacity="0.5" />
          </linearGradient>
        </defs>
      </svg>
  
      <svg class="svg2" viewBox="0 0 428 459" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g filter="url(#filter0_f_1_9)">
          <path d="M211.76 251.893C252.437 257.839 284.97 364.837 287.558 295.009C290.145 225.18 259.215 147.128 218.538 141.183C177.861 135.238 142.84 203.651 140.253 273.479C137.665 343.308 171.082 245.948 211.76 251.893Z" fill="url(#paint0_linear_1_9)" />
        </g>
        <defs>
          <filter id="filter0_f_1_9" x="0.111717" y="0.821381" width="427.597" height="457.756" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
            <feFlood flood-opacity="0" result="BackgroundImageFix" />
            <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
            <feGaussianBlur stdDeviation="70" result="effect1_foregroundBlur_1_9" />
          </filter>
          <linearGradient id="paint0_linear_1_9" x1="142.448" y1="214.242" x2="290.347" y2="219.723" gradientUnits="userSpaceOnUse">
            <stop stop-color="#FFE924" />
            <stop offset="1" stop-color="#ECFF79" stop-opacity="0.32" />
          </linearGradient>
        </defs>
      </svg>
  
      <svg class="svg3" viewBox="0 0 465 408" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g filter="url(#filter0_f_1_11)">
          <path d="M131.708 242.056C147.41 133.679 218.698 131.25 252.379 143.583C257.225 132.578 277.604 117.172 320.348 143.583C341.429 160.09 350.806 159.976 351.969 225.549C353.132 291.122 320.953 311.69 304.718 313.777H202.584C172.416 335.027 116.006 350.434 131.708 242.056Z" fill="#DD8A8A" fill-opacity="0.79" />
        </g>
        <defs>
          <filter id="filter0_f_1_11" x="0" y="0" width="481" height="458" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
            <feFlood flood-opacity="0" result="BackgroundImageFix" />
            <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
            <feGaussianBlur stdDeviation="90" result="effect1_foregroundBlur_1_11" />
          </filter>
        </defs>
      </svg>

    </div>
    <div class="card" style="">
        ${(() => {
          return Plot.plot({
                })
  })()}
    </div>
  </div>
</div>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1724079896334/c057214a-1fa9-41c8-b2d9-e368dc63dc45.png)

# Conclusion

Learning Objectives,

1. Data Ingestion
    
2. Data Transformation
    
3. Observable Notebook
    
4. Data Visualization
    
5. Filter data
    
6. Vertical ruler
    
7. Text at end of line
    
8. Visualization
    
9. Improved scale units.

# Source: Observablehq \[Link\]

# Author: Dheeraj. Yss

# Connect with me:

- [My Twitter](https://twitter.com/yssdheeraj)
- [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
- [My GitHub](https://github.com/dheerajy1)
- [My Hashnode](https://dheerajy1.hashnode.dev/)
