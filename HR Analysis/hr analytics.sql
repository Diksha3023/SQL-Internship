use hr_analysis;
select count(EmployeeID) from general_data;
select distinct(JobRole) from general_data;
select round(avg(Age)) from general_data;
select Emp_name, Age from general_data
where YearsAtCompany>=5;
select Department,count(EmployeeID) as EmployeeCount from general_data
group by Department;
select * from 
general_data inner join employee_survey_data
on general_data.EmployeeID= employee_survey_data.EmployeeID
where employee_survey_data.JobSatisfaction=3;
select max(MonthlyIncome) as highest_income from general_data;
select * from general_data
where business_travel="Travel_Rarely";

select distinct(MaritalStatus) from general_data;

select * from general_data
where TotalWorkingYears>2 and YearsAtCompany<4;

select Department, round(avg(DistanceFromHome)) from general_data
group by Department;

select * from general_data
order by MonthlyIncome Desc
limit 5;
-- select * from general_data
-- -- order by MonthlyIncome desc;
-- select * from general_data
-- where EmployeeID= 386;
select round((select count(EmployeeID) from general_data where YearsSinceLastPromotion=1)/count(EmployeeID) *100,2)  as Percentage from general_data;

select * from general_data inner join employee_survey_data
on general_data.EmployeeID= employee_survey_data.EmployeeID
where employee_survey_data.EnvironmentSatisfaction= (select min(EnvironmentSatisfaction) from employee_survey_data) or 
 employee_survey_data.EnvironmentSatisfaction= (select max(EnvironmentSatisfaction) from employee_survey_data) ;

select * from general_data inner join manager_survey_data
on general_data.EmployeeID= manager_survey_data.EmployeeID
where general_data.TotalWorkingYears=( select max(TotalWorkingYears) from general_data) 
and manager_survey_data.PerformanceRating=4;

select general_data.business_travel,round( Avg(general_data.Age)) as Average_age,round(avg(employee_survey_data.JobSatisfaction),2) as Average_JobSatisfaction
from general_data inner join employee_survey_data on general_data.EmployeeID= employee_survey_data.EmployeeID
group by general_data.business_travel;

select EducationField,count(EducationField) as count from general_data 
group by EducationField
order by count desc limit 1 ;

select * from general_data
where YearsAtCompany=(select max(YearsAtCompany) from general_data) and YearsSinceLastPromotion=0;





