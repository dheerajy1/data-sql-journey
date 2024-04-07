In this article, I am going to log my learnings completed as part of the AI Skills Challenge: Fabric Analytics Engineer.

# Foreword:

> The entire content is owned by Microsoft, and I am logging for practice and it is for educational purposes only.

# **I. Introduction to end-to-end analytics using Microsoft Fabric**

Discover how Microsoft Fabric can meet your enterprise's analytics needs in one platform. Learn about Microsoft Fabric, how it works, and identify how you can use it for your analytics needs.

## **a. Introduction**

Fabric provides a set of integrated services that enable you to ingest, store, process, and analyze data in a single environment.

Fabric includes the following services:

* Data engineering
    
* Data integration
    
* Data warehousing
    
* Real-time analytics
    
* Data science
    
* Business intelligence
    

## **b. Explore end-to-end analytics with Microsoft Fabric**

Scalable analytics can be complex, fragmented, and expensive.

Fabric is a unified *software-as-a-service* (SaaS) offering, with all your data stored in a single open format in OneLake. OneLake is accessible by all of the analytics engines in the platform.

### **i. Explore OneLake**

OneCopy is a key component of OneLake that allows you to read data from a single copy, without moving or duplicating data.

Think of it like OneDrive for data;

OneLake is built on top of *Azure Data Lake Storage* (ADLS) and data can be stored in any format, including Delta, Parquet, CSV, JSON, and more.

### **ii. Explore Fabric's experiences**

Fabric's experiences include:

* **Synapse Data Engineering**: data engineering with a Spark platform for data transformation at scale.
    
* **Synapse Data Warehouse**: data warehousing with industry-leading SQL performance and scale to support data use.
    
* **Synapse Data Science**: data science with Azure Machine Learning and Spark for model training and execution tracking in a scalable environment.
    
* **Synapse Real-Time Analytics**: real-time analytics to query and analyze large volumes of data in real-time.
    
* **Data Factory**: data integration combining Power Query with the scale of Azure Data Factory to move and transform data.
    
* **Power BI**: business intelligence for translating data to decisions.
    

### **iii. Explore security and governance**

In the admin center you can manage groups and permissions, configure data sources and gateways, and monitor usage and performance.

## **c. Data teams and Microsoft Fabric**

## **d. Enable and use Microsoft Fabric**

Fabric is built on Power BI and Azure Data Lake Storage, and includes capabilities from Azure Synapse Analytics, Azure Data Factory, Azure Databricks, and Azure Machine Learning.

## **e. Knowledge Check**

Which of the following is a key benefit of using Microsoft Fabric in data projects?

Fabric's OneLake provides a single, integrated environment for data professionals and the business to collaborate on data projects.

What is the default storage format for Fabric's OneLake?

The default storage format for OneLake is Delta Parquet, an open-source storage layer that brings reliability to data lakes.

Which of the following Fabric workloads is used to move and transform data?

The Data Factory workload combines Power Query with the scale of Azure Data Factory to move and transform data.

# **f. Summary**

Data professionals are increasingly expected to be able to work with data at scale, and to be able to do so in a way that is secure, compliant, and cost-effective.

At the same time, the business wants to use that data more effectively and quickly to make better decisions.

Microsoft Fabric is a collection of tools and services that enables organizations to do just that. In this module, you learned about Fabric's OneLake storage, what workloads that are included in Fabric, and how to enable and use Fabric in your organization.

## **g. Learning objectives**

In this module, you'll learn how to:

* Describe end-to-end analytics in Microsoft Fabric
    

# II. **Get started with lakehouses in Microsoft Fabric**

Lakehouses merge data lake storage flexibility with data warehouse analytics.

Microsoft Fabric offers a lakehouse solution for comprehensive analytics on a single SaaS platform.

## **a. Introduction**

The foundation of Microsoft Fabric is a lakehouse, which is built on top of the **OneLake** scalable storage layer and uses Apache Spark and SQL compute engines for big data processing.

A lakehouse is a unified platform that combines:

* The flexible and scalable storage of a data lake
    
* The ability to query and analyze data of a data warehouse
    

## **b. Explore the Microsoft Fabric lakehouse**

A lakehouse presents as a database and is built on top of a data lake using Delta format tables.

Lakehouses combine the SQL-based analytical capabilities of a relational data warehouse and the flexibility and scalability of a data lake. Lakehouses store all data formats and can be used with various analytics tools and programming languages.

As cloud-based solutions, lakehouses can scale automatically and provide high availability and disaster recovery.

Some benefits of a lakehouse include:

* Lakehouses use Spark and SQL engines to process large-scale data and support machine learning or predictive modeling analytics.
    
* Lakehouse data is organized in a *schema-on-read format*, which means you define the schema as needed rather than having a predefined schema.
    
* Lakehouses support ACID (Atomicity, Consistency, Isolation, Durability) transactions through Delta Lake formatted tables for data consistency and integrity.
    
* Lakehouses are a single location for data engineers, data scientists, and data analysts to access and use data.
    

The Lakehouse Explorer enables you to browse files, folders, shortcuts, and tables; and view their contents within the Fabric platform.

After you've ingested the data into the lakehouse, you can use Notebooks or Dataflows (Gen2) to explore and transform

Note

* Dataflows (Gen2) are based on Power Query - a familiar tool to data analysts using Excel or Power BI that provides visual representation of transformations as an alternative to traditional programming.
    

Data Factory Pipelines can be used to orchestrate Spark, Dataflow, and other activities; enabling you to implement complex data transformation processes.

After transforming your data, you can query it using SQL, use it to train machine learning models, perform real-time analytics, or develop reports in Power BI.

You can also apply data governance policies to your lakehouse, such as data classification and access control.

## **c. Work with Microsoft Fabric lakehouses**

You create and configure a new lakehouse in the Data Engineering workload. Each L produces three named items in the Fabric-enabled workspace:

* **Lakehouse** is the lakehouse storage and metadata, where you interact with files, folders, and table data.
    
* **Semantic model (default)** is an automatically created data model based on the tables in the lakehouse. Power BI reports can be built from the semantic model.
    
* **SQL Endpoint** is a read-only SQL endpoint through which you can connect and query data with Transact-SQL.
    

**Shortcuts** enable you to integrate data into your lakehouse while keeping it stored in external storage.

### **i. Ingest data into a lakehouse**

There are many ways to load data into a Fabric lakehouse, including:

* **Upload**: Upload local files or folders to the lakehouse. You can then explore and process the file data, and load the results into tables.
    
* **Dataflows (Gen2)**: Import and transform data from a range of sources using Power Query Online, and load it directly into a table in the lakehouse.
    
* **Notebooks**: Use notebooks in Fabric to ingest and transform data, and load it into tables or files in the lakehouse.
    
* **Data Factory pipelines**: Copy data and orchestrate data processing activities, loading the results into tables or files in the lakehouse.  
    

### **ii. Grant access to a lakehouse**

Fabric lakehouse permissions are granted either at the workspace or item level.

You can also grant object-level security by using the SQL analytics endpoint to further control what users can access.

## **d. Explore and transform data in a lakehouse**

After loading data into the lakehouse, you can use various tools and techniques to explore and transform it, including:

* **Apache Spark**: Each Fabric lakehouse can use Spark pools through *Notebooks* or *Spark Job Definitions* to process data in files and tables in the lakehouse using Scala, PySpark, or Spark SQL.
    
    * **Notebooks**: Interactive coding interfaces in which you can use code to read, transform, and write data directly to the lakehouse as tables and/or files.
        
    * **Spark job definitions**: On-demand or scheduled scripts that use the Spark engine to process data in the lakehouse.
        
* **SQL analytic endpoint**: Each lakehouse includes a SQL analytic endpoint through which you can run Transact-SQL statements to query, filter, aggregate, and otherwise explore data in lakehouse tables.
    
* **Dataflows (Gen2)**: In addition to using a dataflow to ingest data into the lakehouse, you can create a dataflow to perform subsequent transformations through Power Query, and optionally land transformed data back to the lakehouse.
    
* **Data pipelines**: Orchestrate complex data transformation logic that operates on data in the lakehouse through a sequence of activities (such as dataflows, Spark jobs, and other control flow logic).
    

### **Analyze and visualize data in a lakehouse**

The data in your lakehouse tables is included in a semantic model that defines a relational model for your data.

By combining the data visualization capabilities of Power BI with the centralized storage and tabular schema of a data lakehouse, you can implement an end-to-end analytics solution on a single platform.

## **e. Exercise - Create and ingest data with a Microsoft Fabric lakehouse**

Create a Lakehouse

In this exercise, explore Microsoft Fabric lakehouse tasks like creating a lakehouse, importing data, querying tables with SQL, and generating reports. The exercise emphasizes the importance of the lakehouse as a central component in data engineering, warehousing, and analytics, enabling users to effectively manage and analyze their data within the lakehouse environment.

**Large-scale data analytics solutions have traditionally been built around a *data warehouse*, in which data is stored in relational tables and queried using SQL. The growth in “big data” (characterized by high *volumes*, *variety*, and *velocity* of new data assets) together with the availability of low-cost storage and cloud-scale distributed compute technologies has led to an alternative approach to analytical data storage; the *data lake*.**

**In a data lake, data is stored as files without imposing a fixed schema for storage. Increasingly, data engineers and analysts seek to benefit from the best features of both of these approaches by combining them in a *data lakehouse*; in which data is stored in files in a data lake and a relational schema is applied to them as a metadata layer so that they can be queried using traditional SQL semantics.**

In Microsoft Fabric, a lakehouse provides highly scalable file storage in a *OneLake* store (built on Azure Data Lake Store Gen2) with a metastore for relational objects such as tables and views based on the open source *Delta Lake* table format. Delta Lake enables you to define a schema of tables in your lakehouse that you can query using SQL.

### i. Create a workspace

### ii Create a lakehouse

### iii. Upload a file

### iv. Explore shortcuts

### v. Load file data into a table

### vi. Use SQL to query tables

```sql
SELECT Item, SUM(Quantity * UnitPrice) AS Revenue
FROM sales
GROUP BY Item
ORDER BY Revenue DESC;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712465955191/53764d61-e515-4634-8f04-e1067f446842.png align="center")

### vii. Create a visual query

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712466216745/3a1cce01-41fe-48d6-8ae8-3d6b496b5660.png align="center")

## viii. Create a report

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712466562480/ec1df57a-15a5-4f8d-a323-f0162e77f64f.png align="center")

### ix. Clean up resources

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712466651314/6dbdaf3f-bbdd-457d-945c-0707ee9c9060.png align="center")

In this exercise, I have created a lakehouse and imported data into it.

I’ve seen how a lakehouse consists of files and tables stored in a OneLake data store.

The managed tables can be queried using SQL, and are included in a default semantic model to support data visualizations.

## f. **Knowledge check**

What is a Microsoft Fabric lakehouse?

Lakehouses combine data lake and data warehouse features.

You want to include data in an external Azure Data Lake Store Gen2 location in your lakehouse, without the requirement to copy the data. What should you do?

A shortcut enables you to include external data in the lakehouse.

You want to use Apache Spark to interactively explore data in a file in the lakehouse. What should you do?

A notebook enables interactive Spark coding.

## g. **Summary**

Microsoft Fabric lakehouses provide data engineers and analysts with the combined benefits of data lake storage and a relational data warehouse.

You can use a lakehouse as the basis of an end-to-end data analytics solution that includes data ingestion, transformation, modeling, and visualization.

## **Learning objectives**

In this module, you'll learn how to:

* Describe core features and capabilities of lakehouses in Microsoft Fabric
    
* Create a lakehouse
    
* Ingest data into files and tables in a lakehouse
    
* Query lakehouse tables with SQL
    
* Build report
    

# III. Use Apache Spark in Microsoft Fabric

# IV. Work with Delta Lake tables in Microsoft Fabric

# V. Use Data Factory pipelines in Microsoft Fabric

# VI. Ingest Data with Dataflows Gen2 in Microsoft Fabric

# VII. Ingest data with Spark and Microsoft Fabric notebooks

# VIII. Organize a Fabric lakehouse using medallion architecture design

# IX. Get started with data warehouses in Microsoft Fabric

# X. Load data into a Microsoft Fabric data warehouse

# XI. Use tools to optimize Power BI performance

# XII. Create and manage a Power BI deployment pipeline

# XIII. Administer Microsoft Fabric

# Conclusion

Learning Objectives,

1. Describe end-to-end analytics in Microsoft Fabric
    

# Source: AI Skills Challenge: Fabric Analytics Engineer \[[Link](https://learn.microsoft.com/en-us/collections/jkqrh725262g?WT.mc_id=cloudskillschallenge_b696c18d-7201-4aff-9c7d-d33014d93b25)\]

# Author: Dheeraj.Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)