In this article I have mentioned about the learnings involving Column chart in power BI.


# Get Data

```markdown
Month Number , Month , 2022 , 2023 ,2023 Predictions
1 , January , 2825.00 , 7140.00 , 
2 , February , 5005.00 , 1614.00 , 
3 , March , 3612.00 , 14752.00 , 
4 , April , 2978.00 , 933.00 , 
5 , May , 8662.00 , 6343.00 , 
6 , June , 4750.00 , 8223.00 , 
7 , July , 4433.00 , 6953.00 , 
8 , August , 2062.00 , 9041.00 , 
9 , September , 9329.00 , 10992.00 , 
10 , October , 16243.00 , 9275.00 , 
11 , November , 4011.00 ,  , 9690.10
12 , December , 17885.00 ,  , 8483.35
```

Measures

```sql
DEFINE
	MEASURE 'IBCS data'[PY] = SUM('IBCS data'[2022])
	MEASURE 'IBCS data'[AC] = SUM('IBCS data'[2023])
	MEASURE 'IBCS data'[FC] = SUM('IBCS data'[2023 Predictions])

	MEASURE 'IBCS data'[DeltaPY] =
		IF(
			ISBLANK([FC]),
			[AC] - [PY],
			[FC] - [PY]
		)

	MEASURE 'IBCS data'[Max value] =
		IF(
			ISBLANK([FC]),
			IF(
				[AC] > [PY],
				[AC],
				[PY]
			),
			IF(
				[PY] > [FC],
				[PY],
				[FC]
			)
		)

	MEASURE 'IBCS data'[Red Max] = IF(
			[DeltaPY] < 0,
			[Max value]
		)

	MEASURE 'IBCS data'[Green Max] = IF(
			[DeltaPY] > 0,
			[Max value]
		)

	MEASURE 'IBCS data'[Delta Color] = IF(
			[DeltaPY] < 0,
			"#ff0000",
			"#008e96"
		)

	MEASURE 'IBCS data'[DeltaPY %] = DIVIDE(
			[DeltaPY],
			[PY]
		)
```

# Transformations

split columns

use first row as headers

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714374593309/1b277dad-3688-43a6-85b4-953a0f8139e6.png)

# Explore Measures

add Measures to the model

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1714375665305/f63ba413-344d-4bca-80a2-8338378bde10.png)



# Conclusion

Learning Objectives,

1. Get data & transformations
    
2. Cluster column chart visualization
    
3. measures
    

# Source: Power BI Park \[[Link](https://www.youtube.com/watch?v=4Kn9jmgUlnY)\]

# Author: Dheeraj. Yss

# Connect with me:

* [My Twitter](https://twitter.com/yssdheeraj)
    
* [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
    
* [My GitHub](https://github.com/dheerajy1)
    
* [My Hashnode](https://dheerajy1.hashnode.dev/)