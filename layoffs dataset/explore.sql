select MAX(total_laid_off)
from layoffs_stagging2;

select MIN(total_laid_off)
from layoffs_stagging2;

select company ,SUM(total_laid_off)
from layoffs_stagging2
group by company
order  by 2 desc;


select MAX(`date`),
MIN(`date`)
from layoffs_stagging2;

-- Group by YEAR
select year(`date`), SUM(total_laid_off)
from layoffs_stagging2
group by Year(`date`)
order by 1 desc;

select stage, SUM(total_laid_off)
from layoffs_stagging2
group by stage
order by 2 desc;

select * from layoffs_stagging2
where stage='Post-IPO';


-- Rolling SUM-- 

select substr(`date`,1,7) as `month`, SUM(total_laid_off)
from layoffs_stagging2
group by `month`
order by 1 asc
;

with Rolling_total as 
(
select substr(`date`,1,7) as `month`, 
SUM(total_laid_off) as total 
from layoffs_stagging2
where substr(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month`, total ,SUM(total) over(order by `month`) as Rolling_Total
from Rolling_total;


with company_year as (
select company,
year(`date`)as years, 
SUM(total_laid_off) as total
from layoffs_stagging2
group by company,year(`date`)
order by 3 desc
),

company_year_rank as(
select * ,dense_rank()
over(partition by years order by total desc ) as ranking
from company_year
where total is not null
)

select * from company_year_rank
where ranking<=5
;





