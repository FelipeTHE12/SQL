 /*

 Querys made on SQLServer
Change fields element/table


get the month and 
COALESCE(MAX(case when (total_month = 1)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_jan

if theres a chance of dividing by 0 => (case when total = 0 then null else total end)

multiple where elements


 */
 
 SELECT 
    COALESCE(MAX(case when (total_month = 1)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_jan,  
    COALESCE(MAX(case when (total_month = 2)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_fev,  
    COALESCE(MAX(case when (total_month = 3)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_mar,  
    COALESCE(MAX(case when (total_month = 4)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_abr,  
    COALESCE(MAX(case when (total_month = 5)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_mai,  
    COALESCE(MAX(case when (total_month = 6)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_jun,  
    COALESCE(MAX(case when (total_month = 7)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_jul,  
    COALESCE(MAX(case when (total_month = 8)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_ago,  
    COALESCE(MAX(case when (total_month = 9)  then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_set,  
    COALESCE(MAX(case when (total_month = 10) then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_out,  
    COALESCE(MAX(case when (total_month = 11) then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_nov,  
    COALESCE(MAX(case when (total_month = 12) then reprogramadas/(case when total = 0 then null else total end) end),0) as repro_dez  

 FROM 

   (select * 
       FROM --CAST used to convert 
      (select cast(count(*) as decimal) as total, MONTH(element) as total_month  from table where  ( 
                  ( 
                     in ('', '', '', '', '', '') 
         and element BETWEEN " "
         and " "
                  ) 
                  or ( 
                     element in ('', '', '', '', '', '') 
         and element BETWEEN " "
         and " "
                  ) 
                  or ( 
                     element in ('', '', '', '', '', '') 
         and element BETWEEN " "
         and " "
                  ) 
               ) and element = '' and status <> '' group by MONTH(element)) as tableOne 


 INNER JOIN 
 
   (select cast(count(*)as decimal) as reprogramadas, MONTH(element) as mestotal2 
   FROM table 
   WHERE 			
   ( 
               ( 
                  element in ('', '', '', '', '', '') 
      and element BETWEEN " "
      and " "
               ) 
               or ( 
                  element in ('', '', '', '', '', '') 
      and element BETWEEN " "
      and " "
               ) 
               or ( 
                  element in ('', '', '', '', '', '') 
      and element BETWEEN " "
      and " "
               ) 
            ) and element = 1 
         and element = ""
   and element <> 'CAN' group by MONTH(element)) as tableTwo 
            ON tableOne.mestotal = tableTwo.mestotal2) 
as working; --Alis Needed on SQL server	