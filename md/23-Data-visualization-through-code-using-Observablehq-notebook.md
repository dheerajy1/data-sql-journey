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

<iframe width="100%" height="426" src="https://observablehq.com/embed/c14eafd65a30fc4d@158?cells=cellchart_weather"></iframe>


## 1.2 Activity 2: The grammar of graphics in Observable Plot

Uploaded the file us\_energy.csv (with data from the US Energy Information Administration), and below we load it into the notebook as an array of objects named energy:

```javascript
energy = FileAttachment("us_energy.csv").csv({ typed: true })
```

The `energy` data contains different amounts of energy produced in the US, by source (`type`), over a range of years:

<iframe width="100%" height="492" src="https://observablehq.com/embed/c14eafd65a30fc4d@155?cells=table_energydata"></iframe>

A new scatterplot, replacing the default variables with the year (x) and quadrillion\_btu (y) from energy instead:

<iframe width="100%" height="476" src="https://observablehq.com/embed/c14eafd65a30fc4d@155?cells=scatterplot_energy"></iframe>


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