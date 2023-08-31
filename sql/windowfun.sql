create table test_data
	(
		new_id bigint,
		new_cat varchar(20)
	)
insert into test_data
values (100,'Agni'),
(200,'Agni'),
(200,'Vayu'),
(300,'Vayu'),
(500,'Vayu'),
(500,'Dharti'),
(700,'Dharti')

select  *
from test_data

/* Window function example using  sum(), avg(),count(), min(), max() aggregate functions, */

select new_id, new_cat,
	   sum(new_id) over (partition by new_cat order by new_cat) as Total,
	   avg(new_id) over (partition by new_cat order by new_cat) as Avg,
	   count(new_id) over (partition by new_cat order by new_cat) as Count,
	   min(new_id) over (partition by new_cat order by new_cat) as Min,
	   max(new_id) over (partition by new_cat order by new_cat) as Max
from test_data

/* using rows/range clause, */
SELECT new_id,new_cat,
       sum(new_id) over ( order by new_id 
                          rows between unbounded preceding
                          and unbounded following  ) as Total,
       avg(new_id) over ( order by new_id 
                          rows between unbounded preceding
                          and unbounded following  ) as Avg,
       count(new_id) over ( order by new_id 
                          rows between unbounded preceding
                          and unbounded following  ) as Count,
       min(new_id) over ( order by new_id 
                          rows between unbounded preceding
                          and unbounded following  ) as Min,
       max(new_id) over ( order by new_id 
                          rows between unbounded preceding
                          and unbounded following  ) as Max

FROM test_data



/* Test case 1 without partition and order by new_cat*/
select new_id, new_cat,
	   sum(new_id) over (partition by new_cat order by new_cat) as Total_part,
	   sum(new_id) over (order by new_cat) as Total,
	   count(new_id) over (order by new_cat) as Count,
	   min(new_id) over (order by new_cat) as Min,
	   max(new_id) over (order by new_cat) as Max
from test_data


/* Test case 2 without partition and order by new_id*/

select new_id, new_cat,
	   sum(new_id) over (partition by new_id order by new_id) as Total_part,
	   sum(new_id) over (order by new_id) as Total,
	   count(new_id) over (order by new_id) as Count,
	   min(new_id) over (order by new_id) as Min,
	   max(new_id) over (order by new_id) as Max
from test_data

/* Window function example using  row_number(), rank(),dense_rank(), percent_rank() ranking functions, */

SELECT new_id,
       row_number() over(order by new_id) as Row_number,
	   rank() over(order by new_id) as Rank,
	   dense_rank() over(order by new_id) as Dense_rank,
	   percent_rank() over(order by new_id) as Percent_rank
FROM test_data

/* Window function example using using first_value(), last_value() , lead(), lag() Analytic/Value function */

SELECT    new_id,new_cat,
          first_value(new_id) over ( order by new_id) as First_value,
		  last_value(new_id) over ( order by new_id) as Last_value,
		  lead(new_id) over (order by new_id) as lead,
		  lag(new_id) over (order by new_id) as lag
FROM      test_data