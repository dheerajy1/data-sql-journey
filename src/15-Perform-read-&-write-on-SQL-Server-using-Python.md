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