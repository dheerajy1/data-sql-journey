
use chocolatesdb;

SELECT TOP 10000
    *
FROM INFORMATION_SCHEMA.TABLES

exec sp_help geo

SELECT TOP 10000
    *
FROM geo

exec sp_help people

SELECT TOP 10000
    *
FROM people

exec sp_help products

SELECT TOP 10000
    *
FROM products

exec sp_help sales

SELECT TOP 10000
    *
FROM sales



SELECT TOP 10000
    *
FROM sales
    inner join geo on geo.GeoID = sales.Geo




DBCC CHECKDB

select distinct local_net_address, local_tcp_port
from sys.dm_exec_connections
where local_net_address is not null

SELECT TOP 10000
    *
FROM sys.dm_exec_connections


USE MASTER
GO
xp_readerrorlog 0, 1, N'Server is listening on'
GO



SELECT TOP 10000
    *
FROM sales
WHERE boxes < 50


SELECT TOP 10000
    *
FROM sales
WHERE product  ='P06'




