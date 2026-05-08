/*Show first name and last name 
of patients who does not have allergies. (null)
*/

select firstname, lastname
from patients
where allergies is null