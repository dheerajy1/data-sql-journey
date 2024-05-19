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

```
= CALCULATE(SUM(InternetSales[SalesAmount]), USERELATIONSHIP(InternetSales[ShippingDate], DateTime[Date]))
```

# Q11. How many active and inactive relationship I can have between two tables?

You can only have one active relationship between two tables. You can however create as many inactive relationships as possible.

# Q12. What is Crossfilter direction? And how many types of cross filter direction available in Power BI?

Crossfilter direction refers to the way in which filters applied on one table affect the data displayed in related tables within a Power BI report.

1. Single Directional
    
2. Both Directional
    

# Q13. What is Object Level Security? How to configure it?

Object-level security (OLS) enables model authors to secure specific tables or columns from report viewers.

For example, a column that includes personal data can be restricted so that only certain viewers can see and interact with it. In addition, you can also restrict object names and metadata.

Steps to apply Object level security on Sales amount column present in Sales table:

* In Power BI Desktop go to modelling tab
    
* Click on manage roles
    
* Name the role and select the table
    
* Click on Save
    
* Go to Tabular Editor and connect to your dataset
    
* Go to your and then your column
    
* At the right side of your tabular editor go to object level security and click on none
    
* To test it, go to desktop and preview your role
    
* Publish it to service
    
* Assign user to a role
    

# Q14. What is the difference between functions Username vs. UserPrincipalName?

Username: This is your login name, often in the format DOMAIN\\username. UserPrincipalName (UPN): This is your unique identifier, often resembling an email address like username@domain.com

# Q15. What are deployment pipelines in Power BI? Have you used it? How you change the connection in each environment?

Yes, The deployment process lets you clone content from one stage in the deployment pipeline to another, typically from development to test, and from test to production.

During deployment, power bi copies the content from the current stage, into the target one.

The connections between the copied items are kept during the copy process. How you change the connection in each environment – We can change the environment only in QUA and Prod, We can change the connection simply through deployment rules.

There is a setting button at the top left of deployment pipeline we need click there.

You can define the rules by two ways, First one will be “Data set rules” and Second one will Parameter Rules” So whenever you move your report from dev to qua and qua to prod the deployment rules will automatically change the connection.

# Q16. What is difference between contributor and member?

## Contributor Role:

* All viewer role access
    
* Ideal for developers.
    
* Publish, Create, edit, and delete content, such as reports, in the workspace.
    
* Create report in other workspace based on semantic model in this workspace
    
* Copy a report
    
* Create metrics that's based on a semantic model in the workspace
    
* Schedule data refreshes via the on-premises gateway
    
* Modify gateway connection settings
    
* Subscribe others to reports
    

## Member Role:

* All contributor role access
    
* Add members or others with lower permissions
    
* Publish, unpublish, and change permissions for an app.
    
* Update an app
    
* Share items in apps, including semantic models
    
* Allow others to reshare items
    
* Manage semantic model permissions
    

# Q17. If I want to provide access for report not for entire workspace can I do it and if yes then how can I do it?

We can go to power bi report in power bi workspace, click on share and provide the user email Id.

# Q18. **What are Filters in Power BI?**

The term "Filter" is self-explanatory.

Filters are mathematical and logical conditions applied to data to filter out essential information in rows and columns.

The following are the variety of filters available in Power BI:

1. Manual filters
    
2. Auto filters
    
3. Include/Exclude filters
    
4. Drill-down filters
    
5. Cross Drill filters
    
6. Drillthrough filters
    
7. Drillthrough filters
    
8. URL filters–transient
    
9. Pass-Through filters
    

# Q19. List out some drawbacks/limitations of using Power BI.

Here are some limitations to using Power BI:

* Power BI does not accept file sizes larger than 1 GB and doesn't mix imported data accessed from real-time connections.
    
* There are very few data sources that allow real-time connections to Power BI reports and dashboards.
    
* It only shares dashboards and reports with users logged in with the same email address.
    
* Dashboard doesn't accept or pass user, account, or other entity parameters.
    

# Q20. Name the different connectivity modes available in Power BI?

There are three main connectivity modes used in Power BI.

## SQL Server Import

An SQL Server Import is the default and most common connectivity type used in Power BI. It allows you to use the full capabilities of the Power BI Desktop.

## Direct Query

The Direct Query connection type is only available when you connect to specific data sources. In this connectivity type, Power BI will only store the metadata of the underlying data and not the actual data.

## Live Connection

With this connectivity type, it does not store data in the Power BI model. All interaction with a report using a Live Connection will directly query the existing Analysis Services model.

There are only 3 data sources that support the live connection method - SQL Server Analysis Services (Tabular models and Multidimensional Cubes), Azure Analysis Services (Tabular Models), and Power BI Datasets hosted in the Power BI Service.

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