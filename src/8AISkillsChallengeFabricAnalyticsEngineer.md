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

```sql
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