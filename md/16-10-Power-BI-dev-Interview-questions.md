This article contains info about the Power BI dev Interview questions.


# Q1: Total = a *\** b / c \* d. How do you optimise this dax?

Calculate each multiplication individually. Use divide function.

Optimizing steps:

1. identify the areas of use of functions
    
2. use variables for performing calculations and storing data.
    

```sql
TOTAL =
    var a = 10
    var b = 20
    var c = 30
    var d = a * b
    var f = c * d
    var g = DIVIDE(
              e,
              f
           )
    return g
```

# Q2: Difference between star schema and snowflake schema?

| **S.NO** | **Star Schema** | **Snowflake Schema** |
| --- | --- | --- |
| 1. | In [**star schema**](https://www.geeksforgeeks.org/star-schema-in-data-warehouse-modeling/), The fact tables and the one dimension tables are contained. | While in [**snowflake schema**](https://www.geeksforgeeks.org/snowflake-schema-in-data-warehouse-model/), The fact tables, multi dimension tables as well as sub dimension tables are contained. |
| 2. | Star schema is a top-down model. | While it is a bottom-up model. |
| 3. | Star schema uses more space. | While it uses less space. |
| 4. | It takes less time for the execution of queries. | While it takes more time than star schema for the execution of queries. |
| 5. | In star schema, Normalization is not used. | While in this, Both normalization and denormalization are used. |
| 6. | It’s design is very simple. | While it’s design is complex. |
| 7. | The query complexity of star schema is low. | While the query complexity of snowflake schema is higher than star schema. |
| 8. | It’s understanding is very simple. | While it’s understanding is difficult. |
| 9. | It has less number of foreign keys. | While it has more number of foreign keys. |
| 10. | It has high data redundancy. | While it has low data redundancy. |

Star schema:

![Untitled-Diagram-521.png (493×362)](https://media.geeksforgeeks.org/wp-content/uploads/20190527113206/Untitled-Diagram-521.png align="left")

Snowflake:

![Lightbox](https://media.geeksforgeeks.org/wp-content/uploads/20190527113447/Untitled-Diagram-53.png align="left")

---

# Q3: What is dataflows in power BI?

Create reusable transformation logic that can be shared by many semantic models and reports inside Power BI.

Dataflows promote reusability of underlying data elements, preventing the need to create separate connections with your cloud or on-premises data sources.

Create a single source of truth, curated from raw data using industry standard definitions, which can work with other services and products in the Power Platform.

Power Query is the data transformation engine used in the dataflow.

Use-case scenarios for dataflows:

Using dataflows to build a data warehouse

# Q4: Different refreshes in power BI?

Power BI refresh types

A Power BI refresh operation can consist of multiple refresh types, including data refresh, OneDrive refresh, refresh of query caches, tile refresh, and refresh of report visuals.

| Storage mode | Data refresh | OneDrive refresh | Query caches | Tile refresh | Report visuals |
| --- | --- | --- | --- | --- | --- |
| Import | Scheduled and on-demand | Yes, for connected semantic models | If enabled on Premium capacity | Automatically and on-demand | No |
| DirectQuery | Not applicable | Yes, for connected semantic models | Not applicable | Automatically and on-demand | No |
| LiveConnect | Not applicable | Yes, for connected semantic models | Not applicable | Automatically and on-demand | Yes |
| Push | Not applicable | Not applicable | Not practical | Automatically and on-demand | No |

# Q5: What are field parameters in Power BI?

Field parameters allow users to dynamically change the measures or dimensions being analyzed within a report.

This feature can help your report readers explore and customize the analysis of the report by selecting the different measures or dimensions they're interested in.

Use a field parameter to control visual properties


# Q6: What is RLS?

Row-level security (RLS) with Power BI can be used to restrict data access for given users.

Filters restrict data access at the row level, and you can define filters within roles.

In the Power BI service, users with access to a workspace have access to semantic models in that workspace.

Define roles and rules in Power BI Desktop

Using the username() or userprincipalname() DAX function.

username() will return a user in the format of DOMAIN\\User and userprincipalname() will return a user in the format of user@contoso.com

# Q7: Join Disconnected tables?

customers table

```sql
name	age	gender
John	25	M
Emily	32	F
Michael	45	M
Sarah	28	F
David	37	M
Jessica	41	F
Robert	19	M
Jennifer	36	F
Christopher	52	M
Amanda	30	F
```

address details table

```sql
address	city	state
123 Main St	New York	NY
456 Elm St	Los Angeles	CA
789 Oak St	Chicago	IL
321 Pine St	Houston	TX
987 Maple Ave	Miami	FL
654 Cedar Rd	Seattle	WA
876 Birch Ln	Boston	MA
234 Ash St	Atlanta	GA
543 Walnut Dr	Dallas	TX
890 Spruce Ave	San Francisco	CA
```

In power query transformations add indexcolumn.

and then use merge

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715267037459/feede6cc-56ee-4310-9a68-cd7c3d5e4cd3.png)

whenever another row is added to address an index will be created. so this index is called as surrogate key or Sudo key.

# Q8: . What are different refresh options in Power BI?

There are four key refresh options in Power BI, which are as follows:

Package Refresh

To synchronise the Power BI Desktop and Excel file between the Power BI service and OneDrive or SharePoint Online. But it doesn’t extract data from its original source, and the dataset is updated with what’s in the file within OneDrive.

Model or Data Refresh

Refreshes the dataset with data collected from the original source using the scheduled refresh or refresh now option. It requires a gateway for on-premise data sources.

Tile Refresh

Once data changes, it updates the cache for tile visuals on the dashboard every 15 minutes. You can force a tile refresh by clicking on the ellipsis (...) on the upper right side of a dashboard and selecting Refresh Dashboard tiles.

Visual Container Refresh

Refreshes the visual container and updates the cached report visuals within a dashboard once the data is changed.

# Q9: What are the different filters in Power BI Reports?

Visual-level Filters

They work on an individual visualisation and are applied to both data and calculation conditions.

Page-level Filters

They are used for a given page within a report made of multiple pages. You can apply different page-level filters to multiple pages in the same report. Also, each page in a report can have different filters applied to it.

Report-level Filters

As they are used to apply filters to the entire report, affecting all pages and visualisations of a report, they are also known as generalised filters.

# Q10: What are the three fundamental concepts of DAX?

Syntax

It is the way a formula is written, referring to the elements included in it. If the Syntax is wrong, you get an error message.

Functions They are the arguments or specific values written in a particular order to perform a calculation, the same as the function in Excel. It includes date/time, information, statistical, mathematical, logical, text, parent/child, etc.

Context

It is of two types- Row Context and Filter Context.

The former is used when a formula has a function to apply filters to find a row in a table while the latter is used when more than one filter is applied in a calculation to find a value

# Conclusion

Learning Objectives,

1. Optimise dax query
    
2. Star schema and snowflake schema
    
3. Dataflows in power BI
    
4. Refreshes in power BI
    
5. Field parameters in Power BI
    
6. RLS
    
7. Join Disconnected tables in Power Query.
    
8. Refresh options in Power BI
    
9. Filters in Power BI
    
10. Three fundamental concepts of DAX
    

# Source: YT \[[Link](https://www.youtube.com/watch?v=-ABSkLQ-igw&list=LL&index=18)\], \[[Link](https://www.wscubetech.com/blog/wp-content/uploads/2023/11/power-bi-question.pdf)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)