-- standardizing 
-- finding  issues and fixing it 

select *
from layoffs_stagging2;

update layoffs_stagging2
set company=trim(company),
location = trim(location)
;
select distinct industry 
from layoffs_stagging2
order by industry;

select * from layoffs_stagging2
where industry like'crypto%';

update layoffs_stagging2
set industry= 'Crypto'
where industry like 'Crypto%'; 

select distinct country from layoffs_stagging2 order by country ;

update layoffs_stagging2
set country = 'United States'
where country like 'United States%';

#OR you can use traling

update layoffs_stagging2
set country = Trim(Trailing '.' from country);




select * from layoffs_stagging2
where country like 'United States%';









