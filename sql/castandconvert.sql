select 25.65
SELECT CAST(25.65 AS varchar)
SELECT CAST(25.65 AS date); /*Explicit conversion from data type numeric to date is not allowed.*/


/* date data type explicit conversion to int data type */
select getdate()
select cast(getdate() as int) /* 45170 */

/* int data type explicit conversion to date data type - fails */
SELECT CAST(45170 AS date) /*Explicit conversion from data type numeric to date is not allowed.*/


/* date data type explicit conversion to float data type */
select cast(getdate() as float) /* 45169.7566258102*/

/* float data type explicit conversion to date data type - fails*/
SELECT CAST(45169.7566258102 AS date); /*Explicit conversion from data type numeric to date is not allowed.*/



/* date data type explicit conversion to varchar data type */
select cast(getdate() as varchar) /* Sep  2 2023  6:12PM */

/* dateformat in string data type explicit conversion to date data type */
select cast('Sep 2 2023 6:12PM' as date) /* 2023-09-02 */
select cast('Sep 2 2023 6:12PM' as datetime) /* 2023-09-02 18:12:00.000 */

/* numberformat in string data type explicit conversion to date data type - fails */
SELECT CAST('45170' AS date) /* Conversion failed when converting date and/or time from character string. */
