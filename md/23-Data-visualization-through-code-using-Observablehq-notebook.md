In this article, the information & resources about learning Observable plot is included.

# **1\. Session 1: Introduction to Observable Plot**

## 1.1 Activity 1: Observable notebooks, and first weather chart in Observable Plot

```javascript
Plot.plot({
  marks: [
    Plot.cell(weather.slice(-365), {
      x: (d) => d.date.getUTCDate(),
      y: (d) =>
        new Date(
          d.date.getUTCFullYear(),
          d.date.getUTCMonth(),
          1
        ).toLocaleString("default", { month: "short" }),
      fill: "temp_max",
      sort: { y: "y", reverse: false },
    }),
  ],
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@158?cells=cellchart_weathe)\]

## 1.2 Activity 2: The grammar of graphics in Observable Plot

Uploaded the file us_energy.csv (with data from the US Energy Information Administration), and below we load it into the notebook as an array of objects named energy:

```javascript
energy = FileAttachment("us_energy.csv").csv({ typed: true });
```

The `energy` data contains different amounts of energy produced in the US, by source (`type`), over a range of years:

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@155?cells=table_energydata)\]

A new scatterplot, replacing the default variables with the year (x) and quadrillion_btu (y) from energy instead:

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@155?cells=scatterplot_energy)\]

## 1.3 Activity 3: Customization with marks, channels, and scales

Create a line chart of energy production over time

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@155?cells=linechart_energy)\]

## 1.4 Activity 4: A custom size and color scale

Create a scatterplot of flipper_length_mm and body_mass_g using the built-in penguins data

```javascript
scatterplot_penguins = Plot.plot({
  marks: [
    Plot.dot(penguins, {
      x: "body_mass_g",
      y: "flipper_length_mm",
      r: "flipper_length_mm",
      fill: "species",
      tip: true,
    }),
  ],
  r: {
    domain: d3.extent(penguins, (d) => d.flipper_length_mm),
    range: [1, 10],
  },
  color: {
    domain: ["Adelie", "Chinstrap", "Gentoo"],
    range: ["purple", "teal", "orange"],
  },
});
```

Note:

- Domain: what's going in.
- Range: what's going out.

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@156?cells=scatterplot_penguins)\]

# **2\. Session 2: Introduction to Observable Plot \[**[**Link**](https://observablehq.com/@observablehq/plot-session-2-follow-along)**\]**

_Scales, transforms, and more customization_

## 2.1 Data ingestion

- salamanders data:

upload file: mackCreekVertebrates.csv

- monoYearly data:

```javascript
import { monoYearly } from "@observablehq/keep-saving-mono-lake";
```

## 2.2 Activity 1: Plot essentials recap

```javascript
Plot.plot({
  marks: [
    Plot.frame(),
    Plot.dot(salamanders, {
      x: "totalLength",
      y: (d) => d.weight, // You can use functions instead of "variableName"!
      fill: "creekSection",
      opacity: 0.5,
      r: "totalLength",
      // sort: {channel: "fill"},
      tip: true,
    }),
  ],
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@260?cells=scatterplot_salamanders)\]

## 2.3 Activity 2: More fun with scales (and beyond)

Let's update the chart we made in Activity 1 in several ways:

- Convert the y-axis scale to "log" (then try some others, like "pow")
- Reverse the x-axis scale
- Update the x-axis domain
- Customize the color scheme
- Bonus: Add gridlines and labels!

```javascript
scatterplot_salamanders_v2 = Plot.plot({
  marks: [
    Plot.frame(),
    Plot.dot(salamanders, {
      x: "totalLength",
      y: (d) => d.weight,
      fill: "creekSection", // Later, switch to totalLength to see continuous custom scheme!
      opacity: 0.5,
      r: "totalLength",
      sort: { channel: "fill" },
      tip: true,
    }),
  ],
  x: { domain: [0, 400], ticks: 5, reverse: true },
  y: { type: "pow", exponent: 0.5, label: "weight" },
  color: { range: ["cyan", "purple"], legend: true },
  grid: true,
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@272?cells=scatterplot_salamanders_v2)\]

## 2.4 Activity 3: Bin transform for summary values over time

Again using the salamanders data, let's make a bar chart (thinking carefully about the mark, here)

- to visualize the change in _mean salamander length_ over different intervals of time (e.g. first for different years, then by different time spans).
- We'll do that from scratch using a combination of `Plot.rectY()` and `Plot.binX()`, customizing the interval option to reveal the mean over different bins of time (e.g. 1 year, 5 years, 10 years).

```javascript
barplot_salmanders = Plot.plot({
  marks: [
    Plot.rectY(
      salamanders,
      Plot.binX(
        { y: "mean" },
        { x: "date", y: "totalLength", interval: "5 years", tip: true }
      )
    ),
  ],
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@291?cells=barplot_salmanders)\]

- Then, we'll see how we can get up-and-running even more quickly by starting with the Chart cell, then converting to JavaScript to keep customizing!

Use chart: Quick plots without code

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@303?cells=chartQuick_salamanders)\]

Now, use convert to JavaScript suggestion.

```javascript
barplotGenra_salamanders = Plot.plot({
  color: { legend: true },
  marks: [
    Plot.rectY(
      salamanders,
      Plot.binX(
        { fill: "mean", y: "mean" },
        {
          x: "date",
          y: "totalLength",
          fill: "totalLength",
          tip: true,
          interval: "5 years",
        }
      )
    ),
    Plot.ruleY([0]),
  ],
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@306?cells=barplotGenra_salamanders)\]

## 2.5 Activity 4: Group transform for counts by reach

This time, let's start with the Chart cell to create a summary view of total counts of salamanders by creekSection.

Use chart: Quick plots without code

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@323?cells=chartQuick_salamandersv2)\]

- Then we'll check out the JavaScript code (which you could also write by hand!).

```javascript
barplotGenra_salamandersv2 = Plot.plot({
  marks: [
    Plot.barX(
      salamanders,
      Plot.groupY(
        { x: "count" },
        { y: "creekSection", tip: true, fill: "reach" }
      )
    ),
    Plot.ruleX([0]),
  ],
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@322?cells=barplotGenra_salamandersv2)\]

## 2.6 Activity 5: Normalize transform

There are _many_ more built-in transforms in Observable Plot. Let's wrap the day with a transform that normalizes values to some basis (e.g. the first value, mean value, max value, or something else!). We'll use more transforms in future sessions, too!

For this activity, we'll use a different dataset on lake levels for Mono Lake, California — a saline lake supporting a rich and diverse ecosystem, which saw its levels drop drastically after water started being diverted to Los Angeles in the early 1940s.

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@349?cells=Datatable_monoYearlydata)\]

We'll start by creating a line graph, then normalize to different basis..es?

```javascript
Plot.plot({
  marks: [
    Plot.line(
      monoYearly,
      Plot.normalizeY({ x: "year", y: "volume", basis: "first" })
    ), // Try mean, min, last,!
  ],
  marginLeft: 60,
  x: { tickFormat: "" },
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@360?cells=lineplot_monoYearly)\]

another line plot

```javascript
lineplot_monoYearlyv2 = Plot.plot({
  marks: [
    Plot.line(monoYearly, Plot.normalizeY("first", { x: "year", y: "lake" })),
  ],
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@367?cells=lineplot_monoYearlyv2)\]

# 3\. Session 3: Introduction to Observable Plot \[[Link](https://observablehq.com/@observablehq/plot-session-3-code-key)\]

_More customization: faceting, annotation, a map, and introducing Inputs for interactivity_

## 3.1 Activity 1: Warm-up (and add faceting!)

**Data:** The World Bank Open Data

```javascript
Plot.plot({
  marks: [
    Plot.frame(),
    Plot.dot(worldbank, {
      filter: (d) => d.year == 2010,
      x: "gdp",
      y: "co2",
      fill: "#ccc",
      r: "life_exp",
      opacity: 0.7,
    }),
    Plot.dot(worldbank, {
      filter: (d) => d.year == 2010,
      x: "gdp",
      y: "co2",
      fill: "life_exp",
      r: "life_exp",
      opacity: 0.7,
      tip: true,
      fy: "income_group",
    }),
  ],
  x: { type: "log", label: "GDP (USD)" },
  y: { type: "log", label: "CO2 Emissions" },
  fy: {
    label: "Income group",
    domain: [
      "Not classified",
      "Low income",
      "Lower middle income",
      "Upper middle income",
      "High income",
    ],
    reverse: true,
  },
  color: { legend: true, label: "Life expectancy (years)" },
  r: { domain: d3.extent(worldbank, (d) => d.life_exp), range: [1, 10] },
  marginRight: 150,
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@510?cells=scatterplot_incgrfact)\]

## 3.2 Activity 2: Customization continued - Annotation and transforms continued (select, window)

Here, we have an existing line chart of stock market closing prices ($, USD) for three companies (AAPL, GOOG (Alphabet), and TSLA).

We will update the chart with some annotations, facets, and by adding a window transform to show a noise-reduced version of the trends for each

```javascript
lineplot_stocksv2 = // Calculates (by default a rolling mean, using the current value as the middle of the window). Can also update to "start" or "end" for leading or trailing windows! Add `strict` to avoid noisy tails (from incomplete windows at series endpoints)
  Plot.plot({
    marks: [
      Plot.lineY(stocks, {
        x: "Date",
        y: "Close",
        stroke: "symbol",
        opacity: 0.3,
        tip: true,
      }),
      Plot.lineY(
        stocks,
        Plot.windowY(
          { k: 50, anchor: "middle", reduce: "mean", strict: true },
          { x: "Date", y: "Close", stroke: "symbol" }
        )
      ),
      Plot.text(
        stocks,
        Plot.selectLast({
          x: "Date",
          y: "Close",
          text: "symbol",
          fill: "symbol",
          textAnchor: "start",
          dx: 5,
          dy: -9, // Use the getDy function to set the dy value
          fontSize: 15,
        })
      ),
      Plot.tip([`Oct 27, 2022: Elon Musk becomes Twitter CEO`], {
        x: new Date("2022-10-27"),
        y: 250,
        anchor: "bottom-left",
      }),
    ],
    color: { legend: true, range: ["teal", "navy", "orange"] },
    x: {
      domain: [new Date("2019-01-01"), new Date("2024-06-04")],
    },
    y: {
      domain: [0, 400],
      label: "Closing Price (USD)",
    },
    marginRight: 100,
  });
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@511?cells=lineplot_stocks)\]

(Below is the final version that we'll make in the course, starting from the base plot above):

## 3.3 Activity 3: A map with Plot.geo

**Data:** The Meteoritical Society (published by NASA and [accessed from](https://catalog.data.gov/dataset/meteorite-landings)[Data.gov](http://Data.gov))

import { land } from "@observablehq/plot-live-earthquake-map"

```javascript
scatter_geoplot_meteorites = Plot.plot({
  projection: "equal-earth",
  marks: [
    Plot.graticule(),
    Plot.geo(land, {
      fill: "#ccc",
    }),
    Plot.dot(meteorites, {
      x: "reclong",
      y: "reclat",
      r: "mass (g)",
      fill: "purple",
      opacity: 0.5,
      tip: true,
    }),
  ],
  r: { range: [1, 10] },
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@637?cells=scatter_geoplot_meteorites)\]

## 3.4 Activity 4: A taste of Inputs for interactivity

First, let's look at a partially built example and make an existing chart interactive!

```javascript
viewof pickColor = Inputs.color({label: "Favorite color", value: "#4682b4"})
```

```javascript
scatterplot_cars = Plot.plot({
  marks: [
    Plot.dot(cars, {
      x: "power (hp)",
      y: "economy (mpg)",
      tip: true,
      fill: pickColor,
    }),
  ],
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@657?cells=scatterplot_cars)\]

```javascript
viewof pickWindow = Inputs.range([2, 90], {label: "Amount", step: 1})
```

```javascript
lineplot_stocksv3 = Plot.plot({
  marks: [
    Plot.lineY(stocks, {
      x: "Date",
      y: "Close",
      stroke: "symbol",
      opacity: 0.3,
    }),
    Plot.lineY(
      stocks,
      Plot.windowY(
        { k: pickWindow, anchor: "middle", reduce: "mean", strict: true },
        { x: "Date", y: "Close", stroke: "symbol" }
      )
    ),
  ],
  color: { legend: true, range: ["teal", "navy", "orange"] },
  x: {
    domain: [new Date("2019-01-01"), new Date("2024-06-04")],
  },
  y: {
    domain: [0, 400],
    label: "Closing Price (USD)",
  },
});
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@663?cells=lineplot_stocksv3)\]


# 4\. Session 4: Introduction to Observable Plot \[[Link](https://observablehq.com/@observablehq/plot-session-4-code-key)\]

Interactivity

## 4.1 Activity 1: Crosshairs and pointer transform

**Data:** The World Bank DataBank

```javascript
wb2010 = wb.filter(d => d.year == 2010)
```

```javascript
Plot.plot({
  marks: [
    Plot.dot(wb2010, { x: "gdp", y: "life_exp", fill: "gray" }),
    Plot.dot(
      wb2010,
      Plot.pointer({
        x: "gdp",
        y: "life_exp",
        fill: "red",
        r: 8,
        opacity: 0.6,
        tip: true,
        title: (d) => `${d.country_name}`
      })
    ),
    Plot.crosshair(wb2010, {
      x: "gdp",
      y: "life_exp",
      textFill: "red",
      textStroke: "white",
      strokeWidth: 3
    })
  ],
  x: { type: "log" },
  margin: 50
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@698?cells=scatterplot_wb2010)\]

## 4.2 Activity 2: Custom tooltips

Three quick ways to customize your tooltips!

* Add more channels
    
* Formatting and style
    
* Tip mark for static annotations
    

```javascript
scatterplot_stocksv1 = Plot.plot({
  marks: [
    Plot.lineY(stocks, {
      x: "Date",
      y: "Close",
      stroke: "symbol",
      tip: true,
      channels: {
        Open: "Open"
      }
    }),
    Plot.tip(
      stocks,
      Plot.selectMaxY({
        x: "Date",
        y: "Close",
        stroke: "symbol",
        anchor: "right",
        fill: "yellow"
      })
    ) // Static annotation!
  ],
  x: {
    domain: [new Date("2019-01-01"), new Date("2024-06-04")]
  },
  y: {
    domain: [0, 400],
    label: "Closing Price (USD)"
  },
  color: { legend: true }
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@727?cells=scatterplot_stocksv1)\]



## 4.3 Activity 3: Dropdown and slider

Add a dropdown widget to select region, and a slider to select year:

```javascript
viewof selectRegion = Inputs.select(wb.map(d => d.region), {label: "Select region:", unique: true})
```

Update the chart below so that:

* It only shows observations for countries in the selected region
    
* Only observations *at or below* the selected year are visible
    
* Observations at the selected year are opaque, but all previous are more transparent
    

```javascript
Plot.plot({
  marks: [
    Plot.dot(wb, {
      filter: (d) => d.region == selectRegion && d.year <= pickYear,
      x: "gdp",
      y: "co2",
      fill: "country_name",
      r: "gdp",
      opacity: d => d.year == pickYear ? 1 : 0.2
    })
  ],
  x: { type: "log" },
  y: { type: "log" },
  r: { range: [3, 20] }
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@772?cells=scatterplot_wbv1)\]

## 4.4 Activity 4: Input form with checkbox and radio

**Data:**[US Energy Information Administration US Energy Atlas](https://atlas.eia.gov/datasets/eia::power-plants/about)

US power plant data:

The chart below compares data for the selected primary source, and across the selected states in the checkbox input.

After adding database, click hide (eye icon) to hide the output if you want.

US spatial data:

```javascript
us = FileAttachment("us-counties-10m.json").json()
```

Access state polygons:

```javascript
states = topojson.feature(us, us.objects.states)
```

Select states to compare:

```javascript
viewof pickStates = Inputs.checkbox(plants.map(d => d.state).sort(), {label: "Select states to compare:", unique: true, value: ["Alabama", "Alaska", "Arizona"]})
```

Select primary source:

```javascript
viewof pickSource = Inputs.radio(plants.map(d => d.primary_source), {label: "Select primary source:", unique: true, value: "oil"})
```

The chart below compares data for the selected primary source, and across the selected states in the checkbox input.

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@773?cells=barplot_plants)\]


---

# Conclusion

1. Learning Objectives,

2. Created Observable notebook

3. Explore weather sample data

4. Created Observable plot

5. slicing data

6. date parsing

7. Plot marks

8. Bins

9. Group transf

10. Interactivity

11. Plot.geo

12. faceting

13. Crosshairs and pointer

14. Custom tooltips


# Source: Observablehq \[[Link](https://www.youtube.com/watch?v=tHorkp-WCQY&list=PLOHIJAFwtkEevglMLsR9wBnXpPK3QY_Go)\] \[[Link](https://observablehq.com/@observablehq/plot-session-1-code-key)\]

# Author: Dheeraj. Yss

# Connect with me:

- [My Twitter](https://twitter.com/yssdheeraj)
- [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
- [My GitHub](https://github.com/dheerajy1)
