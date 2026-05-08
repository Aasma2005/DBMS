/*Display a single row with max_visits, min_visits, average_visits where the maximum, minimum 
and average number of admissions per day is calculated. Average is rounded to 2 decimal places.
*/

SELECT MAX(num_visit) AS max_visit,
min(num_visit) as min_visit,
round(avg(num_visit),2) as avg_visit

form(
    select admission_date, count(*) as num_visit
    from admissions
    GROUP BY admission date
    
)