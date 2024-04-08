In this article, I have explained about Cast and Convert functions in SQL Server.

Implicit conversions don't require specification of either the `CAST` function or the `CONVERT` function.

Explicit conversions require specification of the `CAST` function or the `CONVERT` function.

# I. CAST() function

The CAST() function converts an expression/value (of any type) into a specified datatype.

Cast() function is ANSI standard.

## Syntax

```sql
CAST ( expression AS data_type ( length ) )
```

## Parameter Values

1. *expression*
    
    * Required.
        
    * The value to convert
        
2. *datatype*
    
    * Required.
        
    * The datatype to convert *expression* to. Can be one of the following: bigint, int, smallint, tinyint, bit, decimal, numeric, money, smallmoney, float, real, datetime, smalldatetime, char, varchar, text, nchar, nvarchar, ntext, binary, varbinary, or image
        
3. *(length)*
    
    * Optional.
        
    * The length of the resulting data type (for char, varchar, nchar, nvarchar, binary and varbinary)8
        

# Cast() function Explicit conversion Examples

## 1\. Convert a float value to a varchar datatype using Cast() function

```sql
SELECT CAST(25.65 AS varchar)
```

## 2\. Convert a value to a datetime datatype

```sql
SELECT CAST('2017-08-25' AS datetime)
```

## 3\. Date data type explicit conversion to int data type

```sql
select getdate()
select cast(getdate() as int) /* 45170 */
```

## 4\. int data type explicit conversion to date data type - fails

```sql
SELECT CAST(45170 AS date)
/*Explicit conversion from data type numeric to date is not allowed.*/
```

## 5\. date data type explicit conversion to float data type

```sql
select cast(getdate() as float) /* 45169.7566258102*/
```

## 6\. float data type explicit conversion to date data type - fails

```sql
SELECT CAST(45169.7566258102 AS date)
/*Explicit conversion from data type numeric to date is not allowed.*/
```

## 7\. date data type explicit conversion to varchar data type

```sql
select cast(getdate() as varchar) /* Sep  2 2023  6:12PM */
```

## 8\. dateformat in string data type explicit conversion to date data type

```sql
select cast('Sep 2 2023 6:12PM' as date) /* 2023-09-02 */
select cast('Sep 2 2023 6:12PM' as datetime) /* 2023-09-02 18:12:00.000 */
```

## 9\. numberformat in string data type explicit conversion to date data type - fails

```sql
SELECT CAST('45170' AS date) 
/* Conversion failed when converting date and/or time from character string. */
```

---

# II. Convert() function

soon

---

# Conclusion

Learning Objectives,

1. CAST() function
    
2. Convert() function
    

# Source: **SQL Expert** \[[Link](https://www.youtube.com/watch?v=0VRXWB5tmtg)\], Microsoft \[[Link](https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16)\], w3schools \[[Link](https://www.w3schools.com/sql/func_sqlserver_cast.asp)\], Implicit \[[Link](https://www.sqlshack.com/implicit-conversion-in-sql-server/)\], Data Munging (Wrangling)\[[Link](https://www.sqlshack.com/sql-string-functions-for-data-munging-wrangling/#:~:text=Implicit%20conversions%20do%20not%20require,function%20will%20truncate%20the%20result.)\]

# Author: Dheeraj.y

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)