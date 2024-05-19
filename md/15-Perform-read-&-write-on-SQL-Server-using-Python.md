This article depicts about the process of connecting to SQL Server using Python.


# 1\. Install lib using Pip

* !pip install sqlalchemy
    
* !pip install pyodbc
    

```python
import sqlalchemy, pyodbc, os
import pandas as pd
from sqlalchemy import create_engine, text
from sqlalchemy.engine import URL
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import OperationalError
```

```python
os.chdir(r'path\orders')
os.getcwd()
os.listdir()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715004676277/2f61536f-1f0f-49da-86b3-209358ab56bc.png)

# 2\. Connecting to Database

## i. Check the driver

```python
pyodbc.drivers()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715004751535/842a65a0-64f8-41ee-a65c-1d735e2e3636.png)

## ii. Configure the connection string

```python
connection_url = URL.create(
    "mssql+pyodbc",
    username="test",
    password="test",
    host=".",
    port=1433,
    database="test",
    query={
        "driver": "ODBC Driver 18 for SQL Server",
         "TrustServerCertificate": "yes", # When yes, the transport layer will use SSL to encrypt the channel and bypass walking the certificate chain to validate trust. Useful when using self-signed certificates or when the certificate chain cannot be validated.
        "authentication": "SqlPassword", # use SQL login credentials instead of Windows authentication.
        "pool_size": "1", # to limit the number of sessions to one
    },
)
```

## iii. Create an engine using the create\_engine() function, specifying the database URL

```python
engine = create_engine(connection_url)
```

## iv. Define a function that checks the connection using connection.execute("SELECT 1") method

```python
def check_connection():
    try:
        with engine.connect() as connection:
            connection.execute(text('SELECT 1'))
            connection.commit() # Important otherwise will be in open transaction state will eventually leads to slow running queries and leads to blocking.
        return True
    except OperationalError as error:
        print("Error:", str(error))
        return False
```

## v. Use the check\_connection() function to verify the connection before executing any database operations

* To Close the session use session.close()
    

```python
if check_connection():
    # Connection is valid, proceed with database operations
    # Create a session factory
    Session = sessionmaker(bind=engine)
    
    # Create a session
    session = Session()
    # Perform database operations using the session
    print(" Successfully established a connection to the database.")
else:
    # Connection is not valid, handle the error or retry the connection
    print("Error: Unable to establish a connection to the database.")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023122101/84ede1d4-583a-4c4e-8b07-06c15027dc4b.png)

Successfully established a connection to the database.


# 3\. Construct the query

```python
# Construct the query
qlist_tables = """
    SELECT TOP 10000 *
    FROM [db].INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE IN ('BASE TABLE')
    ORDER BY TABLE_NAME ASC
"""
qslt_orders = """
SELECT TOP 10000 
*
FROM [db].[dbo].[orders]
"""

qcrtab_instcus = """
BEGIN TRY
	BEGIN TRANSACTION T1CRTAB

	IF OBJECT_ID(N'[db].[dbo].[instnwnd Customers]', N'U') IS NOT NULL
		DROP TABLE [db].[dbo].[instnwnd Customers]

	CREATE TABLE [db].[dbo].[instnwnd Customers] (
		"CustomerID" nchar (5) NOT NULL ,
		"CompanyName" nvarchar (40) NOT NULL ,
		"ContactName" nvarchar (30) NULL ,
		"ContactTitle" nvarchar (30) NULL ,
		"Address" nvarchar (60) NULL ,
		"City" nvarchar (15) NULL ,
		"Region" nvarchar (15) NULL ,
		"PostalCode" nvarchar (10) NULL ,
		"Country" nvarchar (15) NULL ,
		"Phone" nvarchar (24) NULL ,
		"Fax" nvarchar (24) NULL ,
	)
	COMMIT TRANSACTION T1CRTAB
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION T1CRTAB
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH
"""

qslt_instcus = """
SELECT TOP 10000 
*
FROM [db].[dbo].[instnwnd Customers]
"""


qinst_instcus = """
BEGIN TRY
	BEGIN TRANSACTION T1INSTINCUS

	IF OBJECT_ID(N'[db].[dbo].[instnwnd Customers]', N'U') IS NOT NULL
	BEGIN
		INSERT INTO [db].[dbo].[instnwnd Customers] VALUES('ALFKI','Alfreds Futterkiste','Maria Anders','Sales Representative','Obere Str. 57','Berlin',NULL,'12209','Germany','030-0074321','030-0076545')
		INSERT INTO [db].[dbo].[instnwnd Customers] VALUES('ANATR','Ana Trujillo Emparedados y helados','Ana Trujillo','Owner','Avda. de la Constitución 2222','México D.F.',NULL,'05021','Mexico','(5) 555-4729','(5) 555-3745')
		INSERT INTO [db].[dbo].[instnwnd Customers] VALUES('ANTON','Antonio Moreno Taquería','Antonio Moreno','Owner','Mataderos  2312','México D.F.',NULL,'05023','Mexico','(5) 555-3932',NULL)
	END
	COMMIT TRANSACTION T1INSTINCUS
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION T1INSTINCUS
	PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH
"""
```

# 4\. Construct the dboperation function

```python
def dboperaiton(query, commit = 'nocommit'):
    try:
        result = session.execute(text(query)) # engine.connect().execute(text(query))
        # print(result.keys(), result.fetchall())
        if commit == 'commit':
            session.commit() # Important otherwise will be in open transaction state will eventually leads to slow running queries and leads to blocking.
        # session.close()
        return result, result.keys(), result.fetchall()
    except Exception as e:
        print(f"An error occurred: {str(e)}")
```

# 5\. using execute() method

## i. DQL: Select

```python
# try:
#     result = engine.connect().execute(text(qlist_tables))
#     print(result.all(), result.keys())
# except Exception as e:
#     print(f"An error occurred: {str(e)}")

dboperaiton(result, qlist_tables)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023310538/ff12d236-3924-4066-b9dc-06d65200d1f7.png)

```python
try:
    result2 = session.execute(text(qslt_orders)) # engine.connect() will create another session so use session
    print(type(result2), result2.fetchall(), result2.keys())
except Exception as e:
    print(f"An error occurred: {str(e)}")
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715008132600/eace0fe5-4c76-4cbe-ab32-6842fe363f42.png)

Pd dataframe:

```python
# data = engine.connect().execute(text(qslt_orders))

data = dboperaiton(qslt_orders)

# Convert the result to a pandas DataFrame
#df_result2 = pd.DataFrame(data.fetchall(), columns=data.keys())

df_result2 = pd.DataFrame(data[2], columns=data[1])
df_result2
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023370523/41d8bf7f-1715-4541-a5a6-e4182973db7a.png)

## ii. DDL: Create

```python
dboperaiton(qcrtab_instcus, 'commit')
```

```python
dboperaiton(qslt_instcus)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023421915/3a0ef639-4a3e-4e22-b2f4-4161c3c5f029.png)

## iii. DML: Insert

```python
dboperaiton(qinst_instcus, 'commit')
```

```python
dboperaiton(qslt_instcus)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023513166/13c070f1-ac7a-4fdc-93fc-fc19bfd7c511.png)

# 6\. Using Pandas read\_sql\_query() menthod - DQL

## i. DQL: Select

```python
df = pd.read_sql_query(qlist_tables,engine)
df
```

```python
df2 = pd.read_sql_query(qslt_orders,engine)
df2
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715023571166/c5923b50-9811-4337-9da3-61fb87ac123e.png)

## ii. DDL: Create

```python
# Create a DataFrame
data = {
    'Name': ['John', 'Jane', 'Mike'],
    'Age': [25, 30, 35],
    'City': ['New York', 'London', 'Paris']
}
df = pd.DataFrame(data)

# Write the DataFrame to a SQL table
table_name = 'tabpdperson'
df.to_sql(table_name, engine, if_exists='replace', index=False)
```

```python
# Confirm the table creation
query = f"""
SELECT * 
FROM {table_name}
"""
result = pd.read_sql(query, engine)
result
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715073646336/8a0e6bba-37b7-4e32-a6af-b035e63020c4.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715073708378/a1e7ca8e-77d2-47a2-a259-82963f0eb2dd.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715074005977/2aff481a-9521-4032-9f46-d6b1d8cbd304.png)

## iii. DML: Insert

```python
insert_data = {
    'Name': ['Mary', 'Peter', 'Mike'],
    'Age': [52, 40, 45],
    'City': ['Colorado', 'Texas', 'Arizonia']
}

df = pd.DataFrame(insert_data)

table_name = 'tabpdperson'

df.to_sql(table_name, engine, if_exists = 'append', index = False)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715074470429/51a54c14-a1a7-4062-a5c5-ddf5060e2eb9.png)

```python
table_name = 'tabpdperson'

query = f"""
SELECT TOP 10000 
*
FROM [dballpurpose].[dbo].[tabpdperson]
"""

df = pd.read_sql_query(query, engine)
df
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715074487337/cf2ab701-1ee7-4600-ac2f-4918c6639295.png)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715074521159/128f28f1-f420-4021-96bf-a41d5cacf38f.png)

---

Error:

Observed Long running queries and multiple sessions & multiple open transactions

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715013029143/be9a5e52-ed29-4310-b5d1-a74f0309dd2c.png)

Wiaittype: LCK\_M\_S

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715013426923/64f946c4-17b6-4b6a-9825-1fa197f2258e.png)

Sql query from sql handle

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715013757049/5ce87556-b62b-4bf2-8848-4ed6fbcccdd3.png)

DBCC OPENTRAN:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715013886021/2e38b136-fddd-4c02-adf7-457707f23618.png)

killed all open sessions.


# 7\. Bulk insert CSV Files (Data Files) to SQL Server

Change the current working directory to the specified path where order files are located.

```python
os.chdir(r'path\orders')
```

List all files and directories in the current working directory.

```python
os.listdir()
```

Retrieve and return the current working directory of the process.

```python
os.getcwd()
```

Create a list of tuples containing file information for all CSV files in the current directory.

```python
# Create a list of tuples containing file information for all CSV files in the current directory.
# Each tuple will contain a formatted string and the absolute path to the file.
data_files = [
    [
        f'{os.path.basename(os.getcwd())} {fn.split(".")[0]}',  # Create a formatted string with the directory name and the file name (without extension)
        os.path.join(os.getcwd(), fn)                           # Generate the full path to the file
    ] 
    for fn in os.listdir(os.getcwd())                           # List all files in the current directory
    if fn.endswith('.csv')                                      # Filter the list to include only files that end with '.csv'
]

data_files  # This line evaluates to the list of data_files, which can be used for further processing or output.
```

## i. Read CSV data into pandas dataframe

```python
orderSchema = {
    "SalesOrderNumber": str,
    "SalesOrderLineNumber": int,
    "OrderDate": 'category',
    "CustomerName": str,
    "Email": str,
    "Item": str,
    "Quantity": int,
    "UnitPrice": float,
    "Tax": float
}
df = pd.DataFrame()
for path in data_files:
    newdata = pd.read_csv(path[1], header= None, names=orderSchema.keys(), dtype=orderSchema, parse_dates=["OrderDate"])
    df = pd.concat([df, newdata], ignore_index=True)
df
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715180764844/a05ba7cb-ae5f-41cd-91ce-65bc3ab75770.png)

Group the DataFrame 'df' by the year part of the 'OrderDate' column.

```python
df.groupby(pd.to_datetime(df['OrderDate']).dt.year).count()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715180745635/cf337252-40cd-489d-acc8-f6572d13972d.png)

```python
df[['OrderDate', 'SalesOrderNumber']].groupby(pd.to_datetime(df['OrderDate']).dt.year)['SalesOrderNumber'].count().reset_index(name='SalesOrderNumber')
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715180807448/b43f79d1-ea12-4180-b478-0fbe8d872d8b.png)

```python
df.groupby(pd.to_datetime(df['OrderDate']).dt.year).agg({
    'SalesOrderNumber':'count','SalesOrderLineNumber':'count',
    'CustomerName':'count','Email':'count',
    'Item':'count', 'Quantity':'count',
    'UnitPrice':'count', 'Tax':'count'
    }).reset_index()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715180838636/e4f1b334-3612-45c1-9f9e-12367c8023b0.png)

## ii. Clean df

Find duplicates in SalesOrderNumber column:

```python
df['SalesOrderNumber'].duplicated().sum()
```

check duplicates in each year

```python
df_subset = df[['OrderDate','SalesOrderNumber']].loc[
    pd.to_datetime(df['OrderDate']).dt.year == 2019
]
df_subset['SalesOrderNumber'].duplicated().sum()
```

```python
df.groupby(pd.to_datetime(df['OrderDate']).dt.year)['SalesOrderNumber'].apply(lambda x: x.duplicated().sum()).reset_index(name='DuplicatedSalesOrderNumber')df_subset = df.groupby(pd.to_datetime(df['OrderDate']).dt.year).agg({
    'SalesOrderNumber':'count','SalesOrderLineNumber':'count',
    'CustomerName':'count','Email':'count',
    'Item':'count', 'Quantity':'count',
    'UnitPrice':'count', 'Tax':'count'
    }).reset_index()
df_subset['DuplicatedSalesOrderNumber'] = df.groupby(pd.to_datetime(df['OrderDate']).dt.year)['SalesOrderNumber'].apply(lambda x: x.duplicated().sum()).to_list()
df_subset
```

plot to visualize the duplicates:

```python
sns.set_theme(style="ticks")
fig, ax = plt.subplots()

# Set the width of each bar
bar_width = 0.35

# Calculate the position of each bar on the x-axis
r1 = df_subset['OrderDate'].to_list() # [2019, 2020, 2021]
r2 = [x + bar_width for x in r1]

# Plot the Sales Order Count
ax.bar(r1, df_subset['SalesOrderNumber'], color='steelblue', width=bar_width, label='Sales Order Count')

# Plot the Duplicated Sales Order Count
ax.bar(r2, df_subset['DuplicatedSalesOrderNumber'], color='red', width=bar_width, label='Duplicated Sales Order Count')

# Set labels and title
ax.set_xlabel('Year')
ax.set_ylabel('Count')
ax.set_title('Sales Order Count and Duplicated Sales Order Count by Year')

# Set the x-axis tick labels
ax.set_xticks([r + bar_width/2 for r in r1])
ax.set_xticklabels(df_subset['OrderDate'])

# Add legend
ax.legend()

# Display the plot
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715181012803/e5312a9d-b9fa-405b-b4de-faba22fa976f.png)

using sns barplot:

```python
sns.set_theme(style="ticks")
fig, axs = plt.subplots(1, 2, figsize = (10,5), sharey= True)

# Flatten the array of axes (subplots) for easier iteration
axs = axs.flatten()

# Plot the Sales Order Count
sns.barplot(data=df_subset, x='OrderDate', y='SalesOrderNumber', ax=axs[0])
axs[0].set_xlabel('Year')
axs[0].set_ylabel('')

# Plot the Duplicated Sales Order Count
sns.barplot(data=df_subset, x='OrderDate', y='DuplicatedSalesOrderNumber', ax=axs[1], color='black')
axs[1].set_xlabel('Year')
axs[1].set_ylabel('Duplicated Sales Order Count')

# Add a legend to the figure with the labels 'Unemployement' and 'Participation'
fig.legend(labels = ['Sales Order Count', 'Duplicated Sales Order Count'])

# Display the plot
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715181039104/f5bebb3d-63e7-4aa2-954e-cde783a80d22.png)

using sns barplot adjacent

```python
sns.set_style("whitegrid")

df_subset = df_subset[['OrderDate', 'SalesOrderNumber', 'DuplicatedSalesOrderNumber']].melt(id_vars='OrderDate', var_name='Variable', value_name='Count')

sns.barplot(x='OrderDate', y='Count', hue='Variable', data=df_subset)

plt.xlabel('Order Date')
plt.ylabel('Count')
plt.title('Sales Order Numbers vs Duplicated Sales Order Numbers')
plt.legend(title='Variable')
plt.show()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715181065561/593ef399-3abb-40a9-bf9d-235b7e599ba8.png)

drop duplicate

```python
df_clean = df.drop_duplicates(subset = 'SalesOrderNumber')
df_clean.duplicated().sum()
df_clean.shape
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715181336142/80ff819b-3347-45f6-9c4d-6758945567cc.png)

check nulls

```python
df_clean.isnull().sum(axis=1).plot()
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715181101015/cab213b8-9b10-471f-97c3-55e4a29e5283.png)

rebuild indexes:

```python
df_clean = df.drop_duplicates(subset = 'SalesOrderNumber')
df_clean.reset_index(drop=True, inplace=True)
df_clean.duplicated().sum()
df_clean.shape
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715183578430/5c46c229-ff7e-48f8-b0ce-9d97d90d0e1b.png)

## iii. Send data to SQL Server using pandas to\_sql() method

```python
df_clean.to_sql(table_name, engine, if_exists='replace', index=False)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715181445229/770a2f56-46e4-4737-a9a2-d411807ab4cf.png)

```python
df_clean
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715183723440/a7d1b60c-d74b-415a-b56f-c1c04710fcb4.png)

## iii. Create data for orders year 2022

Generate random number function

```python
def genran(type = 'int'):
    if type == 'int':
        ran = int((random.randint(1,9)*random.random()*random.random())*1000) 
    else:
        ran = round((random.randint(1,9)*random.random()*random.random())*1000, random.randint(2,4))
    
    return ran if ran < df['SalesOrderNumber'].count() else None
```

Generate date function

```python
strtdate = datetime.date(2022,1,1)
enddate = datetime.date(2022,12,31)
delta = datetime.timedelta(days=1)
datevar = strtdate

def get_date():
    global datevar
    if datevar <= enddate and datevar != strtdate:
        storedate = datevar
        datevar = datevar + delta
        return storedate
    else:
        datevar = datevar + delta
        return strtdate
```

Generating Sales Order Data with Incrementing Sales Order Numbers

```python
sta_son = int(df_clean['SalesOrderNumber'].str[2:].max()) + 1

key_list = df.columns.to_list()
dict_data = {key: [] for key in key_list}

for row in range(0,1000):
    
    dict_data['SalesOrderNumber'].append('SO' + str(sta_son))
    
    dict_data['SalesOrderLineNumber'].append(random.randint(1,7))
    
    dict_data['OrderDate'].append(get_date())
    
    cusema = df_clean[['CustomerName', 'Email']].loc[
    df_clean.index == genran()]
    
    dict_data['CustomerName'].append(cusema.values[0][0])
    dict_data['Email'].append(cusema.values[0][1])
    
    dict_data['Item'].append(df_clean['Item'].loc[
    df_clean.index == genran()].values[0])
    
    dict_data['Quantity'].append(1)
    
    dict_data['UnitPrice'].append(genran('round'))
    
    dict_data['Tax'].append(genran('round'))
    
    sta_son += 1
    
dict_data
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715183837143/7ca12325-2b22-4e48-9b5f-234823a8bdff.png)

Create dataframe from the dict data

```python
df_gendata = pd.DataFrame(dict_data)
df_gendata
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715183886669/f43ae168-10d5-43e0-b678-1eeb8f9d1192.png)

## iv. Add the generated orders data for year 2022 to df\_clean

16459 old + 2000 added = 18459 rows

```python
df_clean2 = pd.concat([df_clean, pd.DataFrame(dict_data)], ignore_index=True)
df_clean2
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715184094922/c4851b34-507d-4b5f-8a4d-4bef933f781d.png)

```python
df_clean2.groupby(pd.to_datetime(df_clean2['OrderDate']).dt.year).count() #[['OrderDate','CustomerName']]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715184127504/7a1d8135-9fb5-45fe-875b-2f562cf3e375.png)

Data in df\_clean2.

```python
df_clean2.loc[
    pd.to_datetime(df_clean2['OrderDate']).dt.year == 2022,
    ['CustomerName', 'OrderDate', 'Item', 'Quantity', 'UnitPrice', 'Tax']
]
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715187529852/b2d41a0e-fe3f-40de-8f00-92232af62ccb.png)

check data from sql table

```python
table_name = 'Sales orders'

query = f"""
SELECT TOP 10000 
YEAR(OrderDate) AS year,
COUNT(SalesOrderNumber) AS [No of records],
SUM(COUNT(SalesOrderNumber)) OVER(ORDER BY YEAR(OrderDate)) AS [Running records count]
FROM [dballpurpose].[dbo].[Sales orders]
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate)
"""

df_salesorders = pd.read_sql_query(query, engine)
df_salesorders
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715186881973/ef6c5be7-4718-40f4-9a6a-52e8d88b874d.png)

## v. Send data for orders year 2022 to SQL Server

```python
table_name = 'Sales orders'
df_clean2.to_sql(table_name, engine, if_exists= 'append', index=False)
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715188054225/d930c16a-6e90-4cbf-b065-280fd3d8647f.png)

Errors:

1. **TypeError**: the dtype datetime64\[ns\] is not supported for parsing, pass this column using parse\_dates instead.
    
    * `"OrderDate": 'category'`, specify `parse_dates=["OrderDate"]`
        
2. **TypeError**: cannot concatenate object of type '&lt;class 'list'&gt;'; only Series and DataFrame objs are valid
    
    * `df = pd.DataFrame()` initialize an empty DataFrame
        
3. **ValueError**: If using all scalar values, you must pass an index
    
    * To fix this error, you can pass an index when creating the DataFrame
        
4. **IndexError**: index 0 is out of bounds for axis 0 with size 0
    
    * rebuild indexes.
        
    * before rebuild indexes:
        

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715183479275/a2cd8a7a-b5db-4bb3-982b-766228cfc0fe.png)

* after rebuild indexes: `df_clean.reset_index(drop=True, inplace=True)`
    

5. **IndexError**: Boolean index has wrong length: 11038 instead of 18459
    
6. **MemoryError**:

# Conclusion

Learning Objectives,

1. Python, sql server, sqlalchemy lib, pandas lib. seaborn lib,
    
2. connect to sql server using python.
    
3. verify the connection.
    
4. perform DQL select and DDL create, DML write operations using python
    
5. Using Pandas read\_sql\_query() menthod - DQL
    
6. Bulk insert CSV Files
    
7. finding duplicates, check nulls, clean data, rebuild indexes:

8. Generate data for orders year 2022

9. Send data for orders year 2022 to SQL Server
    

# Source: \[Link\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)