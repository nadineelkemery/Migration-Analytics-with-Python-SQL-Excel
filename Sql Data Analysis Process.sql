select 
    count(*) as total_records,
    sum(case when student_id is null then 1 else 0 end) as missing_student_id,
    sum(case when origin_country is null then 1 else 0 end) as missing_origin,
    sum(case when destination_country is null then 1 else 0 end) as missing_destination,
    sum(case when university_name is null then 1 else 0 end) as missing_university,
    sum(case when field_of_study is null then 1 else 0 end) as missing_field,
    sum(case when year_of_enrollment is null then 1 else 0 end) as missing_enrollment_year,
    sum(case when placement_status is null then 1 else 0 end) as missing_placement
from global_student_migration;
---------------
select student_id, count(*) as count
from global_student_migration
group by student_id
having count(*) > 1;
-----------------------
update global_student_migration
set destination_country = 'united kingdom'
where destination_country in ('uk', 'england', 'britain');
------------------
select min(gpa_or_score) as min_gpa, max(gpa_or_score) as max_gpa, avg(gpa_or_score) as avg_gpa
from global_student_migration
where gpa_or_score > 0;
------------------------------
select 
    placement_status,
    count(*) as count,
    cast(count(*) * 100.0 / (select count(*) from global_student_migration) as decimal(5,2)) as percentage
from global_student_migration
group by placement_status;
-----------------------
select 
    enrollment_reason,
    count(*) as count,
    cast(count(*) * 100.0 / (select count(*) from global_student_migration) as decimal(5,2)) as percentage
from global_student_migration
group by enrollment_reason
order by count desc;
-------------------------------------
select 
    origin_country,
    count(*) as student_count,
    cast(count(*) * 100.0 / (select count(*) from global_student_migration) as decimal(5,2)) as percentage
from global_student_migration
group by origin_country
order by student_count desc;
-----------------------------
select 
    destination_country,
    count(*) as student_count,
    cast(count(*) * 100.0 / (select count(*) from global_student_migration) as decimal(5,2)) as percentage
from global_student_migration
group by destination_country
order by student_count desc;
-----------------------
select top 10 
    university_name,
    count(*) as student_count
from global_student_migration
group by university_name
order by student_count desc;
---------------------------
select 
    origin_country,
    destination_country,
    count(*) as student_count
from global_student_migration
group by origin_country, destination_country
order by student_count desc;
-------------------------
select 
    field_of_study,
    count(*) as student_count,
    cast(count(*) * 100.0 / (select count(*) from global_student_migration ) as decimal(5,2)) as percentage
from global_student_migration
group by field_of_study
order by student_count desc;
-------------------------
select 
    field_of_study,
    count(*) as total_students,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed_students,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate
from global_student_migration
group by field_of_study
order by placement_rate desc;
---------------------------
select 
    field_of_study,
    avg(gpa_or_score) as avg_gpa,
    min(gpa_or_score) as min_gpa,
    max(gpa_or_score) as max_gpa
from global_student_migration
where gpa_or_score > 0
group by field_of_study
order by avg_gpa desc;
------------------------
select 
    origin_country,
    destination_country,
    count(*) as student_count
from global_student_migration
where origin_country in ('india', 'germany')
group by origin_country, destination_country
order by origin_country, student_count desc;
------------------
select 
    (select count(*) from global_student_migration where origin_country = 'uae') as outbound_from_uae,
    (select count(*) from global_student_migration where destination_country = 'uae') as inbound_to_uae;
-- بيحسب عدد الطلاب اللي بيغادروا من الإمارات وعدد اللي بيدخلوا لها
select 
    scholarship_received,
    count(*) as total,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate
from global_student_migration
group by scholarship_received;
--------------------------
select top 5 
    placement_company, 
    count(*) as hire_count
from global_student_migration
where placement_status = 'placed' and placement_company <> 'n/a'
group by placement_company
order by hire_count desc;
---------------------------
select 
    avg(starting_salary_usd) as avg_salary,
    min(starting_salary_usd) as min_salary,
    max(starting_salary_usd) as max_salary
from global_student_migration
where placement_status = 'placed' and starting_salary_usd > 0;
----------------------------
select top 5 
    placement_company,
    avg(starting_salary_usd) as avg_salary
from global_student_migration
where placement_status = 'placed' and starting_salary_usd > 0
group by placement_company
order by avg_salary desc;
---------------------------
select 
    field_of_study, 
    avg(starting_salary_usd) as avg_salary
from global_student_migration
where placement_status = 'placed' and starting_salary_usd > 0
group by field_of_study
order by avg_salary desc;
----------------------------
select 
    post_graduation_visa,
    count(*) as total,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate
from global_student_migration
group by post_graduation_visa
order by placement_rate desc;
-----------------------
select 
    year_of_enrollment, 
    count(*) as student_count
from global_student_migration
group by year_of_enrollment
order by year_of_enrollment;
-------------------------------
select 
    year_of_enrollment,
    count(*) as total,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate
from global_student_migration
group by year_of_enrollment
order by year_of_enrollment;
-----------------------
select 
    graduation_year - year_of_enrollment as duration_years,
    count(*) as student_count
from global_student_migration
where graduation_year > year_of_enrollment
group by graduation_year - year_of_enrollment
order by student_count desc;
------------------------------
select 
    language_proficiency_test,
    count(*) as total,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate
from global_student_migration
where language_proficiency_test <> 'none'
group by language_proficiency_test
order by placement_rate desc;
----------------------------------
select 
    case when test_score >= 7.5 then 'high score' else 'lower score' end as score_category,
    count(*) as total,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate
from global_student_migration
where test_score > 0
group by case when test_score >= 7.5 then 'high score' else 'lower score' end;
-----------------------------------
select 
    field_of_study,
    destination_country,
    count(*) as student_count
from global_student_migration
where field_of_study in ('computer science', 'business')
group by field_of_study, destination_country
order by field_of_study, student_count desc;
----------------------------------
select 
    origin_country,
    field_of_study,
    destination_country,
    count(*) as student_count
from global_student_migration
where origin_country in ('india', 'russia') 
  and field_of_study in ('computer science', 'business')
group by origin_country, field_of_study, destination_country
order by origin_country, field_of_study, student_count desc;

select 
    destination_country,
    scholarship_received,
    count(*) as total,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate
from global_student_migration
where destination_country in ('united kingdom', 'usa', 'germany', 'canada')
group by destination_country, scholarship_received
order by destination_country, scholarship_received;
-----------------------------
select 
    university_name,
    avg(starting_salary_usd) as avg_salary
from global_student_migration
where placement_status = 'placed' and starting_salary_usd > 0
group by university_name
order by avg_salary desc
offset 0 rows fetch next 5 rows only;
---------------------------
select 
    post_graduation_visa,
    avg(starting_salary_usd) as avg_salary
from global_student_migration
where placement_status = 'placed' and starting_salary_usd > 0
group by post_graduation_visa
order by avg_salary desc;
-----------------------------
select 
    graduation_year,
    avg(starting_salary_usd) as avg_salary
from global_student_migration
where placement_status = 'placed' and starting_salary_usd > 0
group by graduation_year
order by graduation_year;
------------------------------
select 
    case when field_of_study in ('computer science', 'engineering', 'medicine', 'natural sciences') 
         then 'stem' else 'non-stem' end as field_category,
    count(*) as total,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate,
    avg(starting_salary_usd) as avg_salary
from global_student_migration
where starting_salary_usd > 0
group by case when field_of_study in ('computer science', 'engineering', 'medicine', 'natural sciences') 
              then 'stem' else 'non-stem' end;
---------------------------------
select 
    destination_country,
    language_proficiency_test,
    count(*) as test_count,
    cast(count(*) * 100.0 / sum(count(*)) over (partition by destination_country) as decimal(5,2)) as percentage
from global_student_migration
where language_proficiency_test <> 'none'
  and destination_country in ('united kingdom', 'usa')
group by destination_country, language_proficiency_test
order by destination_country, test_count desc;
------------------------------------
select 
    avg(case when placement_status = 'placed' then gpa_or_score end) as avg_gpa_placed,
    avg(case when placement_status = 'not placed' then gpa_or_score end) as avg_gpa_not_placed,
    avg(case when placement_status = 'placed' then test_score end) as avg_test_placed,
    avg(case when placement_status = 'not placed' then test_score end) as avg_test_not_placed
from global_student_migration
where gpa_or_score > 0 and test_score > 0;
-------------------------------------
select 
    university_name,
    count(*) as total,
    sum(case when placement_status = 'placed' then 1 else 0 end) as placed,
    cast(sum(case when placement_status = 'placed' then 1 else 0 end) * 100.0 / count(*) as decimal(5,2)) as placement_rate
from global_student_migration
group by university_name
having count(*) > 5
order by placement_rate desc;
-------------------------------
select count(*) as high_achievers
from global_student_migration
where gpa_or_score >= 3.95 and placement_status = 'placed';
--------------------------
select *
from global_student_migration
where gpa_or_score > 3.8 and placement_status = 'not placed';
------------------------------------




