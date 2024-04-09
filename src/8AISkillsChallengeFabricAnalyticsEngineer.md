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

```sql
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