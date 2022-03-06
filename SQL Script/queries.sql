use education;

SELECT 
univ_per_country.economy,		
T1.YR2015 + T2.YR2015 + T3.YR2015 AS INDEX_2015,
T1.YR2016 + T2.YR2016 + T3.YR2016 AS INDEX_2016,
T1.YR2017 + T2.YR2017 + T3.YR2017 AS INDEX_2017,
T1.YR2018 + T2.YR2018 + T3.YR2018 AS INDEX_2018
from governmentexpenditure as T1
 
inner join schooltertiaryenrollment as T2 
on T2.economy = T1.economy
inner join unemploymenttotal T3 on T2.economy = T3.economy
join univ_per_country
join 
(select  (YR2015-min(YR2015)) / (max(YR2015) - min(YR2015)) as 2015_ST,
		 (YR2016-min(YR2016)) / (max(YR2016) - min(YR2016)) as 2016_ST,
		 (YR2017-min(YR2017)) / (max(YR2017) - min(YR2017)) as 2017_ST,
		 (YR2018-min(YR2018)) / (max(YR2018) - min(YR2018)) as 2018_ST
from unemploymenttotal) AS T2 
JOIN
 (select (YR2015-min(YR2015)) / (max(YR2015) - min(YR2015)) as 2015_ST,
		 (YR2016-min(YR2016)) / (max(YR2016) - min(YR2016)) as 2016_ST,
		 (YR2017-min(YR2017)) / (max(YR2017) - min(YR2017)) as 2017_ST,
		 (YR2018-min(YR2018)) / (max(YR2018) - min(YR2018)) as 2018_ST
from schooltertiaryenrollment) AS T3 
JOIN
(select  (YR2015-min(YR2015)) / (max(YR2015) - min(YR2015)) as 2015_ST,
		 (YR2016-min(YR2016)) / (max(YR2016) - min(YR2016)) as 2016_ST,
		 (YR2017-min(YR2017)) / (max(YR2017) - min(YR2017)) as 2017_ST,
		 (YR2018-min(YR2018)) / (max(YR2018) - min(YR2018)) as 2018_ST
from governmentexpenditure) AS T4 

GROUP BY economy 









