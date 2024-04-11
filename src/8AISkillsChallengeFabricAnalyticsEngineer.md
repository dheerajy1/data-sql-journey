In this article, I am going to log my learnings completed as part of the AI Skills Challenge: Fabric Analytics Engineer.

# Foreword:

> The entire content is owned by Microsoft, and I am logging for practice and it is for educational purposes only.

# **I. Introduction to end-to-end analytics using Microsoft Fabric**

Discover how Microsoft Fabric can meet your enterprise's analytics needs in one platform. Learn about Microsoft Fabric, how it works, and identify how you can use it for your analytics needs.

## **1\. Introduction**

Fabric provides a set of integrated services that enable you to ingest, store, process, and analyze data in a single environment.

Fabric includes the following services:

* Data engineering
    
* Data integration
    
* Data warehousing
    
* Real-time analytics
    
* Data science
    
* Business intelligence
    

## **2\. Explore end-to-end analytics with Microsoft Fabric**

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

## **3\. Data teams and Microsoft Fabric**

## **4\. Enable and use Microsoft Fabric**

Fabric is built on Power BI and Azure Data Lake Storage, and includes capabilities from Azure Synapse Analytics, Azure Data Factory, Azure Databricks, and Azure Machine Learning.

## **5\. Knowledge Check**

Which of the following is a key benefit of using Microsoft Fabric in data projects?

Fabric's OneLake provides a single, integrated environment for data professionals and the business to collaborate on data projects.

What is the default storage format for Fabric's OneLake?

The default storage format for OneLake is Delta Parquet, an open-source storage layer that brings reliability to data lakes.

Which of the following Fabric workloads is used to move and transform data?

The Data Factory workload combines Power Query with the scale of Azure Data Factory to move and transform data.

# **6\. Summary**

Data professionals are increasingly expected to be able to work with data at scale, and to be able to do so in a way that is secure, compliant, and cost-effective.

At the same time, the business wants to use that data more effectively and quickly to make better decisions.

Microsoft Fabric is a collection of tools and services that enables organizations to do just that. In this module, you learned about Fabric's OneLake storage, what workloads that are included in Fabric, and how to enable and use Fabric in your organization.

## **Learning objectives**

In this module, you'll learn how to:

* Describe end-to-end analytics in Microsoft Fabric
    

# II. **Get started with lakehouses in Microsoft Fabric**

Lakehouses merge data lake storage flexibility with data warehouse analytics.

Microsoft Fabric offers a lakehouse solution for comprehensive analytics on a single SaaS platform.

## **1\. Introduction**

The foundation of Microsoft Fabric is a lakehouse, which is built on top of the **OneLake** scalable storage layer and uses Apache Spark and SQL compute engines for big data processing.

A lakehouse is a unified platform that combines:

* The flexible and scalable storage of a data lake
    
* The ability to query and analyze data of a data warehouse
    

## **2\. Explore the Microsoft Fabric lakehouse**

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

## **3\. Work with Microsoft Fabric lakehouses**

You create and configure a new lakehouse in the Data Engineering workload. Each L produces three named items in the Fabric-enabled workspace:

* **Lakehouse** is the lakehouse storage and metadata, where you interact with files, folders, and table data.
    
* **Semantic model (default)** is an automatically created data model based on the tables in the lakehouse. Power BI reports can be built from the semantic model.
    
* **SQL Endpoint** is a read-only SQL endpoint through which you can connect and query data with Transact-SQL.
    

**Shortcuts** enable you to integrate data into your lakehouse while keeping it stored in external storage.

### **4\. Ingest data into a lakehouse**

There are many ways to load data into a Fabric lakehouse, including:

* **Upload**: Upload local files or folders to the lakehouse. You can then explore and process the file data, and load the results into tables.
    
* **Dataflows (Gen2)**: Import and transform data from a range of sources using Power Query Online, and load it directly into a table in the lakehouse.
    
* **Notebooks**: Use notebooks in Fabric to ingest and transform data, and load it into tables or files in the lakehouse.
    
* **Data Factory pipelines**: Copy data and orchestrate data processing activities, loading the results into tables or files in the lakehouse.
    

### **5\. Grant access to a lakehouse**

Fabric lakehouse permissions are granted either at the workspace or item level.

You can also grant object-level security by using the SQL analytics endpoint to further control what users can access.

## **6\. Explore and transform data in a lakehouse**

After loading data into the lakehouse, you can use various tools and techniques to explore and transform it, including:

* **Apache Spark**: Each Fabric lakehouse can use Spark pools through *Notebooks* or *Spark Job Definitions* to process data in files and tables in the lakehouse using Scala, PySpark, or Spark SQL.
    
    * **Notebooks**: Interactive coding interfaces in which you can use code to read, transform, and write data directly to the lakehouse as tables and/or files.
        
    * **Spark job definitions**: On-demand or scheduled scripts that use the Spark engine to process data in the lakehouse.
        
* **SQL analytic endpoint**: Each lakehouse includes a SQL analytic endpoint through which you can run Transact-SQL statements to query, filter, aggregate, and otherwise explore data in lakehouse tables.
    
* **Dataflows (Gen2)**: In addition to using a dataflow to ingest data into the lakehouse, you can create a dataflow to perform subsequent transformations through Power Query, and optionally land transformed data back to the lakehouse.
    
* **Data pipelines**: Orchestrate complex data transformation logic that operates on data in the lakehouse through a sequence of activities (such as dataflows, Spark jobs, and other control flow logic).
    

### **i. Analyze and visualize data in a lakehouse**

The data in your lakehouse tables is included in a semantic model that defines a relational model for your data.

By combining the data visualization capabilities of Power BI with the centralized storage and tabular schema of a data lakehouse, you can implement an end-to-end analytics solution on a single platform.

## **7\. Exercise - Create and ingest data with a Microsoft Fabric lakehouse**

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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712465955191/53764d61-e515-4634-8f04-e1067f446842.png)

### vii. Create a visual query

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712466216745/3a1cce01-41fe-48d6-8ae8-3d6b496b5660.png)

## viii. Create a report

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712466562480/ec1df57a-15a5-4f8d-a323-f0162e77f64f.png)

### ix. Clean up resources

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712466651314/6dbdaf3f-bbdd-457d-945c-0707ee9c9060.png)

In this exercise, I have created a lakehouse and imported data into it.

I’ve seen how a lakehouse consists of files and tables stored in a OneLake data store.

The managed tables can be queried using SQL, and are included in a default semantic model to support data visualizations.

## 8\. **Knowledge check**

What is a Microsoft Fabric lakehouse?

Lakehouses combine data lake and data warehouse features.

You want to include data in an external Azure Data Lake Store Gen2 location in your lakehouse, without the requirement to copy the data. What should you do?

A shortcut enables you to include external data in the lakehouse.

You want to use Apache Spark to interactively explore data in a file in the lakehouse. What should you do?

A notebook enables interactive Spark coding.

## 9\. **Summary**

Microsoft Fabric lakehouses provide data engineers and analysts with the combined benefits of data lake storage and a relational data warehouse.

You can use a lakehouse as the basis of an end-to-end data analytics solution that includes data ingestion, transformation, modeling, and visualization.

## **Learning objectives**

In this module, you'll learn how to:

* Describe core features and capabilities of lakehouses in Microsoft Fabric
    
* Create a lakehouse
    
* Ingest data into files and tables in a lakehouse
    
* Query lakehouse tables with SQL
    
* build report
    

# III. Use Apache Spark in Microsoft Fabric

Apache Spark is a core technology for large-scale data analytics.

Microsoft Fabric provides support for Spark clusters, enabling you to analyze and process data in a Lakehouse at scale.

## 1\. Introduction

Apache Spark is an open-source parallel processing framework for large-scale data processing and analytics.

This module explores how you can use Spark in Microsoft Fabric to ingest, process, and analyze data in a lakehouse.

While the core techniques and code described in this module are common to all Spark implementations, the integrated tools and ability to work with Spark in the same environment as other data services in Microsoft Fabric makes it easier to incorporate Spark-based data processing into your overall data analytics solution.

## 3\. Prepare to use Apache Spark

Apache Spark is a distributed data processing framework that enables large-scale data analytics by coordinating work across multiple processing nodes in a cluster.

Put more simply, Spark uses a "divide and conquer" approach to processing large volumes of data quickly by distributing the work across multiple computers.

The process of distributing tasks and collating results is handled for you by Spark.

### **i. Spark settings**

In Microsoft Fabric, each workspace is assigned a Spark cluster.

### ii. **Libraries**

## 3\. Run Spark code

To edit and run Spark code in Microsoft Fabric, you can use notebooks, or you can define a Spark job.

### i. **Notebooks**

When you want to use Spark to explore and analyze data interactively, use a notebook.

Notebooks enable you to combine text, images, and code written in multiple languages to create an interactive item that you can share with others and collaborate.

### ii. Spark job definition

If you want to use Spark to ingest and transform data as part of an automated process, you can define a Spark job to run a script on-demand or based on a schedule.

## 4\. Work with data in a Spark dataframe

Natively, Spark uses a data structure called a *resilient distributed dataset* (RDD); but while you *can* write code that works directly with RDDs, the most commonly used data structure for working with structured data in Spark is the *dataframe*, which is provided as part of the *Spark SQL* library.

### **i. Inferring a schema**

products.csv \[[Link](https://github.com/MicrosoftLearning/dp-data/blob/main/products.csv)\]

```python
%%pyspark
df = spark.read.load('Files/data/products.csv',
    format='csv',
    header=True
)
display(df.limit(10))
```

The `%%pyspark` line at the beginning is called a *magic*, and tells Spark that the language used in this cell is PySpark.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712499408220/b30b3f1b-06db-4256-8b0a-956be975ab57.png)

### ii. **Specifying an explicit schema**

Specifying an explicit schema also improves performance!

```python
from pyspark.sql.types import *
from pyspark.sql.functions import *

productSchema = StructType([
    StructField("ProductID",IntegerType()),
    StructField("ProductName",StringType()),
    StructField("Category",StringType()),
    StructField("ListPrice",FloatType())
])

df = spark.read.load(
    'Files/product-data.csv',
    format = "csv",
    schema = productSchema,
    Header = False
)
display(df.limit(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712500486157/e66d3e09-8751-4064-a750-d1ad9660347c.png)

### iii. **Filtering and grouping dataframes**

```python
pricelist_df = df.select("ProductID", "ListPrice")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712502272753/a2fd2e2b-78d1-4fd9-aa96-3db5cf515d1d.png)

this example code chains the select and where methods to create a new dataframe containing the ProductName and ListPrice columns for products with a category of Mountain Bikes or Road Bikes:

```python
bikes_df = df.select("ProductName", "Category", "ListPrice").where((df["Category"]=="Mountain Bikes") | (df["Category"]=="Road Bikes"))
display(bikes_df)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712503142282/b8a26332-9c6d-4deb-809c-7813bf04cccb.png)

PySpark code counts the number of products for each category:

```python
count_df  = df.select("ProductID","Category").groupBy("Category").count()
display(count_df)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712503553539/3a53ae4a-e1f8-4a5f-bb27-33c27c18a9b8.png)

### iv. **Saving a dataframe**

You'll often want to use Spark to transform raw data and save the results for further analysis or downstream processing. The following code example saves the dataFrame into a *parquet* file in the data lake, replacing any existing file of the same name.

```python
bikes_df.write.mode("overwrite").parquet('Files/bike_data/bikes.parquet')
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712503999542/a83a4b4c-2ea4-4e06-9a3f-5be2490b8506.png)

### v. **Partitioning the output file**

Partitioning is an optimization technique that enables Spark to maximize performance across the worker nodes. More performance gains can be achieved when filtering data in queries by eliminating unnecessary disk IO.

```python
bikes_df.write.partitionBy("Category").mode("overwrite").parquet("Files/bike_data")
```

### vi. **Load partitioned data**

```python
road_bikes_df = spark.read.parquet('Files/bike_data/Category=Road Bikes')
display(road_bikes_df.limit(5))
```

## 5\. Work with data using Spark SQL

The Dataframe API is part of a Spark library named Spark SQL, which enables data analysts to use SQL expressions to query and manipulate data.

### **i. Creating database objects in the Spark catalog**

```python
df.createOrReplaceTempView("products_view")
```

```python
df.createOrReplaceTempView("Vproducts")
df2 = spark.sql("SELECT * FROM Vproducts")
display(df2)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712550404595/7ccb7870-6369-4d56-b086-8fec3552823a.png)

You can create an empty table by using the `spark.catalog.createTable` method, or you can save a dataframe as a table by using its `saveAsTable` method. Deleting a managed table also deletes its underlying data.

```python
spark.catalog.createTable("tEmpty",schema = spark.range(1).schema, source = 'parquet')
```

```python
spark.catalog.listTables()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712554587241/8ce58dfd-b149-45df-b2b6-a1e1bad4f804.png)

```python
spark.sql("DROP TABLE tEmpty")
```

above code skipped taking &gt;50 min time.

For example, the following code saves a dataframe as a new table named **products**:

```python
df.write.format("delta").saveAsTable("products")
```

```python
%%pyspark

df3 = spark.sql("SELECT * FROM productscopy")
display(df3.limit(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712558951143/c3a3d402-e2d7-4ee0-88d1-c7730771f2d5.png)

Delta tables support features commonly found in relational database systems, including transactions, versioning, and support for streaming data.

Additionally, you can create *external* tables by using the `spark.catalog.createExternalTable` method. External tables define metadata in the catalog but get their underlying data from an external storage location; typically a folder in the **Files** storage area of a lakehouse. Deleting an external table doesn't delete the underlying data.

### **ii. Using the Spark SQL API to query data**

```python
bikes_df = spark.sql("SELECT * FROM productscopy WHERE Category IN ('Mountain Bikes', 'Road Bikes')")
display(bikes_df)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712559268582/eceb2b96-b74b-4ed7-b1a6-b00235aaed87.png)

### **iii. Using SQL code**

```python
%%sql

SELECT
    Category,
    COUNT(ProductID) AS ProductCount
FROM productscopy
GROUP BY Category
ORDER BY Category
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712559503834/e6bc2df3-c4f0-47e3-a259-d63056ca7bae.png)

## 6\. Visualize data in a Spark notebook

### i. Using built-in notebook charts

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712559840956/fadf91e0-72b3-426c-bc5b-8b3bbbf98e56.png)

### ii. **Using graphics packages in code**

```python
from matplotlib import pyplot as plt

# Get the data as a Pandas dataframe
data = spark.sql("SELECT Category, COUNT(ProductID) AS ProductCount \
                  FROM products \
                  GROUP BY Category \
                  ORDER BY Category").toPandas()

# Clear the plot area
plt.clf()

# Create a Figure
fig = plt.figure(figsize=(12,8))

# Create a bar plot of product counts by category
plt.bar(x=data['Category'], height=data['ProductCount'], color='orange')

# Customize the chart
plt.title('Product Counts by Category')
plt.xlabel('Category')
plt.ylabel('Products')
plt.grid(color='#95a5a6', linestyle='--', linewidth=2, axis='y', alpha=0.7)
plt.xticks(rotation=70)

# Show the plot area
plt.show()
```

```python
from matplotlib import pyplot as plt

# Get the data as a Pandas dataframe
data = spark.sql("SELECT Category, COUNT(ProductID) AS ProductCount FROM productscopy GROUP BY Category ORDER BY Category").toPandas()

# Clear the plot area
plt.clf()

# Create a Figure
fig = plt.figure(figsize=(12,8))

# Create a bar plot of product counts by category
plt.bar(x = data["Category"], height = data["ProductCount"])

# Customize the chart
plt.title("Products Count by Category")
plt.xlabel("Category")
plt.ylabel("Products")
plt.xticks(rotation=70)

# Show the plot area
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712563209876/2a32d2f9-3e18-4686-b9f0-1f75c30d0bbb.jpeg)

## 7\. Exercise - Analyze data with Apache Spark

### i. Create a lakehouse and upload files

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712563686914/fdc35feb-a8a3-48b4-a328-21b872dadf5d.png)

### ii. Create a notebook

### iii. Load data into a dataframe

```python
from pyspark.sql.types import *

orderSchema = StructType([
    StructField("SalesOrderNumber", StringType()),
    StructField("SalesOrderLineNumber",IntegerType()),
    StructField("OrderDate",DateType()),
    StructField("CustomerName",StringType()),
    StructField("Email",StringType()),
    StructField("Item", StringType()),
    StructField("Quantity", IntegerType()),
    StructField("UnitPrice", FloatType()),
    StructField("Tax", FloatType())
])

df = spark.read.format("csv").schema(orderSchema).load("Files/orders/2019.csv")

display(df)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712564696395/1c3a4946-5b35-414e-a9f9-cf2bed26a68c.png)

Create view:

```python
df.createOrReplaceTempView("vOrders")

data = spark.sql("SELECT * FROM vOrders")

display(data)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712565179453/f3af631c-be78-40c5-a282-581f07b800ce.png)

count:

```python
data = spark.sql("SELECT YEAR(OrderDate) AS OrderYear, COUNT(SalesOrderNumber) FROM vOrders GROUP BY YEAR(OrderDate) ORDER BY YEAR(OrderDate)")

display(data)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712566266843/099c47ef-0ec0-44d7-a07d-e9e7a2ca1a24.png)

### iv. Explore data in a dataframe

#### a. Filter a dataframe

```python
customers = df["CustomerName","Email"]

print(customers.count())
print(customers.distinct().count())
display(customers.distinct())
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712566603902/7b371cf9-4102-4724-a58c-c42c3c5c4bdd.png)

```python
customers = df["CustomerName","Email"].where(df["Item"] == 'Road-250 Red, 52')

print(customers.count())
print(customers.distinct().count())
display(customers.distinct())
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712566828366/92facee2-1758-4264-a795-71ff0023c886.png)

#### b. Aggregate and group data in a dataframe:

```python
yearlySales = df.select(year(col("OrderDate")).alias("Year")).groupBy("Year").count().orderBy("Year")
display(yearlySales)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712567595034/3f8fe0e3-2786-42fa-bb00-2a9792f27412.png)

### v. Use Spark to transform data files

#### i. Use dataframe methods and functions to transform data

```python

## Create Year and Month columns
transformed_df = df.withColumn("Year",year(col("OrderDate"))).withColumn("Month",month(col("OrderDate")))

# Create the new FirstName and LastName fields
transformed_df = transformed_df.withColumn("FirstName",split(col("customerName")," ").getItem(0)).withColumn("LastName",split(col("customerName")," ").getItem(1))

# Filter and reorder columns
transformed_df = transformed_df["SalesOrderNumber", "SalesOrderLineNumber", "OrderDate", "Year", "Month", "FirstName", "LastName", "Email", "Item", "Quantity", "UnitPrice", "Tax"]

# Display the first five orders
display(transformed_df.limit(5))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712568346447/ee1e3deb-cd24-4c75-998a-6786e7e35f5f.png)

#### ii. Save the transformed data

```python
transformed_df.write.mode("overwrite").parquet("Files/transformed_data/orders")
print("Transformed Data Saved as a parquet file")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712568742494/64335239-e091-43d5-8af9-69791fb77855.png)

```python
orders_df = spark.read.format("parquet").load("Files/transformed_data/orders")

display(orders_df)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712569030980/1d4fba20-e101-4fc8-a926-7a5c4a2be0a7.png)

#### iii. Save data in partitioned files

```python
orders_df.write.partitionBy("Year","Month").mode("overwrite").parquet("Files/partitioned_data")
print("Transformed pratitioned data, saved in a parquet file format")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712569500453/405ce355-3c51-4706-955c-096ee2792b6c.png)

```python
orders_2021_df = spark.read.format("parquet").load("Files/partitioned_data/Year=2021/Month=*")
display(orders_2021_df)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712569732762/eed9ed9f-3cdb-43e3-9b4d-5982ca6ac874.png)

Note that the partitioning columns specified in the path (**Year** and **Month**) are not included in the dataframe.

### vi. Work with tables and SQL

#### i. Create a table

```python
spark.sql("DROP TABLE salesorders")

df.write.format("delta").saveAsTable("salesorders")

spark.sql("DESCRIBE EXTENDED salesorders").show(truncate=False)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712573622030/06bfc7ff-6efc-4955-a373-37916712f2a4.png)

```python
df = spark.sql("SELECT * FROM [your_lakehouse].salesorders LIMIT 1000")
display(df)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712573785726/eeeb2eab-4017-4367-88f6-9aeaba7894a1.png)

#### ii. Run SQL code in a cell

```sql
%%sql
SELECT YEAR(OrderDate) AS OrderYear,
       SUM((UnitPrice * Quantity) + Tax) AS GrossRevenue
FROM salesorders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712574081973/82ec6eeb-60af-4d72-86b9-736e50ffe5b7.png)

### vii. Visualize data with Spark

```sql
%%sql

SELECT
    *
FROM salesorders
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712575077400/bf898143-e953-4a06-8765-01fcdef43368.png)

#### viii. Get started with matplotlib

```sql
sqlQuery = "SELECT CAST(YEAR(OrderDate) AS CHAR(4)) AS OrderYear, \
                SUM((UnitPrice * Quantity) + Tax) AS GrossRevenue \
            FROM salesorders \
            GROUP BY CAST(YEAR(OrderDate) AS CHAR(4)) \
            ORDER BY OrderYear"
df_spark = spark.sql(sqlQuery)
df_spark.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712575579503/0adc6a80-1ef2-4ea9-a865-1540d988eedf.png)

```sql
from matplotlib import pyplot as plt

# matplotlib requires a Pandas dataframe, not a Spark one
df_sales = df_spark.toPandas()

# Create a bar plot of revenue by year
plt.bar(x=df_sales['OrderYear'], height=df_sales['GrossRevenue'])

# Display the plot
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712575641004/a5f6f06a-3dec-49d3-a53b-a2ea48e1acac.png)

```sql
from matplotlib import pyplot as plt

# Clear the plot area
plt.clf()

# Create a Figure
fig = plt.figure(figsize=(8,3))

# Create a bar plot of revenue by year
plt.bar(x=df_sales['OrderYear'], height=df_sales['GrossRevenue'], color='orange')

# Customize the chart
plt.title('Revenue by Year')
plt.xlabel('Year')
plt.ylabel('Revenue')
plt.grid(color='#95a5a6', linestyle='--', linewidth=2, axis='y', alpha=0.7)
plt.xticks(rotation=45)

# Show the figure
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712575740825/64c68b67-b35f-4fab-b575-832edcfa73c0.png)

```apache
from matplotlib import pyplot as plt

# Clear the plot area
plt.clf()

# Create a figure for 2 subplots (1 row, 2 columns)
fig, ax = plt.subplots(1, 2, figsize = (10,4))

# Create a bar plot of revenue by year on the first axis
ax[0].bar(x=df_sales['OrderYear'], height=df_sales['GrossRevenue'], color='orange')
ax[0].set_title('Revenue by Year')

# Create a pie chart of yearly order counts on the second axis
yearly_counts = df_sales['OrderYear'].value_counts()
ax[1].pie(yearly_counts)
ax[1].set_title('Orders per Year')
ax[1].legend(yearly_counts.keys().tolist())

# Add a title to the Figure
fig.suptitle('Sales Data')

# Show the figure
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712575857732/4903bce5-f394-4b7a-86b4-d25baa4bcb0f.png)

#### ix. Use the seaborn library

### viii. Save the notebook and end the Spark session

### ix. Clean up resources

## 8\. Knowledge check

You want to use Apache Spark to explore data interactively in Microsoft Fabric. What should you create?

Notebooks enable you to run Spark code interactively.

You need to use Spark to analyze data in a CSV file. What's the simplest way to accomplish this goal?

You can load data from files in many formats, including CSV, into a Spark dataframe.

Which method is used to split the data across folders when saving a dataframe?

The partitionBy method partitions the dataframe based on specified columns.

## 9\. Summary

Apache Spark is a key technology used in big data analytics.

Spark support in Microsoft Fabric enables you to integrate big data processing in Spark with the other data analytics and visualization capabilities of the platform.

## **Learning objectives**

In this module, you'll learn how to:

* Configure Spark in a Microsoft Fabric workspace
    
* Identify suitable scenarios for Spark notebooks and Spark jobs
    
* Use Spark dataframes to analyze and transform data
    
* Use Spark SQL to query data in tables and views
    
* Visualize data in a Spark notebook
    

# IV. Work with Delta Lake tables in Microsoft Fabric

Tables in a Microsoft Fabric lakehouse are based on the Delta Lake storage format commonly used in Apache Spark. By using the enhanced capabilities of delta tables, you can create advanced analytics solutions.

## 1\. Introduction

Tables in a Microsoft Fabric lakehouse are based on the Linux foundation Delta Lake table format, commonly used in Apache Spark.

Delta Lake is an open-source storage layer for Spark that enables relational database capabilities for batch and streaming data.

By using Delta Lake, you can implement a lakehouse architecture to support SQL-based data manipulation semantics in Spark with support for transactions and schema enforcement.

## 2\. Understand Delta Lake

Delta tables are schema abstractions over data files that are stored in Delta format.

For each table, the lakehouse stores a folder containing Parquet data files and a deltaLog folder in which transaction details are logged in JSON format.

benefits of using Delta tables include:

* **Relational tables that support querying and data modification**. With Apache Spark, you can store data in Delta tables that support *CRUD* (create, read, update, and delete) operations. In other words, you can *select*, *insert*, *update*, and *delete* rows of data in the same way you would in a relational database system.
    
* **Support for *ACID* transactions**. Relational databases are designed to support transactional data modifications that provide *atomicity* (transactions complete as a single unit of work), *consistency* (transactions leave the database in a consistent state), *isolation* (in-process transactions can't interfere with one another), and *durability* (when a transaction completes, the changes it made are persisted). Delta Lake brings this same transactional support to Spark by implementing a transaction log and enforcing serializable isolation for concurrent operations.
    
* **Data versioning and *time travel***. Because all transactions are logged in the transaction log, you can track multiple versions of each table row and even use the *time travel* feature to retrieve a previous version of a row in a query.
    
* **Support for batch and streaming data**. While most relational databases include tables that store static data, Spark includes native support for streaming data through the Spark Structured Streaming API. Delta Lake tables can be used as both *sinks* (destinations) and *sources* for streaming data.
    
* **Standard formats and interoperability**. The underlying data for Delta tables is stored in Parquet format, which is commonly used in data lake ingestion pipelines. Additionally, you can use the SQL analytics endpoint for the Microsoft Fabric lakehouse to query Delta tables in SQL.
    

## 3\. Create delta tables

When you create a table in a Microsoft Fabric lakehouse, a delta table is defined in the metastore for the lakehouse and the data for the table is stored in the underlying Parquet files for the table.

### i. Creating a delta table from a dataframe

#### 1\. Managed table

In the below example, the dataframe was saved as a managed table; meaning that the table definition in the metastore and the underlying data files are both managed by the Spark runtime for the Fabric lakehouse.

Deleting the "mytable" table will also delete the underlying files from the Tables storage location for the lakehouse.

```apache
# Load a file into a dataframe
df = spark.read.load('Files/mydata.csv', format='csv', header=True)

# Save the dataframe as a delta table
df.write.format("delta").saveAsTable("mytable")
```

#### 2\. External tables

create tables as external tables, in which the relational table definition in the metastore is mapped to an alternative file storage location. For example, the following code creates an external table for which the data is stored in the folder in the Files storage location for the lakehouse:

```apache
df.write.format("delta").saveAsTable("myexternaltable", path="Files/myexternaltable")
```

In this example, the table definition is created in the metastore (so the table is listed in the **Tables** user interface for the lakehouse), but the Parquet data files and JSON log files for the table are stored in the **Files** storage location (and will be shown in the **Files** node in the **Lakehouse explorer** pane).

You can also specify a fully qualified path for a storage location, like this:

```apache
df.write.format("delta").saveAsTable("myexternaltable", path="abfss://my_store_url..../myexternaltable")
```

Deleting an external table from the lakehouse metastore does not delete the associated data files.

### ii. **Creating table metadata**

While it's common to create a table from existing data in a dataframe, there are often scenarios where you want to create a table definition in the metastore that will be populated with data in other ways.

#### 1\. Use the DeltaTableBuilder API

```apache
from delta.tables import *

DeltaTable.create(spark) \
  .tableName("products") \
  .addColumn("Productid", "INT") \
  .addColumn("ProductName", "STRING") \
  .addColumn("Category", "STRING") \
  .addColumn("Price", "FLOAT") \
  .execute()
```

#### 2\. Use Spark SQL

##### a. Managed table

```apache
%%sql

CREATE TABLE salesorders
(
    Orderid INT NOT NULL,
    OrderDate TIMESTAMP NOT NULL,
    CustomerName STRING,
    SalesTotal FLOAT NOT NULL
)
USING DELTA
```

##### b. External table

```apache
%%sql

CREATE TABLE MyExternalTable
USING DELTA
LOCATION 'Files/mydata'
```

When creating an external table, the schema of the table is determined by the Parquet files containing the data in the specified location. This approach can be useful when you want to create a table definition that references data that has already been saved in delta format, or based on a folder where you expect to ingest data in delta format.

### iii. **Saving data in delta format**

So far you've seen how to save a dataframe as a delta table (creating both the table schema definition in the metastore and the data files in delta format) and how to create the table definition (which creates the table schema in the metastore without saving any data files). A third possibility is to save data in delta format without creating a table definition in the metastore. This approach can be useful when you want to persist the results of data transformations performed in Spark in a file format over which you can later "overlay" a table definition or process directly by using the delta lake API.

For example, the following PySpark code saves a dataframe to a new folder location in *delta* format:

```apache
delta_path = "Files/mydatatable"
df.write.format("delta").save(delta_path)
```

After saving the delta file, the path location you specified includes Parquet files containing the data and a *delta*log folder containing the transaction logs for the data.

Any modifications made to the data through the delta lake API or in an external table that is subsequently created on the folder will be recorded in the transaction logs.

You can replace the contents of an existing folder with the data in a dataframe by using the overwrite mode, as shown here:

```apache
new_df.write.format("delta").mode("overwrite").save(delta_path)
```

You can also add rows from a dataframe to an existing folder by using the append mode:

```apache
new_rows_df.write.format("delta").mode("append").save(delta_path)
```

## 4\. Work with delta tables in Spark

You can work with delta tables (or delta format files) to retrieve and modify data in multiple ways.

### i. **Using Spark SQL**

work with data in delta tables in Spark is to use Spark SQL, **spark.sql** library

```apache
spark.sql("INSERT INTO products VALUES (1, 'Widget', 'Accessories', 2.99)")
```

```apache
%%sql

UPDATE products
SET Price = 2.49 WHERE ProductId = 1;
```

### ii. Use the Delta API

When you want to work with delta files rather than catalog tables, it may be simpler to use the Delta Lake API. You can create an instance of a DeltaTable from a folder location containing files in delta format, and then use the API to modify the data in the table.

```apache
from delta.tables import *
from pyspark.sql.functions import *

# Create a DeltaTable object
delta_path = "Files/mytable"
deltaTable = DeltaTable.forPath(spark, delta_path)

# Update the table (reduce price of accessories by 10%)
deltaTable.update(
    condition = "Category == 'Accessories'",
    set = { "Price": "Price * 0.9" })
```

### iii. Use time travel to work with table versioning

Modifications made to delta tables are logged in the transaction log for the table. You can use the logged transactions to view the history of changes made to the table and to retrieve older versions of the data (known as time travel)

#### a. Managed table history's

To see the history of a table, you can use the DESCRIBE SQL command as shown here.

```apache
%%sql

DESCRIBE HISTORY products
```

#### b. External table history's

To see the history of an external table, you can specify the folder location instead of the table name.

```apache
%%sql

DESCRIBE HISTORY 'Files/mytable'
```

#### c retrieve version of the data by reading the delta file location into a dataframe using versionAsOf & timestampAsOf

You can retrieve data from a specific version of the data by reading the delta file location into a dataframe, specifying the version required as a versionAsOf option:

```apache
df = spark.read.format("delta").option("versionAsOf", 0).load(delta_path)
```

Alternatively, you can specify a timestamp by using the timestampAsOf option:

```apache
df = spark.read.format("delta").option("timestampAsOf", '2022-01-01').load(delta_path)
```

## 5\. Use delta tables with streaming data

All of the data we've explored up to this point has been static data in files.

However, many data analytics scenarios involve streaming data that must be processed in near real time.

For example, you might need to capture readings emitted by internet-of-things (IoT) devices and store them in a table as they occur.

### i. Spark Structured Streaming

A typical stream processing solution involves constantly reading a stream of data from a source, optionally processing it to select specific fields, aggregate and group values, or otherwise manipulate the data, and writing the results to a sink.

Spark includes native support for streaming data through Spark Structured Streaming, an API that is based on a boundless dataframe in which streaming data is captured for processing.

A Spark Structured Streaming dataframe can read data from many different kinds of streaming source, including network ports, real time message brokering services such as Azure Event Hubs or Kafka, or file system locations.

### ii. Streaming with delta tables

You can use a delta table as a source or a sink for Spark Structured Streaming.

For example, you could capture a stream of real time data from an IoT device and write the stream directly to a delta table as a sink - enabling you to query the table to see the latest streamed data. Or, you could read a delta as a streaming source, enabling you to constantly report new data as it is added to the table.

#### 1\. Using a delta table as a streaming source

In the following PySpark example, a delta table is used to store details of Internet sales orders.

A stream is created that reads data from the table folder as new data is appended.

```apache
from pyspark.sql.types import *
from pyspark.sql.functions import *

# Load a streaming dataframe from the Delta Table
stream_df = spark.readStream.format("delta") \
    .option("ignoreChanges", "true") \
    .load("Files/delta/internetorders")

# Now you can process the streaming data in the dataframe
# for example, show it:
stream_df.show()
```

#### 2\. Using a delta table as a streaming sink

In the following PySpark example, a stream of data is read from JSON files in a folder.

The JSON data in each file contains the status for an IoT device in the format `{"device":"Dev1","status":"ok"}` New data is added to the stream whenever a file is added to the folder.

The input stream is a boundless dataframe, which is then written in delta format to a folder location for a delta table.

```apache
from pyspark.sql.types import *
from pyspark.sql.functions import *

# Create a stream that reads JSON data from a folder
inputPath = 'Files/streamingdata/'
jsonSchema = StructType([
    StructField("device", StringType(), False),
    StructField("status", StringType(), False)
])
stream_df = spark.readStream.schema(jsonSchema).option("maxFilesPerTrigger", 1).json(inputPath)

# Write the stream to a delta table
table_path = 'Files/delta/devicetable'
checkpoint_path = 'Files/delta/checkpoint'
delta_stream = stream_df.writeStream.format("delta").option("checkpointLocation", checkpoint_path).start(table_path)
```

The checkpointLocation option is used to write a checkpoint file that tracks the state of the stream processing. This file enables you to recover from failure at the point where stream processing left off.

After the streaming process has started, you can query the Delta Lake table to which the streaming output is being written to see the latest data. For example, the following code creates a catalog table for the Delta Lake table folder and queries it:

```apache
%%sql

CREATE TABLE DeviceTable
USING DELTA
LOCATION 'Files/delta/devicetable';

SELECT device, status
FROM DeviceTable;
```

To stop the stream of data being written to the Delta Lake table, you can use the stop method of the streaming query:

```apache
delta_stream.stop()
```

## 6\. Exercise - Use delta tables in Apache Spark

Tables in a Microsoft Fabric lakehouse are based on the open source Delta Lake format for Apache Spark. Delta Lake adds support for relational semantics for both batch and streaming data operations, and enables the creation of a Lakehouse architecture in which Apache Spark can be used to process and query data in tables that are based on underlying files in a data lake.

### i. Create a workspace

### ii. Create a lakehouse and upload data

### iii. Explore data in a dataframe

```apache
df = spark.read.format("csv").option("header","true").load("Files/products/products.csv")
# df now is a Spark DataFrame containing CSV data from "Files/products/products.csv".
display(df)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712646631106/6bc3af34-6119-4a95-86a8-14239d1d79b6.png)

### iv. Create delta tables

#### 1\. Create a managed table

```apache
df.write.format("delta").saveAsTable("managed_products")
```

#### 2\. Create an external table

```apache
df.write.format("delta").saveAsTable("external_products", path="abfs_path/external_products")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712651801381/b3926244-07f8-4211-83ad-93f61d7d6a06.png)

#### 3 Compare managed and external tables

```apache
%%sql

DESCRIBE FORMATTED managed_products;
```

In the results, view the Location property for the table, which should be a path to the OneLake storage for the lakehouse ending with /Tables/managed\_products (you may need to widen the Data type column to see the full path).

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712653224378/29bd09ea-dbc7-4d73-a288-771eaaaf6841.png)

```apache
%%sql

DESCRIBE FORMATTED external_products;
```

In the results, view the Location property for the table, which should be a path to the OneLake storage for the lakehouse ending with /Files/external\_products (you may need to widen the Data type column to see the full path).

The files for managed table are stored in the Tables folder in the OneLake storage for the lakehouse. In this case, a folder named managed\_products has been created to store the Parquet files and delta\_log folder for the table you created.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712653137816/b8ecfac9-55fd-4bba-bcc5-7623579449af.png)

drop

```apache
%%sql

DROP TABLE managed_products;
DROP TABLE external_products;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712655068907/a5886720-0354-4242-9a76-6d5094362254.png)

#### 4\. Use SQL to create a table

```apache
%%sql

CREATE TABLE products
USING DELTA
LOCATION 'Files/external_products';
```

In the Lakehouse explorer pane, in the … menu for the Tables folder, select Refresh. Then expand the Tables node and verify that a new table named products is listed. Then expand the table to verify that its schema matches the original dataframe that was saved in the external\_products folder.

```apache
%%sql

SELECT * FROM products;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712655536956/349655ca-1c86-4833-a830-4e197ee321a2.png)

### v. Explore table versioning

```apache
%%sql

UPDATE products
SET ListPrice = ListPrice * 0.9
WHERE Category = 'Mountain Bikes';
```

show the history of transactions recorded for the table

```apache
%%sql

DESCRIBE HISTORY products;
```

veversionAsOf

```apache
delta_table_path = 'Files/external_products'

# Get the current data
current_data = spark.read.format("delta").load(delta_table_path)
display(current_data)

# Get the version 0 data
original_data = spark.read.format("delta").option("versionAsOf", 0).load(delta_table_path)
display(original_data)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712656051060/c2b51d16-12fc-468d-b614-fbc1adee661e.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712656052736/f9e4fdaf-eef3-4627-bcca-090f642fce3c.png)

### vi. Use delta tables for streaming data

Delta lake supports streaming data. Delta tables can be a sink or a source for data streams created using the Spark Structured Streaming API.

In this example, you’ll use a delta table as a sink for some streaming data in a simulated internet of things (IoT) scenario.

```apache
from notebookutils import mssparkutils
from pyspark.sql.types import *
from pyspark.sql.functions import *

# Create a folder
inputPath = 'Files/data/'
mssparkutils.fs.mkdirs(inputPath)

# Create a stream that reads data from the folder, using a JSON schema
jsonSchema = StructType([
StructField("device", StringType(), False),
StructField("status", StringType(), False)
])
iotstream = spark.readStream.schema(jsonSchema).option("maxFilesPerTrigger", 1).json(inputPath)

# Write some event data to the folder
device_data = '''{"device":"Dev1","status":"ok"}
{"device":"Dev1","status":"ok"}
{"device":"Dev1","status":"ok"}
{"device":"Dev2","status":"error"}
{"device":"Dev1","status":"ok"}
{"device":"Dev1","status":"error"}
{"device":"Dev2","status":"ok"}
{"device":"Dev2","status":"error"}
{"device":"Dev1","status":"ok"}'''
mssparkutils.fs.put(inputPath + "data.txt", device_data, True)
print("Source stream created...")
```

This code writes the streaming device data in delta format to a folder named iotdevicedata. Because the path for the folder location in the Tables folder, a table will automatically be created for it.

```apache
# Write the stream to a delta table
delta_stream_table_path = 'Tables/iotdevicedata'
checkpointpath = 'Files/delta/checkpoint'
deltastream = iotstream.writeStream.format("delta").option("checkpointLocation", checkpointpath).start(delta_stream_table_path)
print("Streaming to delta sink...")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712656720817/a28e6e23-e1b4-4307-97f6-fe11f35ec108.png)

code queries the IotDeviceData table, which contains the device data from the streaming source.

```apache
%%sql

SELECT * FROM IotDeviceData;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712656813042/ceee2f3b-1fb0-43bb-8865-5eac65d8d893.png)

code writes more hypothetical device data to the streaming source.

```apache
# Add more data to the source stream
more_data = '''{"device":"Dev1","status":"ok"}
{"device":"Dev1","status":"ok"}
{"device":"Dev1","status":"ok"}
{"device":"Dev1","status":"ok"}
{"device":"Dev1","status":"error"}
{"device":"Dev2","status":"error"}
{"device":"Dev1","status":"ok"}'''

mssparkutils.fs.put(inputPath + "more-data.txt", more_data, True)
```

This code queries the IotDeviceData table again, which should now include the additional data that was added to the streaming source.

```apache
%%sql

SELECT * FROM IotDeviceData;
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712657309744/9ca87fbb-97d9-4386-b12f-10aef0898214.png)

This code stops the stream.

```apache
deltastream.stop()
```

### vii. Clean up resources

## 7\. Knowledge check

Which of the following descriptions best fits Delta Lake?

A relational storage layer for Spark that supports tables based on Parquet files.

Delta Lake provides a relational storage layer in which you can create tables based on Parquet files in a data lake.

You've loaded a Spark dataframe with data, that you now want to use in a delta table. What format should you use to write the dataframe to storage?

Storing a dataframe in DELTA format creates parquet files for the data and the transaction log metadata necessary for Delta Lake tables.

You have a managed table based on a folder that contains data files in delta format. If you drop the table, what happens?

The life-cycle of the metadata and data for a managed table are the same.

## 8\. Summary

Delta Lake is a technology that adds relational database semantics to Apache Spark. Tables in a Microsoft Fabric lakehouse are based on Delta Lake, enabling you to take advantage of many advanced features and techniques through the Delta Lake API.

## **Learning objectives**

Delta Lake, Delta table in lakehouse

Managed table, External tables

Creating table metadata

dataframe to a new folder location in delta format

delta tables (or delta format files) to retrieve and modify data

history of a Managed & External table, you can use the DESCRIBE SQL command

retrieve version of the data by reading the delta file location into a dataframe using versionAsOf & timestampAsOf

Spark Structured Streaming API

delta table as a streaming source & sink.

Create a managed table & External tables

delta tables for streaming data

In this module, you'll learn how to:

* Understand Delta Lake and delta tables in Microsoft Fabric
    
* Create and manage delta tables using Spark
    
* Use Spark to query and transform data in delta tables
    
* Use delta tables with Spark structured streaming
    

# V. Use Data Factory pipelines in Microsoft Fabric

Microsoft Fabric includes Data Factory capabilities, including the ability to create pipelines that orchestrate data ingestion and transformation tasks.

## 1\. Introduction

Data pipelines define a sequence of activities that orchestrate an overall process, usually by extracting data from one or more sources and loading it into a destination; often transforming it along the way.

Pipelines are commonly used to automate *extract*, *transform*, and *load* (ETL) processes that ingest transactional data from operational data stores into an analytical data store, such as a lakehouse or data warehouse.

They use the same architecture of connected activities to define a process that can include multiple kinds of data processing tasks and control flow logic.

You can run pipelines interactively in the Microsoft Fabric user interface, or schedule them to run automatically.

## 2\. Understand pipelines

Pipelines in Microsoft Fabric encapsulate a sequence of *activities* that perform data movement and processing tasks.

You can use a pipeline to define data transfer and transformation activities, and orchestrate these activities through control flow activities that manage branching, looping, and other typical processing logic.

The graphical pipeline *canvas* in the Fabric user interface enables you to build complex pipelines with minimal or no coding required.

### i. Core pipeline concepts

#### 1 Activities

Activities are the executable tasks in a pipeline. You can define a flow of activities by connecting them in a sequence. The outcome of a particular activity (success, failure, or completion) can be used to direct the flow to the next activity in the sequence.

There are two broad categories of activity in a pipeline.

##### Data transformation activities -

activities that encapsulate data transfer operations, including simple Copy Data activities that extract data from a source and load it to a destination, and more complex Data Flow activities that encapsulate dataflows (Gen2) that apply transformations to the data as it is transferred. Other data transformation activities include Notebook activities to run a Spark notebook, Stored procedure activities to run SQL code, Delete data activities to delete existing data, and others.

##### Control flow activities -

activities that you can use to implement loops, conditional branching, or manage variable and parameter values. The wide range of control flow activities enables you to implement complex pipeline logic to orchestrate data ingestion and transformation flow.

#### 2 Parameters

Pipelines can be parameterized, enabling you to provide specific values to be used each time a pipeline is run. For example, you might want to use a pipeline to save ingested data in a folder, but have the flexibility to specify a folder name each time the pipeline is run.

Using parameters increases the reusability of your pipelines, enabling you to create flexible data ingestion and transformation processes.

#### 3 Pipeline runs

Each time a pipeline is executed, a data pipeline run is initiated. Runs can be initiated on-demand in the Fabric user interface or scheduled to start at a specific frequency. Use the unique run ID to review run details to confirm they completed successfully and investigate the specific settings used for each execution.

## 3\. Use the Copy Data activity

Many pipelines consist of a single **Copy Data** activity that is used to ingest data from an external source into a lakehouse file or table.

You can also combine the Copy Data activity with other activities to create a repeatable data ingestion process - for example by using a Delete data activity to remove existing data, a Copy Data activity to replace the deleted data with a file containing data from an external source, and a Notebook activity to run Spark code that transforms the data in the file and loads it into a table.

### i. The Copy Data tool

### ii. Copy Data activity settings

### iii. When to use the Copy Data activity

Use the Copy Data activity when you need to copy data directly between a supported source and destination without applying any transformations, or when you want to import the raw data and apply transformations in later pipeline activities.

If you need to apply transformations to the data as it is ingested, or merge data from multiple sources, consider using a Data Flow activity to run a dataflow (Gen2). You can use the Power Query user interface to define a dataflow (Gen2) that includes multiple transformation steps, and include it in a pipeline.

## 4\. Use pipeline templates

You can define pipelines from any combination of activities you choose, enabling to create custom data ingestion and transformation processes to meet your specific needs. However, there are many common pipeline scenarios for which Microsoft Fabric includes predefined pipeline templates that you can use and customize as required.

## 5\. Run and monitor pipelines

When you have completed a pipeline, you can use the Validate option to check that is configuration is valid, and then either run it interactively or specify a schedule.

## 6\. Exercise - Ingest data with a pipeline

### i. Create a workspace

### ii. Create a lakehouse

**new\_data**

### iii. Create a pipeline

Ingest Sales Data

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712673664693/ef39198d-6b08-409a-84b2-70bb4f654a0f.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712673725921/e8c80e2d-1faf-4c5f-8e95-b315315ff110.png)

In LH:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712673754114/9ce73d42-fe8b-472c-bed9-a55533039675.png)

### iv. Create a notebook

In the … menu for the cell (at its top-right) select Toggle parameter cell. This configures the cell so that the variables declared in it are treated as parameters when running the notebook from a pipeline.

This code loads the data from the sales.csv file that was ingested by the Copy Data activity, applies some transformation logic, and saves the transformed data as a table - appending the data if the table already exists.

```apache
from spark.sql.functions import *

# Read the new sales data
df = spark.read.format("csv").option("header","true").load("Files/new_data/*.csv")

## Add month and year columns
df = df.withColumn("Year",year(col("OrderDate"))).withColumn("Month",month(col("OrderDate")))

# Derive FirstName and LastName columns
df = df.withColumn("FirstName",split(col("CustomerName")," ").getItem(0)).withColumn("LastName",split(col("CustomerName")," ").getItem(1))

# Filter and reorder columns
df = df["SalesOrderNumber", "SalesOrderLineNumber", "OrderDate", "Year", "Month", "FirstName", "LastName", "EmailAddress", "Item", "Quantity", "UnitPrice", "TaxAmount"]

# Load the data into a table
df.write.format("delta").mode("append").saveAsTable("table_name")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712677878712/10c6cc28-ca38-4632-8cbe-b59833c763dd.png)

### v. Modify the pipeline

Now that you’ve implemented a notebook to transform data and load it into a table, you can incorporate the notebook into a pipeline to create a reusable ETL process.

The table\_name parameter will be passed to the notebook and override the default value assigned to the table\_name variable in the parameters cell.

In this exercise, you implemented a data ingestion solution that uses a pipeline to copy data to your lakehouse from an external source, and then uses a Spark notebook to transform the data and load it into a table.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712678767671/af07710f-bde1-45d3-bd5c-f3da5663523c.png)

### vi. Clean up resources

## 7\. Knowledge check

What is a data pipeline?

A sequence of activities to orchestrate a data ingestion or transformation process

A pipeline consists of activities to ingest and transform data.

You want to use a pipeline to copy data to a folder with a specified name for each run. What should you do?

Add a parameter to the pipeline and use it to specify the folder name for each run

Using a parameter enables greater flexibility for your pipeline.

You have previously run a pipeline containing multiple activities. What's the best way to check how long each individual activity took to complete?

View the run details in the run history.

The run history details show the time taken for each activity - optionally as a Gantt chart.

## 8\. Summary

With Microsoft Fabric, you can create pipelines that encapsulate complex data ingestion and transformation processes. Pipelines provide an effective way to orchestrate data processing tasks that can be run on-demand or at scheduled intervals.

## **Learning objectives**

In this module, you'll learn how to:

* Describe pipeline capabilities in Microsoft Fabric
    
* Use the Copy Data activity in a pipeline
    
* Create pipelines based on predefined templates
    
* Run and monitor pipelines
    

implemented a data ingestion solution that uses a pipeline to copy data to lakehouse from an external source, and then a Spark notebook to transform the data and load it into a table.

# VI. Ingest Data with Dataflows Gen2 in Microsoft Fabric

Data ingestion is crucial in analytics.

Microsoft Fabric's Data Factory offers Dataflows for visually creating multi-step data ingestion and transformation using Power Query Online.

## 1\. Introduction

Dataflows Gen2 are used to ingest and transform data from multiple sources, and then land the cleansed data to another destination.

They can be incorporated into data pipelines for additional data movement, and used as a data source in Power BI.

## 2\. Understand Dataflows Gen2 in Microsoft Fabric

By using Dataflows Gen2, you can connect to the various data sources, and then prep and transform the data.

To allow access, you can land the data directly into your Lakehouse or use a data pipeline for other destinations.

### i. What is a dataflow?

Dataflows are a type of cloud-based ETL (Extract, Transform, Load) tool for building and executing scalable data transformation processes.

Dataflows Gen2 allow you to extract data from various sources, transform it using a wide range of transformation operations, and load it into a destination. Using Power Query Online also allows for a visual interface to perform these tasks.

Fundamentally, a dataflow includes all of the transformations to reduce data prep time and then can be loaded into a new table, included in a Data Pipeline, or used as a data source by data analysts.

### ii. How to use Dataflows Gen2

Traditionally, data engineers spend significant time extracting, transforming, and loading data into a consumable format for downstream analytics.

The goal of Dataflows Gen2 is to provide an easy, reusable way to perform ETL tasks using Power Query Online.

If you only choose to use a Data Pipeline, you copy data, then use your preferred coding language to extract, transform, and load the data.

Alternatively, you can create a Dataflow Gen2 first to extract and transform the data. You can also load the data into a Lakehouse, and other destinations.

To perform other tasks or load data to a different destination after transformation, create a Data Pipeline and add the Dataflow Gen2 activity to your orchestration.

Another option might be to use a Data Pipeline and Dataflow Gen2 for ELT (Extract, Load, Transform) process.

For this order, you'd use a Pipeline to extract and load the data into your preferred destination, such as the Lakehouse.

Then you'd create a Dataflow Gen2 to connect to Lakehouse data to cleanse and transform data. In this case, you'd offer the Dataflow as a curated semantic model for data analysts to develop reports.

Dataflows allow you to promote reusable ETL logic that prevents the need to create more connections to your data source.

Dataflows offer a wide variety of transformations, and can be run manually, on a refresh schedule, or as part of a Data Pipeline orchestration.

### iii Benefits and limitations

There's more than one way to ETL or ELT data in Microsoft Fabric. Consider the benefits and limitations for using Dataflows Gen2.

Benefits:

* Extend data with consistent data, such as a standard date dimension table.
    
* Allow self-service users access to a subset of data warehouse separately.
    
* Optimize performance with dataflows, which enable extracting data once for reuse, reducing data refresh time for slower sources.
    
* Simplify data source complexity by only exposing dataflows to larger analyst groups.
    
* Ensure consistency and quality of data by enabling users to clean and transform data before loading it to a destination.
    
* Simplify data integration by providing a low-code interface that ingests data from various sources.
    

Limitations:

* Not a replacement for a data warehouse.
    
* Row-level security isn't supported.
    
* Fabric capacity workspace is required.
    

## 3\. Explore Dataflows Gen2 in Microsoft Fabric

In Microsoft Fabric, you can create a Dataflow Gen2 in the Data Factory workload or Power BI workspace, or directly in the lakehouse.

Since our scenario is focused on data ingestion, let's look at the **Data Factory** workload experience.

Dataflows Gen2 use Power Query Online to visualize transformations.

### **i. Power Query ribbon**

### **ii. Queries pane**

### **iii. Diagram view**

### **iv. Data Preview pane**

### **v. Query Settings pane**

In the Query settings pane, you can see a Data Destination field where you can set the Lakehouse as your destination

## 4\. Integrate Dataflows Gen2 and Pipelines in Microsoft Fabric

The combination of dataflows and pipelines is useful when you need to perform additional operations on the transformed data.

Data pipelines are easily created in the Data Factory and Data Engineering workloads. Pipelines are a common concept in data engineering and offer a wide variety of activities to orchestrate. Some common activities include:

* Copy data
    
* Incorporate Dataflow
    
* Add Notebook
    
* Get metadata
    
* Execute a script or stored procedure
    

Pipelines provide a visual way to complete activities in a specific order. You can use a dataflow for data ingestion and transformation, and landing into a Lakehouse using dataflows.

Then incorporate the dataflow into a pipeline to orchestrate extra activities, like execute scripts or stored procedures after the dataflow has completed.

## 5\. Exercise - Create and use a Dataflow Gen2 in Microsoft Fabric

In this module, we walked through a scenario where both data engineers and data analysts have a need to prepare data for consumption and expand semantic models.

We identified Dataflows Gen2 as the best solution for the data transformation steps.

In this exercise, you create and use a Dataflow Gen2 to ingest transformed data into a Lakehouse.

In Microsoft Fabric, Dataflows (Gen2) connect to various data sources and perform transformations in Power Query Online. They can then be used in Data Pipelines to ingest data into a lakehouse or other analytical store, or to define a dataset for a Power BI report.

This lab is designed to introduce the different elements of Dataflows (Gen2), and not create a complex solution that may exist in an enterprise.

### i. Create a workspace

### ii. Create a lakehouse

### iii. Create a Dataflow (Gen2) to ingest data

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712724285172/e9203a1a-e136-47d3-a971-01bc7c024555.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712724377025/766b5e4d-2a8c-44e3-8cc8-972f486fef76.png)

### iv. Add data destination for Dataflow

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712724925903/a727cde5-b06b-4ca1-a7af-f6823614752b.png)

### v. Add a dataflow to a pipeline

You can include a dataflow as an activity in a pipeline.

Pipelines are used to orchestrate data ingestion and processing activities, enabling you to combine dataflows with other kinds of operation in a single, scheduled process.

Pipelines can be created in a few different experiences, including Data Factory experience.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712725462098/26a9a9d7-1b14-483e-95eb-61d0c559c34d.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712725520699/7a33da5d-f206-4fd7-989d-6e0f8ccb9361.png)

### vi. Clean up resources

## 6\. Knowledge check

What is a Dataflow Gen2?

A way to import and transform data with Power Query Online.

Dataflow Gen2 allows you to get and transform data, then optionally ingest to a Lakehouse.

Which workload experience lets you create a Dataflow Gen2?

Data Factory.

Data Factory and Power BI workloads allow Dataflow Gen2 creation.

You need to connect to and transform data to be loaded into a Fabric Lakehouse and also loaded into a KQL Database for Real-time Analytics. You aren't comfortable using Spark notebooks, so decide to use Dataflows Gen2. How would you complete this task?

Connect to Data Factory workload &gt; Create Dataflows Gen2 to transform data &gt; Create Data pipeline to include your dataflow and then land data to a KQL Database.

These are the high-level steps to accomplish your task.

## 7\. Summary

With Microsoft Fabric, you can create Dataflows Gen2 to perform data integration for your Lakehouse, and optionally include the dataflow in a Data Pipeline as well.

In this module, you learned about Dataflows Gen2 and how to use them as part of your data integration process.

Power Query Online offers a visual interface to perform complex data transformations without writing any code.

## **Learning objectives**

In this module, you'll learn how to:

* Describe Dataflow Gen2 capabilities in Microsoft Fabric
    
* Create Dataflow Gen2 solutions to ingest and transform data
    
* Include a Dataflow Gen2 in a pipeline
    

# VII. Ingest data with Spark and Microsoft Fabric notebooks

Discover how to use Apache Spark and Python for data ingestion into a Microsoft Fabric lakehouse. Fabric notebooks provide a scalable and systematic solution.

## 1\. Introduction

Fabric notebooks offer the flexibility to extract, load, and transform external data into your lakehouse, adapting to your workflow.

Fabric notebooks are the best choice if you:

Handle large external data Need complex transformations.

By the end of this module, you'll be able to use Spark and Fabric notebooks to ingest external data into your lakehouse. You'll also learn fundamental transformations and optimization techniques for a more efficient ETL process.

## 2\. Connect to data with Spark

First, let's discuss what Fabric notebooks offer over the other ingestion options.

Unlike manual uploads, notebooks provide automation, ensuring a smooth and systematic approach.

Dataflows offer a UI experience; however, they aren't as performant with large semantic models.

Pipelines allow you to orchestrate the Copy Data, and may require dataflows or notebooks for transformations.

Therefore, notebooks provide a comprehensive, automated solution for ingestion and transformation.

### i. Explore Fabric notebooks

By default, Fabric notebooks use PySpark, which uses the Spark engine to allow a multi-threaded, distributed transaction for speedy processes.

You can use Html, Spark (Scala), Spark SQL, and SparkR (R) as well, however they may not have the full benefit of the distributed system.

### ii. Connect to external sources

connecting to Azure blob storage with Spark:

The PySpark code defines the parameters and constructs the connection path, then reads the data into a DataFrame and shows the data in the DataFrame.

```apache
# Azure Blob Storage access info
blob_account_name = "azureopendatastorage"
blob_container_name = "nyctlc"
blob_relative_path = "yellow"
blob_sas_token = "sv=2022-11-02&ss=bfqt&srt=c&sp=rwdlacupiytfx&se=2023-09-08T23:50:02Z&st=2023-09-08T15:50:02Z&spr=https&sig=abcdefg123456" 

# Construct the path for connection
wasbs_path = f'wasbs://{blob_container_name}@{blob_account_name}.blob.core.windows.net/{blob_relative_path}?{blob_sas_token}'

# Read parquet data from Azure Blob Storage path
blob_df = spark.read.parquet(wasbs_path)

# Show the Azure Blob DataFrame
blob_df.show()
```

### iii. Configure alternate authentication

The previous example connects to the source and reads the data into a DataFrame.

Depending on your source, you may need a different authentication type, such as Service Principal, OAuth, etc.

Here's an example connecting to an Azure SQL Database with a Service Principal:

```apache
# Placeholders for Azure SQL Database connection info
server_name = "your_server_name.database.windows.net"
port_number = 1433  # Default port number for SQL Server
database_name = "your_database_name"
table_name = "YourTableName" # Database table
client_id = "YOUR_CLIENT_ID"  # Service principal client ID
client_secret = "YOUR_CLIENT_SECRET"  # Service principal client secret
tenant_id = "YOUR_TENANT_ID"  # Azure Active Directory tenant ID


# Build the Azure SQL Database JDBC URL with Service Principal (Active Directory Integrated)
jdbc_url = f"jdbc:sqlserver://{server_name}:{port_number};database={database_name};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;Authentication=ActiveDirectoryIntegrated"

# Properties for the JDBC connection
properties = {
    "user": client_id, 
    "password": client_secret,  
    "driver": "com.microsoft.sqlserver.jdbc.SQLServerDriver",
    "tenantId": tenant_id  
}

# Read entire table from Azure SQL Database using AAD Integrated authentication
sql_df = spark.read.jdbc(url=jdbc_url, table=table_name, properties=properties)

# Show the Azure SQL DataFrame
sql_df.show()
```

## 3\. Write data into a lakehouse

Now that we've connected to data, we need to save it into the lakehouse. You can either save as a file or load as a Delta table.

### iv. **Write to a file**

Lakehouses support structured, semi-structured, and unstructured files.

Load as a parquet file or Delta table to take advantage of the Spark engine.

#### 1\. Write DataFrame to Parquet file format

```apache
# Write DataFrame to Parquet file format
parquet_output_path = "your_folder/your_file_name"
df.write.mode("overwrite").parquet(parquet_output_path)
print(f"DataFrame has been written to Parquet file: {parquet_output_path}")
```

#### 2\. Write DataFrame to Delta table

```apache
# Write DataFrame to Delta table
delta_table_name = "your_delta_table_name"
df.write.format("delta").mode("overwrite").saveAsTable(delta_table_name)
print(f"DataFrame has been written to Delta table: {delta_table_name}")
```

OneLake supports a wide variety of file formats, including many formats that are commonly used in Spark code - such as delimited text, JSON, Parquet, Avro, ORC, and others.

In most cases, Parquet is the preferred format because of its optimized columnar storage structure and efficient compression capabilities. Parquet is also the base format on which Delta tables in a lakehouse are based.

### v. Write to a Delta table

Delta tables are one of the key features of Fabric lakehouses. Easily ingest and load your external data into a Delta table via notebooks.

```apache
# Use format and save to load as a Delta table
table_name = "nyctaxi_raw"
filtered_df.write.mode("overwrite").format("delta").save(f"Tables/{table_name}")

# Confirm load as Delta table
print(f"Spark DataFrame saved to Delta table: {table_name}")
```

### vi. Optimize Delta table writes

Fabric notebooks easily scale for large data, therefore read and write optimization is key.

Consider these optimization functions for even more performant data ingestion.

#### 1\. V-Order

enables faster and more efficient reads by various compute engines, such as Power BI, SQL, and Spark.V-order applies special sorting, distribution, encoding, and compression on parquet files at write-time.

```apache
# Enable V-Order 
spark.conf.set("spark.sql.parquet.vorder.enabled", "true")
```

#### 2\. Optimize write

improves the performance and reliability by reducing the number of files written and increasing their size. It's useful for scenarios where the Delta tables have suboptimal or nonstandard file sizes, or where the extra write latency is tolerable.

```apache
# Enable automatic Delta optimized write
spark.conf.set("spark.microsoft.delta.optimizeWrite.enabled", "true")
```

## 4\. Consider uses for ingested data

You've now ingested raw data in the Fabric lakehouse, also known as the bronze layer of a Medallion architecture.

Before moving to the transformation and modeling steps, consider where to transform and how users interact with the data.

### i. Transform for different users

When you load data, it's a good idea to do some basic cleaning like removing duplicates, handling errors, converting null values, and getting rid of empty entries to ensure data quality and consistency.

Also thinking about the different people who use the data is crucial.

Data scientists usually prefer fewer changes so they can explore wide tables. They would likely want access to the raw ingested data. Fabric's Data Wrangler then let's them explore the data and generate transformation code for their specific needs.

Whereas Power BI data analysts may require more transformation and modeling before they can use the data. While Power BI can transform data, starting with well-prepared data allows analysts to develop reports and insights more efficiently.

## 5\. Exercise - Ingest data with Spark and Microsoft Fabric notebooks

In this lab, you'll create a Microsoft Fabric notebook and use PySpark to connect to an Azure Blob Storage path, then load the data into a lakehouse using write optimizations.

For this experience, you’ll build the code across multiple notebook code cells, which may not reflect how you will do it in your environment; however, it can be useful for debugging.

Because you’re also working with a sample dataset, the optimization doesn’t reflect what you may see in production at scale; however, you can still see improvement and when every millisecond counts, optimization is key.

### i. Create a workspace

### ii. Create workspace and lakehouse destination

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712752485033/aaa18188-0c52-4162-8e1f-f0020b45c4e9.png)

### iii. Create a Fabric notebook and load external data

Insert the following code into the code cell, which will:

* Declare parameters for connection string
    
* Build the connection string
    
* Read data into a DataFrame
    

#### 1\. Azure Blob Storage connection string:

```apache
 # Azure Blob Storage access info
 blob_account_name = "....."
 blob_container_name = "......."
 blob_relative_path = "......"
    
 # Construct connection path
 wasbs_path = f'wasbs://{blob_container_name}@{blob_account_name}.blob.core.windows.net/{blob_relative_path}'
 print(wasbs_path)
    
 # Read parquet data from Azure Blob Storage path
 blob_df = spark.read.parquet(wasbs_path)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712753081271/43ab4cc1-40ba-4257-9a55-e2e56d3520f3.png)

#### 2\. To write the data to a file, you now need that ABFS Path for your RawData folder.

```apache
# Declare file name    
file_name = "yellow_taxi"

# Construct destination path
output_parquet_path = f"**InsertABFSPathHere**/{file_name}"
print(output_parquet_path)

# Load the first 1000 rows as a Parquet file
blob_df.limit(1000).write.mode("overwrite").parquet(output_parquet_path)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712754093932/b8750cc8-4223-499d-b1bc-98b8fcfb3258.png)

### iv. Transform and load data to a Delta table

Likely, your data ingestion task doesn’t end with only loading a file.

Delta tables in a lakehouse allows scalable, flexible querying and storage, so we’ll create one as well.

* This will add a timestamp column **dataload\_datetime** to log when the data was loaded to a Delta table
    
* Filter NULL values in **storeAndFwdFlag**
    
* Load filtered data into a Delta table
    
* Display a single row for validation
    

```apache
 from pyspark.sql.functions import col, to_timestamp, current_timestamp, year, month
    
 # Read the parquet data from the specified path
 raw_df = spark.read.parquet(output_parquet_path)   
    
 # Add dataload_datetime column with current timestamp
 filtered_df = raw_df.withColumn("dataload_datetime", current_timestamp())
    
 # Filter columns to exclude any NULL values in storeAndFwdFlag
 filtered_df = filtered_df.filter(raw_df["storeAndFwdFlag"].isNotNull())
    
 # Load the filtered data into a Delta table
 table_name = "yellow_taxi"  # Replace with your desired table name
 filtered_df.write.format("delta").mode("append").saveAsTable(table_name)
    
 # Display results
 display(filtered_df.limit(1))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712766663131/c74d5152-139b-45e4-89d1-33edb15871f5.png)

### v. Optimize Delta table writes

You’re probably using big data in your organization and that’s why you chose Fabric notebooks for data ingestion, so let’s also cover how to optimize the ingestion and reads for your data. First, we’ll repeat the steps to transform and write to a Delta table with write optimizations included.

```apache
 from pyspark.sql.functions import col, to_timestamp, current_timestamp, year, month
 
 # Read the parquet data from the specified path
 raw_df = spark.read.parquet(output_parquet_path)    

 # Add dataload_datetime column with current timestamp
 opt_df = raw_df.withColumn("dataload_datetime", current_timestamp())
    
 # Filter columns to exclude any NULL values in storeAndFwdFlag
 opt_df = opt_df.filter(opt_df["storeAndFwdFlag"].isNotNull())
    
 # Enable V-Order
 spark.conf.set("spark.sql.parquet.vorder.enabled", "true")
    
 # Enable automatic Delta optimized write
 spark.conf.set("spark.microsoft.delta.optimizeWrite.enabled", "true")
    
 # Load the filtered data into a Delta table
 table_name = "yellow_taxi_opt"  # New table name
 opt_df.write.format("delta").mode("append").saveAsTable(table_name)
    
 # Display results
 display(opt_df.limit(1))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712767004112/e70a9031-8962-4bb9-a062-cd7d25506c4c.png)

Now, take note of the run times for both code blocks. Your times will vary, but you can see a clear performance boost with the optimized code.

### vi. Analyze Delta table data with SQL queries

```apache
 # Load table into df
 delta_table_name = "yellow_taxi"
 table_df = spark.read.format("delta").table(delta_table_name)
    
 # Create temp SQL table
 table_df.createOrReplaceTempView("yellow_taxi_temp")
    
 # SQL Query
 table_df = spark.sql('SELECT * FROM yellow_taxi_temp')
    
 # Display 10 results
 display(table_df.limit(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712769251179/af852c12-35cd-4826-9fd3-5f283f40e994.png)

opt table:

```apache
 # Load table into df
 delta_table_name = "yellow_taxi_opt"
 opttable_df = spark.read.format("delta").table(delta_table_name)
    
 # Create temp SQL table
 opttable_df.createOrReplaceTempView("yellow_taxi_opt")
    
 # SQL Query to confirm
 opttable_df = spark.sql('SELECT * FROM yellow_taxi_opt')
    
 # Display results
 display(opttable_df.limit(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712769249705/5dee7ecc-b4a1-468f-8d2a-f0a27153453a.png)

Notice the execution time difference between querying the table with non optimized data and a table with optimized data.

### vii. Clean up resources

## 6\. Knowledge check

What is the benefit of using Fabric notebooks over manual uploads for data ingestion?

Notebooks provide an automated approach to ingestion and transformation.

What is the purpose of V-Order and Optimize Write in Delta tables?

V-Order and Optimize Write enhance Delta tables by sorting data and creating fewer, larger Parquet files.

Why consider basic data cleansing when loading data into Fabric lakehouse?

Basic cleaning is done to ensure data quality and consistency before moving on to transformation and modeling steps.

## 7\. Summary

In this module, you learned how to use Spark and Fabric notebooks to ingest data into a lakehouse.

Fabric notebooks offer automation and a comprehensive solution for ingestion and transformation. Fabric notebooks use a Spark engine to allow a multi-threaded, distributed transaction for speedy processes. Lakehouses support structured, semi-structured, and unstructured files and Delta tables. Optimize Delta table configuration for more performant reads and writes.

Before moving to the transformation and modeling steps, consider where to transform and how users interact with the data.

## **Learning objectives**

By the end of this module, you’ll be able to:

* Ingest external data to Fabric lakehouses using Spark
    
* Configure external source authentication and optimization
    
* Load data into lakehouse as files or as Delta tables
    
* Optimize Delta table writes: V-Order, Optimize write
    

# VIII. Organize a Fabric lakehouse using medallion architecture design

Explore the potential of the medallion architecture design in Microsoft Fabric. Organize and transform your data across Bronze, Silver, and Gold layers of a lakehouse for optimized analytics.

## 1\. Introduction

The Fabric lakehouse, blending data lakes and data warehouses, offers an ideal platform to manage and analyze this data.

The medallion architecture has become a standard across the industry for lakehouse-based analytics.

In this module, you'll explore and build a medallion architecture for Fabric lakehouses, query and report on data in your Fabric lakehouse, and describe best practices for security and governance of your Fabric lakehouse.

## 2\. Describe medallion architecture

Data lakehouses in Fabric are built on the [Delta Lake format](https://learn.microsoft.com/en-us/azure/synapse-analytics/spark/apache-spark-what-is-delta-lake), [which natively s](https://learn.microsoft.com/en-us/azure/synapse-analytics/spark/apache-spark-what-is-delta-lake)upports ACID (Atomicity, Consistency, Isolation, Durability) transactions.

Within this framework, the *medallion architecture* is a recommended data design pattern used to organize data in a lakehouse logically.

It aims to improve data quality as it moves through different layers. The architecture typically has three layers – bronze (raw), silver (validated), and gold (enriched), each representing higher data quality levels.

Some people also call it a "multi-hop" architecture, meaning that data can move between layers as needed.

### i. Understand the medallion architecture format

#### 1\. Bronze layer

The bronze or raw layer of the medallion architecture is the first layer of the lakehouse.

It's the landing zone for all data, whether it's structured, semi-structured, or unstructured.

The data is stored in its original format, and no changes are made to it.

#### 2\. Silver layer

The silver or validated layer is the second layer of the lakehouse. It's where you'll validate and refine your data.

Typical activities in the silver layer include combining and merging data and enforcing data validation rules like removing nulls and deduplicating.

The silver layer can be thought of as a central repository across an organization or team, where data is stored in a consistent format and can be accessed by multiple teams.

In the silver layer you're cleaning your data enough so that everything is in one place and ready to be refined and modeled in the gold layer.

#### 3\. Gold layer

The gold or enriched layer is the third layer of the lakehouse.

In the gold layer, data undergoes further refinement to align with specific business and analytics needs. This could involve aggregating data to a particular granularity, such as daily or hourly, or enriching it with external information.

Once the data reaches the gold stage, it becomes ready for use by downstream teams, including analytics, data science, or MLOps.

### ii. Customize your medallion architecture

Depending on your organization's specific use case, you may have a need for more layers.

For example, you might have an additional "raw" layer for landing data in a specific format before it's transformed into the bronze layer. Or you might have a "platinum" layer for data that's been further refined and enriched for a specific use case.

Regardless of the names and number of layers, the medallion architecture is flexible and can be tailored to meet your organization's particular requirements.

### iii. Move data across layers in Fabric

Moving data across medallion layers refines, organizes, and prepares it for downstream data activities.

Within Fabric's lakehouse, there's more than one way to move data between layers, ensuring that you can choose the method that works for your team.

There are a few things to consider when deciding how to move and transform data across layers.

* How much data are you working with?
    
* How complex are the transformations you need to make?
    
* How often will you need to move data between layers?
    
* What tools are you most comfortable with?
    

Understanding the difference between data transformation and data orchestration helps you select the right tools for the job within Fabric.

#### 1\. Data transformation

Data transformation involves altering the structure or content of data to meet specific requirements.

Tools for data transformation in Fabric include Dataflows (Gen2) and notebooks.

##### i. Dataflows (Gen2)

Dataflows are a great option for smaller semantic models and simple transformations. Notebooks are a better option for larger semantic models and more complex transformations.

##### i. Notebooks

Notebooks also allow you to save your transformed data as a managed Delta table in the lakehouse, ready for reporting.

#### 2\. Data orchestration

Data orchestration refers to the coordination and management of multiple data-related processes, ensuring they work together to achieve a desired outcome.

The primary tool for data orchestration in Fabric is pipelines.

##### i. Pipeline

A pipeline is a series of steps that move data from one place to another, in this case, from one layer of the medallion architecture to the next.

Pipelines can be automated to run on a schedule or triggered by an event.

## 3\. Implement a medallion architecture in Fabric

Now that you have a solid understanding of the medallion architecture, let's explore how to put it into action within Fabric.

### **i. Set up the foundation**:

Create your Fabric lakehouse. You can use the same lakehouse for multiple medallion architectures, or alternatively, you can use different lakehouses and even different lakehouses in different workspaces, depending on your use case. We'll dive more into this in unit 5.

### **ii.** Design your architecture

Create your architecture layout, define your layers, and determine how data will flow between them.

The most straightforward implementation is to use Bronze as the raw layer, Silver as the curated layer, and gold as the presentation layer.

Your gold layer should be modeled in a star schema and optimized for reporting.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712811392546/147bd5f9-edb1-4084-af56-60d316791891.png)

### **iii.** Ingest data into bronze

Determine how you'll ingest data into your bronze layer.

You can do this using pipelines, dataflows, or notebooks.

### **iv.** Transform data and load to silver

Determine how you'll transform data in your silver layer. You can do this using dataflows or notebooks.

Transformations at the silver level should be focused on data quality and consistency, not on data modeling.

### **v.** Generate a gold layer

Determine how you'll generate your gold layer(s), what it will contain, and how it will be used.

* The gold layer is where you'll model your data for reporting using a dimensional model. Here you'll establish relationships, define measures, and incorporate any other elements essential for effective reporting.
    
* You can have multiple gold layers for different audiences or domains. For example, you might have a gold layer for your finance team and a separate gold layer for your sales team. You might also have a gold layer for your data scientists that is optimized for machine learning.
    
* Depending on your needs, you might also use a Data Warehouse as your gold layer. See [Get started with data warehouses in Microsoft Fabric to learn more.](https://learn.microsoft.com/en-us/training/modules/get-started-data-warehouse/)
    
* In Fabric, you can transform your data using dataflows or notebooks, and then load it into a gold Delta table in the lakehouse. You can then connect to the Delta table using a SQL analytics endpoint and use SQL to model your data for reporting. Alternatively, you can use Power BI to connect to the SQL analytics endpoint of the gold layer and model your data for reporting.
    

### **vi. Enable downstream consumption**

Determine how you'll enable downstream consumption of your data. You can do this using workspace or item permissions, or by connecting to the SQL analytics endpoint.

## 4\. Query and report on data in your Fabric lakehouse

Now that your medallion architecture is in place, data teams and the business can start using it to query and report on data.

Fabric has several tools and technologies that enable you to query and report on data in your lakehouse, including SQL analytics endpoints and Direct Lake mode in Power BI semantic models.

### **i.** Query data in your lakehouse

Teams can use SQL to explore and query data in the gold layer.

You can analyze data in delta tables at any layer of the medallion architecture using the T-SQL language, save functions, generate views, and apply SQL security.

You can also use the SQL analytics endpoint to connect to your lakehouse from third-party tools and applications.

The SQL analytics endpoint in Fabric enables you to write queries, manage the semantic model, and query data using the new visual query experience.

### Note:

The SQL analytics endpoint operates in **read-only** mode over lakehouse delta tables. To modify data in your lakehouse you can use dataflows, notebooks, or pipelines.

In addition to using the SQL analytics endpoint for data exploration, you can also create a Power BI semantic model in Direct Lake mode to query data in your lakehouse.

When you create a lakehouse, the system also provisions an associated default semantic model. The default semantic model is a semantic model with metrics on top of lakehouse data.

### Direct Lake mode

When a Power BI report displays a data element, it fetches it from the underlying semantic model, which in turn accesses a lakehouse for data retrieval.

To enhance efficiency, the default semantic model preloads frequently requested data into the cache and updates it as necessary.

This approach is called Direct Lake mode and truly gives you the best of both worlds: the performance of a semantic model and the freshness of lakehouse data.

### ii. Tailor your medallion layers for different needs

Tailoring medallion layers to different needs allows you to optimize data processing and access for specific use cases. By customizing these layers, you can ensure that each layer's structure and organization align with the requirements of different user groups, improving performance, ease of use, and data relevance for diverse stakeholders.

Creating multiple Gold layers tailored for diverse audiences or domains highlights the flexibility of the medallion architecture. Finance, sales, data science – each can have its optimized Gold layer, serving specific analytical requirements.

Some applications, third-party tools, or systems require specific data formats. You can utilize your medallion architecture to generate cleansed and properly formatted data.

## 5\. Considerations for managing your lakehouse

There are a couple of considerations to keep in mind when managing your lakehouse, including

* how to secure your lakehouse and
    
* how to handle continuous integration and continuous delivery (CI/CD).
    

### **i.** Secure your lakehouse

Secure your lakehouse by ensuring that only authorized users can access data.

In Fabric, you can do this by setting permissions at the *workspace* or *item* level.

### ii. Considerations for Continuous Integration and Continuous Delivery (CI/CD)

Designing a Continuous Integration/Continuous Deployment (CI/CD) process for a lakehouse architecture involves several considerations to ensure a smooth and efficient deployment process.

Considerations include implementing data quality checks, version control, automated deployments, monitoring, and security measures.

Considerations should also include scalability, disaster recovery, collaboration, compliance, and continuous improvement to ensure reliable and efficient data pipeline deployments.

While some of these are related to processes and practices, others are related to the tools and technologies used to implement CI/CD.

Fabric natively provides several tools and technologies to support CI/CD processes.

## 6\. Exercise - Organize your Fabric lakehouse using a medallion architecture

create a lakehouse in Fabric and move data through the medallion architecture.

You'll also learn how to query and report on data in your Fabric lakehouse.

In this exercise you will build out a medallion architecture in a Fabric lakehouse using notebooks. You will create a workspace, create a lakehouse, upload data to the bronze layer, transform the data and load it to the silver Delta table, transform the data further and load it to the gold Delta tables, and then explore the semantic model and create relationships.

### i. Create a workspace

Navigate to the workspace settings and enable the **Data model editing** preview feature.

This will enable you to create relationships between tables in your lakehouse using a Power BI semantic model.

### ii. Create a lakehouse and upload data to bronze layer

Data: orders zip \[[Link](https://github.com/MicrosoftLearning/dp-data/blob/main/orders.zip)\]

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712816715655/3ddf0071-b8d7-4b49-a058-b6650ddb7dc2.png)

### iii. Transform data and load to silver Delta table

use a notebook to transform the data and load it to a delta table in the silver layer.

```apache
 from pyspark.sql.types import *
    
 # Create the schema for the table
 orderSchema = StructType([
     StructField("SalesOrderNumber", StringType()),
     StructField("SalesOrderLineNumber", IntegerType()),
     StructField("OrderDate", DateType()),
     StructField("CustomerName", StringType()),
     StructField("Email", StringType()),
     StructField("Item", StringType()),
     StructField("Quantity", IntegerType()),
     StructField("UnitPrice", FloatType()),
     StructField("Tax", FloatType())
     ])
    
 # Import all files from bronze folder of lakehouse
 df = spark.read.format("csv").option("header", "true").schema(orderSchema).load("Files/bronze/*.csv")
    
 # Display the first 10 rows of the dataframe to preview your data
 display(df.head(10))
```

The code ran loaded the data from the CSV files in the **bronze** folder into a Spark dataframe, and then displayed the first few rows of the dataframe.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712817478930/13ef32b2-5ab5-4ac3-9f04-7ea3729232f1.png)

Now you’ll **add columns for data validation and cleanup**, using a PySpark dataframe to add columns and update the values of some of the existing columns.

```apache
 from pyspark.sql.functions import when, lit, col, current_timestamp, input_file_name
    
 # Add columns IsFlagged, CreatedTS and ModifiedTS
 df = df.withColumn("FileName", input_file_name()) \
     .withColumn("IsFlagged", when(col("OrderDate") < '2019-08-01',True).otherwise(False)) \
     .withColumn("CreatedTS", current_timestamp()).withColumn("ModifiedTS", current_timestamp())
    
 # Update CustomerName to "Unknown" if CustomerName null or empty
 df = df.withColumn("CustomerName", when((col("CustomerName").isNull() | (col("CustomerName")=="")),lit("Unknown")).otherwise(col("CustomerName")))
```

Finally, you’re updating the CustomerName column to “Unknown” if it’s null or empty.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712818072544/7e558bbb-b03f-4e5a-81f0-cac0a3a05ca0.png)

Define the schema for the **sales\_silver** table in the sales database using Delta Lake format.

```apache
 # Define the schema for the sales_silver table
    
 from pyspark.sql.types import *
 from delta.tables import *
    
 DeltaTable.createIfNotExists(spark) \
     .tableName("sales.sales_silver") \
     .addColumn("SalesOrderNumber", StringType()) \
     .addColumn("SalesOrderLineNumber", IntegerType()) \
     .addColumn("OrderDate", DateType()) \
     .addColumn("CustomerName", StringType()) \
     .addColumn("Email", StringType()) \
     .addColumn("Item", StringType()) \
     .addColumn("Quantity", IntegerType()) \
     .addColumn("UnitPrice", FloatType()) \
     .addColumn("Tax", FloatType()) \
     .addColumn("FileName", StringType()) \
     .addColumn("IsFlagged", BooleanType()) \
     .addColumn("CreatedTS", DateType()) \
     .addColumn("ModifiedTS", DateType()) \
     .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712831650721/aec5d240-9840-4b96-a25b-bdafbd26d50d.png)

#### **Upsert operation** on a Delta table, updating existing records based on specific conditions and inserting new records when no match is found.

Now you’re going to perform an **upsert operation** on a Delta table, updating existing records based on specific conditions and inserting new records when no match is found.

```apache
# Update existing records and insert new ones based on a condition defined by the columns SalesOrderNumber, OrderDate, CustomerName, and Item.

from delta.tables import *
    
deltaTable = DeltaTable.forPath(spark, 'Tables/sales_silver')
    
dfUpdates = df
    
deltaTable.alias('silver') \
  .merge(
    dfUpdates.alias('updates'),
    'silver.SalesOrderNumber = updates.SalesOrderNumber and silver.OrderDate = updates.OrderDate and silver.CustomerName = updates.CustomerName and silver.Item = updates.Item'
  ) \
   .whenMatchedUpdate(set =
    {
          
    }
  ) \
 .whenNotMatchedInsert(values =
    {
      "SalesOrderNumber": "updates.SalesOrderNumber",
      "SalesOrderLineNumber": "updates.SalesOrderLineNumber",
      "OrderDate": "updates.OrderDate",
      "CustomerName": "updates.CustomerName",
      "Email": "updates.Email",
      "Item": "updates.Item",
      "Quantity": "updates.Quantity",
      "UnitPrice": "updates.UnitPrice",
      "Tax": "updates.Tax",
      "FileName": "updates.FileName",
      "IsFlagged": "updates.IsFlagged",
      "CreatedTS": "updates.CreatedTS",
      "ModifiedTS": "updates.ModifiedTS"
    }
  ) \
  .execute()
```

This operation is important because it enables you to update existing records in the table based on the values of specific columns, and insert new records when no match is found.

This is a common requirement when you’re loading data from a source system that may contain updates to existing and new records.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712831931577/439658ef-b3a0-4379-914b-9da1d30ccd4f.png)

### iv. Explore data in the silver layer using the SQL endpoint

Now that you have data in your silver layer, you can use the SQL endpoint to explore the data and perform some basic analysis.

This is a nice option for you if you’re familiar with SQL and want to do some basic exploration of your data. In this exercise we’re using the SQL endpoint view in Fabric, but note that you can also use other tools like SQL Server Management Studio (SSMS) and Azure Data Explorer.

```sql
SELECT
    YEAR(OrderDate) AS Year,
    CAST (SUM(Quantity * (UnitPrice + Tax)) AS DECIMAL(12, 2)) AS TotalSales
FROM sales_silver
GROUP BY YEAR(OrderDate) 
ORDER BY YEAR(OrderDate)
```

This query calculates the total sales for each year in the sales\_silver table.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712833093059/874b8373-5c26-403d-b062-5b26e1de1a33.png)

Now we’ll take a look at which customers are purchasing the most (in terms of quantity)

```sql
 SELECT TOP 10 CustomerName, SUM(Quantity) AS TotalQuantity
 FROM sales_silver
 GROUP BY CustomerName
 ORDER BY TotalQuantity DESC
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712833095510/6f289556-82bb-45a7-bdad-22d6cec688b6.png)

Data exploration at the silver layer is useful for basic analysis, but you’ll need to transform the data further and model it into a star schema to enable more advanced analysis and reporting. You’ll do that in the next section.

### v. Transform data for gold layer

You have successfully taken data from your bronze layer, transformed it, and loaded it into a silver Delta table.

Now you’ll use a new notebook to transform the data further, model it into a star schema, and load it into gold Delta tables.

Note that you could have done all of this in a single notebook, but for the purposes of this exercise you’re using separate notebooks to demonstrate the process of transforming data from bronze to silver and then from silver to gold.

This can help with debugging, troubleshooting, and reuse.

#### 1\. Code to load data to your dataframe and start building out your star schema:

```apache
 # Load data to the dataframe as a starting point to create the gold layer
 df = spark.read.table("sales_silver")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712837286529/6327290d-b8cb-4b11-b615-423f8e061799.png)

Date dimension table:

#### 2\. code to create your date dimension table:

```apache
 from pyspark.sql.types import *
 from delta.tables import *
    
 # Define the schema for the dimdate_gold table
 DeltaTable.createIfNotExists(spark) \
     .tableName("dimdate_gold") \
     .addColumn("OrderDate", DateType()) \
     .addColumn("Day", IntegerType()) \
     .addColumn("Month", IntegerType()) \
     .addColumn("Year", IntegerType()) \
     .addColumn("mmmyyyy", StringType()) \
     .addColumn("yyyymm", StringType()) \
     .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712841122740/36bec102-edef-4c63-bf98-3d6b740f382c.png)

#### 3\. Code to create a dataframe for your date dimension, dimdate\_gold

```apache
 from pyspark.sql.functions import col, dayofmonth, month, year, date_format
    
 # Create dataframe for dimDate_gold
    
 dfdimDate_gold = df.dropDuplicates(["OrderDate"]).select(col("OrderDate"), \
         dayofmonth("OrderDate").alias("Day"), \
         month("OrderDate").alias("Month"), \
         year("OrderDate").alias("Year"), \
         date_format(col("OrderDate"), "MMM-yyyy").alias("mmmyyyy"), \
         date_format(col("OrderDate"), "yyyyMM").alias("yyyymm"), \
     ).orderBy("OrderDate")

 # Display the first 10 rows of the dataframe to preview your data

 display(dfdimDate_gold.head(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712841192961/6766e661-46a2-45ff-b5de-2265bf3e3f77.png)

#### 4\. Code to update the date dimension as new data comes in:

```apache
 from delta.tables import *
    
 deltaTable = DeltaTable.forPath(spark, 'Tables/dimdate_gold')
    
 dfUpdates = dfdimDate_gold
    
 deltaTable.alias('silver') \
   .merge(
     dfUpdates.alias('updates'),
     'silver.OrderDate = updates.OrderDate'
   ) \
    .whenMatchedUpdate(set =
     {
          
     }
   ) \
  .whenNotMatchedInsert(values =
     {
       "OrderDate": "updates.OrderDate",
       "Day": "updates.Day",
       "Month": "updates.Month",
       "Year": "updates.Year",
       "mmmyyyy": "updates.mmmyyyy",
       "yyyymm": "yyyymm"
     }
   ) \
   .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712841309569/835062bf-72ea-4be7-ada4-5c5213c92258.png)

Customer dimension table:

#### 5\. Code to build out the customer dimension table

```apache
 from pyspark.sql.types import *
 from delta.tables import *
    
 # Create customer_gold dimension delta table
 DeltaTable.createIfNotExists(spark) \
     .tableName("dimcustomer_gold") \
     .addColumn("CustomerName", StringType()) \
     .addColumn("Email",  StringType()) \
     .addColumn("First", StringType()) \
     .addColumn("Last", StringType()) \
     .addColumn("CustomerID", LongType()) \
     .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712841399740/280af35c-6e1f-4a3f-a543-c868a77bba4f.png)

#### 6\. Code to drop duplicate customers, select specific columns, and split the “CustomerName” column to create “First” and “Last” name columns:

Here you have created a new DataFrame dfdimCustomer\_silver by performing various transformations such as dropping duplicates, selecting specific columns, and splitting the “CustomerName” column to create “First” and “Last” name columns.

The result is a DataFrame with cleaned and structured customer data, including separate “First” and “Last” name columns extracted from the “CustomerName” column.

```apache
 from pyspark.sql.functions import col, split
    
 # Create customer_silver dataframe
    
 dfdimCustomer_silver = df.dropDuplicates(["CustomerName","Email"]).select(col("CustomerName"),col("Email")) \
     .withColumn("First",split(col("CustomerName"), " ").getItem(0)) \
     .withColumn("Last",split(col("CustomerName"), " ").getItem(1)) 
    
 # Display the first 10 rows of the dataframe to preview your data

 display(dfdimCustomer_silver.head(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712841483587/03d2a112-09ea-451b-8d0b-64315d2e84cf.png)

#### 7\. Code to create the ID column for our customers

Here you’re cleaning and transforming customer data (dfdimCustomer\_silver) by performing a left anti join to exclude duplicates that already exist in the dimCustomer\_gold table, and then generating unique CustomerID values using the monotonically\_increasing\_id() function.

```apache
 from pyspark.sql.functions import monotonically_increasing_id, col, when, coalesce, max, lit
    
 dfdimCustomer_temp = spark.read.table("dimcustomer_gold")
    
 MAXCustomerID = dfdimCustomer_temp.select(coalesce(max(col("CustomerID")),lit(0)).alias("MAXCustomerID")).first()[0]
    
 dfdimCustomer_gold = dfdimCustomer_silver.join(dfdimCustomer_temp,(dfdimCustomer_silver.CustomerName == dfdimCustomer_temp.CustomerName) & (dfdimCustomer_silver.Email == dfdimCustomer_temp.Email), "left_anti")
    
 dfdimCustomer_gold = dfdimCustomer_gold.withColumn("CustomerID",monotonically_increasing_id() + MAXCustomerID + 1)

 # Display the first 10 rows of the dataframe to preview your data

 display(dfdimCustomer_gold.head(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712842792613/bae33205-9091-47a1-a10b-9e6f9f813b8c.png)

#### 8\. Code to ensure that your customer table remains up-to-date as new data comes in

```apache
from delta.tables import *

deltaTable = DeltaTable.forPath(spark, 'Tables/dimcustomer_gold')
    
dfUpdates = dfdimCustomer_gold
    
deltaTable.alias('silver') \
  .merge(
    dfUpdates.alias('updates'),
    'silver.CustomerName = updates.CustomerName AND silver.Email = updates.Email'
  ) \
   .whenMatchedUpdate(set =
    {
          
    }
  ) \
 .whenNotMatchedInsert(values =
    {
      "CustomerName": "updates.CustomerName",
      "Email": "updates.Email",
      "First": "updates.First",
      "Last": "updates.Last",
      "CustomerID": "updates.CustomerID"
    }
  ) \
  .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712843056068/d3591dfe-273b-421a-a85b-090450cb6495.png)

customer table

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712843678013/59c2899c-4f3e-4ae3-ae5e-d3c82db0cd1a.png)

Product dimension table:

#### 9\. Code to create your product dimension

```apache
from pyspark.sql.types import *
from delta.tables import *
    
DeltaTable.createIfNotExists(spark) \
    .tableName("dimproduct_gold") \
    .addColumn("ItemName", StringType()) \
    .addColumn("ItemID", LongType()) \
    .addColumn("ItemInfo", StringType()) \
    .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712844327878/dd611579-6263-450c-847f-6a48746b3d03.png)

#### 10\. Code to to create the product\_silver dataframe

```apache
from pyspark.sql.functions import col, split, lit
    
# Create product_silver dataframe
    
dfdimProduct_silver = df.dropDuplicates(["Item"]).select(col("Item")) \
    .withColumn("ItemName",split(col("Item"), ", ").getItem(0)) \
    .withColumn("ItemInfo",when((split(col("Item"), ", ").getItem(1).isNull() | (split(col("Item"), ", ").getItem(1)=="")),lit("")).otherwise(split(col("Item"), ", ").getItem(1))) 
    
# Display the first 10 rows of the dataframe to preview your data

display(dfdimProduct_silver.head(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712844597438/9b5e06b2-7c89-46af-9cf6-5daf63a708ef.png)

#### 11\. Code to create IDs for your dimProduct\_gold table

This calculates the next available product ID based on the current data in the table, assigns these new IDs to the products, and then displays the updated product information.

```apache
from pyspark.sql.functions import monotonically_increasing_id, col, lit, max, coalesce
    
#dfdimProduct_temp = dfdimProduct_silver
dfdimProduct_temp = spark.read.table("dimproduct_gold")
    
MAXProductID = dfdimProduct_temp.select(coalesce(max(col("ItemID")),lit(0)).alias("MAXItemID")).first()[0]
    
dfdimProduct_gold = dfdimProduct_silver.join(dfdimProduct_temp,(dfdimProduct_silver.ItemName == dfdimProduct_temp.ItemName) & (dfdimProduct_silver.ItemInfo == dfdimProduct_temp.ItemInfo), "left_anti")
    
dfdimProduct_gold = dfdimProduct_gold.withColumn("ItemID",monotonically_increasing_id() + MAXProductID + 1)
    
# Display the first 10 rows of the dataframe to preview your data

display(dfdimProduct_gold.head(10))
```

from her

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712850821032/a8e50070-b9fb-4528-b9fa-674c1725140b.png)

#### 12\. Code to ensure that your product table remains up-to-date as new data comes in

```apache
from delta.tables import *
    
deltaTable = DeltaTable.forPath(spark, 'Tables/dimproduct_gold')
            
dfUpdates = dfdimProduct_gold
            
deltaTable.alias('silver') \
  .merge(
        dfUpdates.alias('updates'),
        'silver.ItemName = updates.ItemName AND silver.ItemInfo = updates.ItemInfo'
        ) \
        .whenMatchedUpdate(set =
        {
               
        }
        ) \
        .whenNotMatchedInsert(values =
         {
          "ItemName": "updates.ItemName",
          "ItemInfo": "updates.ItemInfo",
          "ItemID": "updates.ItemID"
          }
          ) \
          .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712850894343/4ba15096-0b5d-4419-b648-2c24bf8439c5.png)

Refresh LH

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712850948673/4fa5e4bd-7cea-4057-81db-2ad6186631f6.png)

  
Fact table:

#### 13\. Code to create the fact table

```apache
from pyspark.sql.types import *
from delta.tables import *
    
DeltaTable.createIfNotExists(spark) \
    .tableName("factsales_gold") \
    .addColumn("CustomerID", LongType()) \
    .addColumn("ItemID", LongType()) \
    .addColumn("OrderDate", DateType()) \
    .addColumn("Quantity", IntegerType()) \
    .addColumn("UnitPrice", FloatType()) \
    .addColumn("Tax", FloatType()) \
    .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712851134115/ec7d0052-6130-4bb5-8af4-6f22603770b2.png)

#### 14\. Code to create a new dataframe to combine sales data with customer and product information include customer ID, item ID, order date, quantity, unit price, and tax

```apache
from pyspark.sql.functions import col, split, when, lit
    
dfdimCustomer_temp = spark.read.table("dimcustomer_gold")
dfdimProduct_temp = spark.read.table("dimproduct_gold")
    
df = df.withColumn("ItemName",split(col("Item"), ", ").getItem(0)) \
    .withColumn("ItemInfo",when((split(col("Item"), ", ").getItem(1).isNull() | (split(col("Item"), ", ").getItem(1)=="")),lit("")).otherwise(split(col("Item"), ", ").getItem(1))) \
    
    
# Create Sales_gold dataframe
    
dffactSales_gold = df.alias("df1").join(dfdimCustomer_temp.alias("df2"),(df.CustomerName == dfdimCustomer_temp.CustomerName) & (df.Email == dfdimCustomer_temp.Email), "left") \
        .join(dfdimProduct_temp.alias("df3"),(df.ItemName == dfdimProduct_temp.ItemName) & (df.ItemInfo == dfdimProduct_temp.ItemInfo), "left") \
    .select(col("df2.CustomerID") \
        , col("df3.ItemID") \
        , col("df1.OrderDate") \
        , col("df1.Quantity") \
        , col("df1.UnitPrice") \
        , col("df1.Tax") \
    ).orderBy(col("df1.OrderDate"), col("df2.CustomerID"), col("df3.ItemID"))
    
# Display the first 10 rows of the dataframe to preview your data
    
display(dffactSales_gold.head(10))
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712853663626/15467a2d-e30d-47ac-be03-d044fb12f9c9.png)

#### 15\. Code to ensure that sales data remains up-to-date

Here you’re using Delta Lake’s merge operation to synchronize and update the factsales\_gold table with new sales data (dffactSales\_gold).

The operation compares the order date, customer ID, and item ID between the existing data (silver table) and the new data (updates DataFrame), updating matching records and inserting new records as needed.

```apache
from delta.tables import *
    
deltaTable = DeltaTable.forPath(spark, 'Tables/factsales_gold')
    
dfUpdates = dffactSales_gold
    
deltaTable.alias('silver') \
  .merge(
    dfUpdates.alias('updates'),
    'silver.OrderDate = updates.OrderDate AND silver.CustomerID = updates.CustomerID AND silver.ItemID = updates.ItemID'
  ) \
   .whenMatchedUpdate(set =
    {
          
    }
  ) \
 .whenNotMatchedInsert(values =
    {
      "CustomerID": "updates.CustomerID",
      "ItemID": "updates.ItemID",
      "OrderDate": "updates.OrderDate",
      "Quantity": "updates.Quantity",
      "UnitPrice": "updates.UnitPrice",
      "Tax": "updates.Tax"
    }
  ) \
  .execute()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712853738963/c9f5b657-3dd1-4dc5-b173-b0d0e823709a.png)

You now have a curated, modeled **gold** layer that can be used for reporting and analysis.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712853761106/e6b937b3-9525-41fa-a56d-85635a4cc1e0.png)

### vi. Create a semantic model

In your workspace, you can now use the gold layer to create a report and analyze the data.

You can access the semantic model directly in your workspace to create relationships and measures for reporting.

Note that you can’t use the default semantic model that is automatically created when you create a lakehouse.

You must create a new semantic model that includes the gold tables you created in this exercise, from the lakehouse explorer.

### Error:

Unexpected error dispatching create semantic model to portal action handler

Sales\_Gold to your new semantic model.

From here, you or other members of your data team can create reports and dashboards based on the data in your lakehouse.

These reports will be connected directly to the gold layer of your lakehouse, so they’ll always reflect the latest data.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712854170201/91a058c5-8d5e-47ca-8c69-2a141b6d9497.png)

### vii. Clean up resources

you’ve learned how to create a medallion architecture in a Microsoft Fabric lakehouse.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1712854568678/63da4cf8-03e3-4c54-aafa-aa0964575f64.png)

## 7\. Knowledge check

Which of the following sets of layers are typically associated with the Medallion Architecture for data management?

Bronze, Silver, Gold

Bronze, silver, gold is the correct sequence of layers typically used in the medallion architecture. Data flows from the raw and unrefined state (bronze) to a curated and validated state (silver), and finally to an enriched and well-structured presentation state (gold).

Which tool is best suited for data transformation in Fabric when dealing with large-scale data that will continue to grow?

Notebooks

Notebooks are a more suitable tool for data transformation with big data in Fabric.

What is the benefit of storing different layers of your lakehouse in separate workspaces?

Storing different layers of your lakehouse in separate workspaces enhances security and optimizes cost-effectiveness.

## 8\. Summary

You now understand how the medallion architecture offers a structured approach to logically organize lakehouse data. Once you integrate this architecture into your Fabric setup, you're on your way to ensuring an organized, refined, and curated data system.

You'll eliminate data silos and ensure that downstream teams and apps can access and use the data seamlessly. With this effective setup, you're not just storing data; you're setting it up to be quickly and easily analyzed by whenever it's needed.



## **Learning objectives**

In this module, you'll learn how to:

* Describe the principles of using the medallion architecture in data management.
    
* Apply the medallion architecture framework within the Microsoft Fabric environment.
    
* Analyze data stored in the lakehouse using DirectLake in Power BI.
    
* Describe best practices for ensuring the security and governance of data stored in the medallion architecture.
    

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