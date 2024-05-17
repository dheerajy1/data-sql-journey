This article contains info about the Power BI dev Interview questions.

# <mark>17th May</mark>

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

![Untitled-Diagram-521.png (493×362)](https://media.geeksforgeeks.org/wp-content/uploads/20190527113206/Untitled-Diagram-521.png)

Snowflake:

![Lightbox](https://media.geeksforgeeks.org/wp-content/uploads/20190527113447/Untitled-Diagram-53.png)

---

# Q3: What is dataflows in power BI?

Create reusable transformation logic that can be shared by many semantic models and reports inside Power BI.

Dataflows promote reusability of underlying data elements, preventing the need to create separate connections with your cloud or on-premises data sources.

Create a single source of truth, curated from raw data using industry standard definitions, which can work with other services and products in the Power Platform.

Power Query is the data transformation engine used in the dataflow.

Use-case scenarios for dataflows:

Using dataflows to build a data warehouse

# Q4: Different refreshes power BI?

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


# Conclusion

Learning Objectives,

1. Optimise dax query

2. Star schema and snowflake schema

3. Dataflows in power BI

4. Refreshes in power BI

5. Field parameters in Power BI




# Source: YT \[[Link](https://www.youtube.com/watch?v=-ABSkLQ-igw&list=LL&index=18)\], \[[Link](https://www.wscubetech.com/blog/wp-content/uploads/2023/11/power-bi-question.pdf)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)