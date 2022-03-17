select dimension_1, dimension_2, isnull(count(measure_1), 0), isnull(count(measure_2), 0) 

from A join B on A.dimension_1 = B.dimension_1
join MAP on A.dimension_1 = MAP.dimension_1

where dimension_1, dimension_2 in (
 
select distinct dimension_1, correct_dimension_2 as dimension_2
from A join B on A.dimension_1 = B.dimension_1
join MAP on A.dimension_1 = MAP.dimension_1
group by dimension_1, correct_dimension_2) t

group by dimension_1, dimension_2