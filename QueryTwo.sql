 /*

Querys made on SQLServer
Change fields element/table
get the month and weeks, all the date.

results by week

One month = 5 weeks
    if using just datepart(week), you ll get like 90 weeks by year


 */

SELECT 
    (select distinct element from table where element = 'element') as element, --Parametro
	(select element from table where element = 'element') as element, --Parametro
	COALESCE(sum(case when (actualMonth = 1) and actualWeek =1 then sumhour/2 end),0) as week_one,
	COALESCE(sum(case when (actualMonth = 1) and actualWeek =2 then sumhour/2 end),0) as week_two,
	COALESCE(sum(case when (actualMonth = 1) and actualWeek =3 then sumhour/2 end),0) as week_three,
	COALESCE(sum(case when (actualMonth = 1) and actualWeek =4 then sumhour/2 end),0) as week_four,
	COALESCE(sum(case when (actualMonth = 1) and actualWeek =5 then sumhour/2 end),0) as week_five
FROM(
	SELECT 
        table.element,
        DATEPART(day, datediff(day, 0, element)/7 * 7)/7 + 1 as actualWeek, -- get weeks by month
        DATEPART(MONTH, element) as actualMonth,
        DATEPART(Year, element) as actualYear, 
	    SUM (element) as sumhour,
         element
    FROM table
    JOIN table 
        ON table.element = table.element AND table.element = table.element
    WHERE table.element = 'element' --Parametro
    GROUP BY 
        DATEPART(day, datediff(day, 0, element)/7 * 7)/7 + 1,
        DATEPART(MONTH, element),
        DATEPART(Year, element),
        element,
        table.element
    ) 
as aliasSQL;