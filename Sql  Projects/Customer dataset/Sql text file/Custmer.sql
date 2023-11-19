create database projects;

use projects;

select * from hr; 

alter table hr 
change column ï»¿id emp_id Varchar(20)null;

describe hr;

select birthdate from hr; 
set sql_safe_updates=0;
update hr 
set birthdate = case 
    when birthdate like "%/%" then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y%m%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    Else NULL 
END;
select birthdate from hr; 
Alter table hr
modify column birthdate date;

update hr 
set hire_date = case 
    when hire_date like "%/%" then date_format(str_to_date( hire_date ,'%m/%d/%Y'),'%Y%m%d')
    when hire_date like '%-%' then date_format(str_to_date( hire_date ,'%m-%d-%Y'),'%Y-%m-%d')
    Else NULL 
END;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;


UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

select age FROM hr; 




update hr 
SET age = timestampdiff(YEAR, birdate,CURDATE());

SELECT birthdate, age FROM hr; 

SELECT 
	min(age) AS youngest, 
	max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18; 


#1 #What is the gender breakdown of emplyees in company? 

select gender, count(*) AS count 
FROM hr 
Where age >= 18 AND termdate = '0000-00-00' 
group by gender;

#2# 

Select race, count(*) AS count 
From hr 
Where age >= 18 AND termdate = '0000-00-00' 
Group by race 
Order by count(*)DESC;

#3# 
SELECT 
	min(age) AS youngest, 
	max(age) AS oldest
FROM hr
Where age >=18 AND termdate= '0000-00-00';

Select 
 case 
 when age >=18 AND age <= 24 then '18-24'
 when age >=25 AND age <= 34 then '25-34'
 when age >=35 AND age <= 44 then '35-44'
 when age >=45 AND age <= 54 then '45-54'
 when age >=55 AND age <= 65 then '55-65'
 when age >=55 AND age <= 65 then '18-24'
 Else '65+'
 END AS age_group,gender,
 count(*) AS count
 FROM hr 
 Where age >=18 AND termdate= '0000-00-00'
 GROUP BY age_group, gender
 Order by age_group, gender;
 
 #4-Question ( 
 
 select location, count(*) AS count 
 FROM hr 
 WHERE age >=18 AND termdate = '0000-00-00'
 Group by location; 
 
#5 
select 
     avg(datediff(termdate,hire_date))/365 AS avg_length_employement
    From hr 
    Where termdate <= curdate() AND termdate <> '0000-00-00' AND age >= 18;
# 6 
select department,gender, count(*) AS count 
From hr 
WHERE age>=18 AND termdate = '0000-00-00'
Group by department,gender
order by department;

#7 
select jobtitle, count(*) AS count 
From hr 
WHERE age >= 18 AND termdate = '0000-00-00'
Group by  jobtitle
order by jobtitle desc;

# 8 
SELECT department,
total_count, 
terminated_count, 
terminated_count/total_count AS  termination_rate
From( 
  Select department,
  count(*)AS total_count,
  SUM(case when termdate <> '0000-00-00' AND  termdate <= curdate() then 1 else 0 END) AS terminated_count
FROM hr 
 Where age >= 18
 Group by department
 ) AS subquery 
 Order by termination_rate DESC; 
 



#9
Select location_state,count(*)AS count
FROM hr 
WHERE age >= 18 AND termdate = '0000-00-00'
Group by location_state
order by count desc;

#10
Select 
  year,
  hires,
  terminations,
  hires-terminations AS net_change, 
  round((hires-terminations)/hires*100,2) net_change_percent
FROM(
     Select 
		YEAR(hire_date)AS year,
	 count(*) AS hires,
     SUM(CASE WHEN termdate <> '0000-00-00' AND termdate<= curdate() then 1 else 0 END)AS terminations 
     From hr
     Where age >=18 
     Group by YEAR (hire_date)
     )AS subquery 
Order by year ASC; 
     
#11#    

Select department,round(avg(datediff(termdate,hire_date)/365),0) AS avg_tenure
FROM hr 
WHERE  termdate<= curdate() AND termdate <> '0000-00-00' AND age >=18
Group by department;
