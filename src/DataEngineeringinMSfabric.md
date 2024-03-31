Today, I am learning about Data Engineering in Microsoft Fabric.

# Introduction to Fabric in Azure Data Factory

## What is Microsoft Fabric?

Unified analytics fabric, End-to-end analytics data fabric, from the data lake to the business user.

## What is data engineering?

Spark, Lakehouse, Pipelines, Dataflows Gen2.

Behind the scenes magic that makes all of the data work together its the process of designing & building and ultimately managing architecture of a data system including the structure and the organization.

orchestrating behind the scenes work, to ensure data is well prepared and is starring role in the analysis process involving different tasks like collecting & storing and also processing data so that it is easily accessible, usable downstream for consumption in Power BI reports.

Data engineers will setup the infrastructure that will create data pipelines, different tools for data transforms ensuring data is clean, organized and ready for analysis for business intelligence analyst.

Data integration work load inside fabric is going to provide data engineers with the ability to go through and unify by hybrid or multi cloud estates in an experience that combines the ease and use of power query editor in the power BI with the scale and power of data factory to be able to integrate and orchestrate all of data movement whether connected via on-premises in the cloud or third party sources.

Dataflow Gen2 - which essentially online power query editor inside power Bi service.

Lakehouse - store and access data.

spark - access data using python /SQL efficiently.

Lakehouse - like an Inner Join of Data warehouse (central repository for storing structured data forms from various sources for the purpose of business intelligence and reporting) along with a data lake (another repository to store different types of data whether it is structured so you can go through and store like tables and semi-structured with CSV files, parkuet files or unstructured data) so this lakehouse architecture allows you to store large amount data for an inexpensive bill Compare it to other sources.

In Lake House essentially, we are going to store Data on a data lake But having the structure of a traditional data warehouse Where you can go through and write SQL Operation against and have a confirmed acid properties Meaning that you have an ability to go in and make sure you Have the transactions and data Is going to be reliable.

## What is datalake and onelake?

General purpose storage account

File formats: structured, semi-structured, un-structured)

containers / directories / sub-directories.

Datalake is like an onedrive for storing and accessing data in a single location so that all the different jobs that are going to be executed on a single source of truth.

Microsoft fabric one lake allows you to go through and store one copy of organizational data inside of a storage account which is like onedrive but for access inside of power BI service.

Importance of Compute in Fabric

# Setting Up and Configuring a Fabric Workspace

switch to data engineering persona and select workspace.

Provision a Lakehouse and name it. - essentially you are creating a container inside a storage account or a folder inside a storage account.

Note: Go through and store data inside fabric ultimately its going to be stored on onelake the dataklake thats managed by microsoft in your Fabric environment.

Note: Onelake - its a managed datalake inside of microsoft fabric you are provisioned with storage account.

shortcut: Integrate your other door data storage solutions Inside your Microsoft Fabric Lake House. Shortcut enables a data engineer to unify data across Clouds and accounts into your Microsoft fabric Lake House. Access files that resides in an external lake.

Right click Files / Create new shortcut / select Azure Datalake storage Gen2 / provide credentials (Can be found in the files provided link) & select Authentication kind: SAS Shared access signature/ Provide shortcut name: External data lake/ Subpath: / worldwide or simply checkbox worldwide / create.

Image:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1711901682275/77889865-cdb1-437e-a407-d19688fbf4cd.png)

# Working with Data Lakes and External Tools

# Running Pipelines and Understanding Performance

# Utilizing Spark Notebooks for Big Data

# Integration Possibilities with Snowflake and On-Premises Data

# Wrapping Up

# Conclusion

Learning Objectives,

# Source: Pragmatic Works \[[Link](https://www.youtube.com/watch?v=e9CN96Y9PcA)\]

# Author: Dheeraj.Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)