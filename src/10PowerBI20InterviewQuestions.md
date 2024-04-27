In this article, I am going to write about Power BI interview Questions.

# Q1. What is Incremental Refresh, how to configure it and limitations of it?

Incremental Refresh in Power BI is a feature that allows you to refresh only the data that has changed since the last refresh, rather than refreshing all data every time.

This can significantly reduce the time and resources required for data refreshes, especially for large datasets.

## To configure Incremental Refresh in Power BI, you typically follow these steps:

### Define a date/time column:

You need to have a column in your dataset that represents the last updated or modified timestamp for each row of data. This column will be used to determine which rows have changed since the last refresh.

### Set up Incremental Refresh in Power BI Service or Power BI Desktop:

In Power BI Desktop, you can configure Incremental Refresh by going to the query editor, selecting the table you want to apply Incremental Refresh to, and then setting the appropriate options in the Incremental Refresh settings.

In Power BI Service, after publishing your report, you can configure Incremental Refresh by going to the dataset settings and enabling Incremental Refresh. Here you specify the date/time column and other settings related to refresh policy.

### Configure Incremental Refresh settings:

Specify the time period for which you want to keep historical data. For example, you might want to keep only the data from the last 12 months, and refresh only the data that falls outside of this window.

### Schedule Refresh:

Set up a refresh schedule for your dataset in Power BI Service so that it automatically refreshes at regular intervals.

## Limitations of Incremental Refresh in Power BI include:

### Premium Feature:

Incremental Refresh is available only for Power BI Premium, Power BI Premium Per User, and Power BI Pro with a dedicated capacity.

### Date/Time column requirement:

You need a date or timestamp column in your dataset to identify which rows have changed since the last refresh.

### DirectQuery:

Incremental Refresh is not supported for DirectQuery connections. It works only with Import mode.

### Initial Full Load:

When you first set up Incremental Refresh, you typically need to perform a full refresh to populate the initial dataset.

# Q2. What are the latest update in Power BI? You can tell me one or Two?

# Q3. Why do we use field parameter? How to configure it?

Field parameters allow users to dynamically change the measures or dimensions being analyzed within a report.

This feature can help your report readers explore and customize the analysis of the report by selecting the different measures or dimensions they're interested in.

To configure a field parameter in Power BI Desktop:

1. Open your Power BI Desktop file.
    
2. Go to the "Modeling" tab in the ribbon.
    
3. Click on "New Parameter" in the "Modeling" tab and click on “Fields” to create a new parameter.
    
4. Define the parameter properties such as Name, add relevant fields and order according to the need.
    
5. Click on create.
    
6. Add the parameter in slicer and in your visual.
    
7. Test and validate parameter behavior.
    

# Q4. What are gateways? Types of gateways?

Power BI Gateway is software you require to access data in an on-premises network. It acts as a gatekeeper for the on-premises data sources. They provide highly secure connections between the on-premises and single/multiple data sources.

1. On-premises Data Gateway (recommended/standard)
    
2. On-premises Data Gateway (personal mode)
    

# Q5. In a Data model I don’t have Date Dim table? How can I create date table with the help of dax?

We can use CALENDAR and CALENDARAUTO dax function

---

# Q6. Difference between Calendar and Calendar Auto dax function?

CALENDAR: We need to provide StartDate and EndDate and it will returns a table with one column of all dates between.

CALENDARAUTO: function conveniently determines the date range automatically based on the data in the model.

# Q7. Once the date table is created, I need a new column which will have Day name, what is the dax function for this requirement?

FORMAT('Date'\[Date\], "dddd")

# Q8. Difference between All, AllExcept and AllSelected?

ALL() - Unleashes the entire table or column, waving away any applied filters. ALLEXCEPT() - Selectively retains context filters on specified columns. ALLSELECTED() - Simply discards filters originating from the inner query, however keeps the slicer and report filters

# Q9. What is Filter Context and Row Context?

## Row Context:

Imagine each row in your data table as an individual actor on a stage. Row context is all about what's happening on that specific row.

When you create a calculated column or a measure, row context focuses on the values of that particular row, kind of like a spotlight highlighting the star performer.

Example: Calculating a running total for each row or creating a column that depends on values within the same row involves row context.

## Filter Context:

Now, shift your perspective to the entire theater. Filter context considers the overall environment and the filters applied to your data. It's like the atmosphere of the entire performance space, influencing how the actors (rows) are perceived based on the broader context.

Example: Aggregations, like calculating the sum of a column, involve filter context as it considers the filters applied to the visual or report.

# Q10. I have a requirement where I have to use Inactive relationship, how can use it?

We can use Userelationship dax function

### Conclusion

Learning Objectives,

1. Incremental Refresh
    
2. field parameter
    
3. gateways
    
4. Filter Context, Row Context
    

# Source: **Power BI Interview Q** \[[Link](https://www.simplilearn.com/power-bi-interview-questions-and-answers-article)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)