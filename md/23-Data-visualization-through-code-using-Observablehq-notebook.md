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
      sort: { y: "y", reverse: false }
    })
  ]
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@158?cells=cellchart_weathe)\]


## 1.2 Activity 2: The grammar of graphics in Observable Plot

Uploaded the file us\_energy.csv (with data from the US Energy Information Administration), and below we load it into the notebook as an array of objects named energy:

```javascript
energy = FileAttachment("us_energy.csv").csv({ typed: true })
```

The `energy` data contains different amounts of energy produced in the US, by source (`type`), over a range of years:

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@155?cells=table_energydata)\]

A new scatterplot, replacing the default variables with the year (x) and quadrillion\_btu (y) from energy instead:

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@155?cells=scatterplot_energy)\]


## 1.3 Activity 3: Customization with marks, channels, and scales

Create a line chart of energy production over time


\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@155?cells=linechart_energy)\]

## 1.4 Activity 4: A custom size and color scale

Create a scatterplot of flipper\_length\_mm and body\_mass\_g using the built-in penguins data

```javascript
scatterplot_penguins = Plot.plot({
  marks: [
    Plot.dot(penguins, {
      x: "body_mass_g",
      y: "flipper_length_mm",
      r: "flipper_length_mm",
      fill: "species",
      tip: true
    })
  ],
  r: {
    domain: d3.extent(penguins, (d) => d.flipper_length_mm),
    range: [1, 10]
  },
  color: {
    domain: ["Adelie", "Chinstrap", "Gentoo"],
    range: ["purple", "teal", "orange"]
  }
})
```

Note:

* Domain: what's going in.
    
* Range: what's going out.
    


\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@156?cells=scatterplot_penguins)\]

# **2\. Session 2: Introduction to Observable Plot \[**[**Link**](https://observablehq.com/@observablehq/plot-session-2-follow-along)**\]**

*Scales, transforms, and more customization*

## 2.1 Data ingestion

* salamanders data:
    

upload file: mackCreekVertebrates.csv

* monoYearly data:
    

```javascript
import { monoYearly } from "@observablehq/keep-saving-mono-lake"
```

## 2.2 Activity 1: Plot essentials recap

```javascript
Plot.plot({
  marks: [
    Plot.frame(),
    Plot.dot(salamanders, {
      x: "totalLength",
      y: d => d.weight, // You can use functions instead of "variableName"!
      fill: "creekSection",
      opacity: 0.5,
      r: "totalLength",
      // sort: {channel: "fill"},
      tip: true
    })
  ]
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@260?cells=scatterplot_salamanders)\]

## 2.3 Activity 2: More fun with scales (and beyond)

Let's update the chart we made in Activity 1 in several ways:

* Convert the y-axis scale to "log" (then try some others, like "pow")
    
* Reverse the x-axis scale
    
* Update the x-axis domain
    
* Customize the color scheme
    
* Bonus: Add gridlines and labels!
    

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
      tip: true
    })
  ],
  x: { domain: [0, 400], ticks: 5, reverse: true },
  y: { type: "pow", exponent: 0.5, label: "weight" },
  color: { range: ["cyan", "purple"], legend: true },
  grid: true
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@272?cells=scatterplot_salamanders_v2)\]

## 2.4 Activity 3: Bin transform for summary values over time

Again using the salamanders data, let's make a bar chart (thinking carefully about the mark, here)

* to visualize the change in *mean salamander length* over different intervals of time (e.g. first for different years, then by different time spans).
    
* We'll do that from scratch using a combination of `Plot.rectY()` and `Plot.binX()`, customizing the interval option to reveal the mean over different bins of time (e.g. 1 year, 5 years, 10 years).
    

```javascript
barplot_salmanders = Plot.plot({
  marks: [
    Plot.rectY(
      salamanders,
      Plot.binX(
        { y: "mean" },
        { x: "date", y: "totalLength", interval: "5 years", tip: true }
      )
    )
  ]
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@291?cells=barplot_salmanders)\]


* Then, we'll see how we can get up-and-running even more quickly by starting with the Chart cell, then converting to JavaScript to keep customizing!
    

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
          interval: "5 years"
        }
      )
    ),
    Plot.ruleY([0])
  ]
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@306?cells=barplotGenra_salamanders)\]

## 2.5 Activity 4: Group transform for counts by reach

This time, let's start with the Chart cell to create a summary view of total counts of salamanders by creekSection.

Use chart: Quick plots without code

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@323?cells=chartQuick_salamandersv2)\]

* Then we'll check out the JavaScript code (which you could also write by hand!).
    

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
    Plot.ruleX([0])
  ]
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@322?cells=barplotGenra_salamandersv2)\]

## 2.6 Activity 5: Normalize transform

There are *many* more built-in transforms in Observable Plot. Let's wrap the day with a transform that normalizes values to some basis (e.g. the first value, mean value, max value, or something else!). We'll use more transforms in future sessions, too!

For this activity, we'll use a different dataset on lake levels for Mono Lake, California — a saline lake supporting a rich and diverse ecosystem, which saw its levels drop drastically after water started being diverted to Los Angeles in the early 1940s.

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@349?cells=Datatable_monoYearlydata)\]

We'll start by creating a line graph, then normalize to different basis..es?

```javascript
Plot.plot({
  marks: [
    Plot.line(
      monoYearly,
      Plot.normalizeY({ x: "year", y: "volume", basis: "first" })
    ) // Try mean, min, last,!
  ],
  marginLeft: 60,
  x: { tickFormat: "" }
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@360?cells=lineplot_monoYearly)\]

another line plot

```javascript
lineplot_monoYearlyv2 = Plot.plot({
  marks: [
    Plot.line(monoYearly, Plot.normalizeY("first", { x: "year", y: "lake" }))
  ]
})
```

\[[Plot Link](https://observablehq.com/embed/c14eafd65a30fc4d@367?cells=lineplot_monoYearlyv2)\]

# Conclusion

Learning Objectives,

1. Created Observable notebook
    
2. Explored weather sample data
    
3. Created Observable plot

4. slicing data

5. date parsing
    

# Source: Observablehq \[[Link](https://www.youtube.com/watch?v=tHorkp-WCQY&list=PLOHIJAFwtkEevglMLsR9wBnXpPK3QY_Go)\] \[[Link](https://observablehq.com/@observablehq/plot-session-1-code-key)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)