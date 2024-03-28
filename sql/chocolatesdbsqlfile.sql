
use chocolatesdb;

SELECT TOP 10000 
*
FROM INFORMATION_SCHEMA.TABLES

sp_help geo

SELECT TOP 10000 
*
FROM geo

sp_help people

SELECT TOP 10000 
*
FROM people

sp_help products

SELECT TOP 10000 
*
FROM products

sp_help sales

SELECT TOP 10000 
*
FROM sales



SELECT TOP 10000 
*
FROM sales
inner join geo on geo.GeoID = sales.Geo








