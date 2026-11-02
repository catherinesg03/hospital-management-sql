create database Hospital1_db;
use Hospital1_db;
create table DoctorTable(doctor_id int auto_increment primary key,
						 doctor_name varchar(30),
                         specialization varchar(30),
                         experience int not null,
                         salary int);

insert into DoctorTable(doctor_name,specialization,experience,salary) values('Arun','Cardiology',12,95000),
                                                                            ('Meera','Neurology',8,80000),
                                                                            ('Rahul','Orthopedics',15,110000),
                                                                            ('Anjali','Pediatrics',6,70000),
                                                                            ('Vivek','Cardiology',10,90000),
                                                                            ('Neha','Dermatology',5,65000);

create table PatientTable(patient_id int primary key,
                          patient_name varchar(30),
                          age int,
                          city varchar(30),
                          disease varchar(30),
                          doctor_id int,
                          foreign key(doctor_id) references DoctorTable(doctor_id) on delete cascade);
                          
insert into PatientTable(patient_id, patient_name, age, city, disease, doctor_id) values(101, 'Riya', 25, 'Kochi', 'Heart Disease', 1),
																						(102, 'Akhil', 42, 'Trivandrum', 'Migraine', 2),
																						(103, 'Meena', 35, 'Kochi', 'Fracture', 3),
																						(104, 'John', 8, 'Kollam', 'Fever', 4),
																						(105, 'Anu', 55, 'Kozhikode', 'Heart Disease', 1),
																						(106, 'Ravi', 29, 'Kochi', 'Allergy', 6),
																						(107, 'Diya', 14, 'Trivandrum', 'Fever', 4),
																						(108, 'Manu', 47, 'Kannur', 'Fracture', 3);
                                                                                                                                                                                
-- 2. Display the names of doctors whose salary is greater than 85,000.
select doctor_name,salary from DoctorTable where salary > 85000;
-- 3. Display the name of each patient along with the name of the doctor treating them.
select patient_name,doctor_name from PatientTable left join DoctorTable on PatientTable.doctor_id = DoctorTable.doctor_id;
-- 4. Display all different cities in which patients live.
select distinct city from PatientTable;
-- 5. Find the doctor with the highest salary.
select doctor_name from DoctorTable where salary = (select max(salary) from  DoctorTable);
-- 6. Display doctors whose names contain the letter a, arranged alphabetically.
select doctor_name from DoctorTable where doctor_name like "%a%" order by doctor_name;
-- 7. Display the number of patients treated by each doctor.
select doctor_name, count(patient_id) as Count from PatientTable left join DoctorTable on PatientTable.doctor_id = DoctorTable.doctor_id group by doctor_name;
-- 8. Display patients from Kochi whose age is greater than 30.
select patient_name from PatientTable where city ="Kochi" and age > 30;
-- 9. Display the 3 doctors with the greatest experience.
select doctor_name from DoctorTable order by experience desc limit 3;
-- 10. Display the specialization and average salary for each specialization.
select specialization, avg(salary) from DoctorTable group by specialization;
-- 11. Display patients along with their doctor's specialization, but include only patients whose doctor's experience is more than 8 years.
select patient_name, specialization, experience from PatientTable left join DoctorTable on PatientTable.doctor_id = DoctorTable.doctor_id where experience > 8;
-- 12. Display specializations having more than one doctor.
select specialization from DoctorTable group by specialization having count(doctor_name) > 1;
-- 13. Display the names of patients suffering from the same disease as Riya.
select patient_name from PatientTable where disease = (select disease from PatientTable where patient_name = "Riya");
-- 14. Display the youngest patient.
select patient_name,age from PatientTable order by age limit 1;
-- 15. Display doctors whose salary is between 70,000 and 95,000.
select doctor_name from DoctorTable where salary between 70000 and 95000;
-- 16. Display all doctors and their patients, including doctors who have no patients.
select doctor_name,patient_name from DoctorTable left join PatientTable on DoctorTable.doctor_id = PatientTable.doctor_id;
-- 17. Display the cities having more than one patient.
select city from PatientTable group by city having count(patient_name) > 1;
-- 18. Display doctors whose salary is greater than the average salary of all doctors.
select doctor_name from DoctorTable where salary > (select avg(salary) from DoctorTable);
-- 19. Display the names of patients who are treated by Cardiology doctors.
select patient_name from PatientTable left join DoctorTable on DoctorTable.doctor_id = PatientTable.doctor_id where specialization = "Cardiology" ;
-- 20. Display the 2 oldest patients.
select patient_name from PatientTable order by age desc limit 2;
-- 21. Display different diseases recorded in the hospital.
select distinct disease from PatientTable;
-- 22. Display the doctor name and the total number of patients treated by that doctor, arranged from highest to lowest patient count.
select doctor_name,count(patient_id) from DoctorTable left join PatientTable on DoctorTable.doctor_id = PatientTable.doctor_id group by doctor_name order by count(patient_id) desc;
-- 23. Display patients whose doctor's salary is greater than 80,000.
select patient_name from PatientTable inner join DoctorTable on DoctorTable.doctor_id = PatientTable.doctor_id where salary > 80000;
-- 24. Display the average age of patients.
select avg(age) from PatientTable;
-- 25. Display doctors who are treating more than one patient.
select doctor_name from DoctorTable join PatientTable on DoctorTable.doctor_id = PatientTable.doctor_id group by doctor_name having count(patient_name) > 1;
-- 26. Display the doctor(s) who have the same specialization as Vivek.
select doctor_name from DoctorTable where specialization = (select specialization from DoctorTable where doctor_name = "Vivek");
-- 27. Display the specialization and average salary of specializations whose average salary is greater than 80,000.
select specialization, avg(salary) from DoctorTable group by specialization having avg(salary) > 80000;
-- 28. Display patients whose age is between 10 and 40.
select patient_name,age from PatientTable where age between 10 and 40;
-- 29. Display the patient(s) assigned to the doctor having the highest salary.
select patient_name,salary from PatientTable left join DoctorTable on DoctorTable.doctor_id = PatientTable.doctor_id where salary = (select max(salary) from DoctorTable);
-- 30. Display doctors who have no patients assigned to them.
select doctor_name from DoctorTable left join PatientTable on DoctorTable.doctor_id = PatientTable.doctor_id group by doctor_name having count(patient_id) =0;
-- 31. Display the number of patients in each city.
select city,count(patient_name) from PatientTable group by city;
-- 32. Display doctors whose experience is more than 5 years and salary is less than 90,000.
select doctor_name from DoctorTable where experience > 5 and salary < 90000;
-- 33. Increase the salary of all Cardiology doctors by 5,000.
update DoctorTable set salary = salary + 5000 where specialization = "Cardiology";
select salary from DoctorTable;
-- 34. Add a phone column to PatientTable.
alter table PatientTable add column phone int;
select * from PatientTable;
-- 35. Display the names of doctors who treat patients older than 40.
select doctor_name from DoctorTable join PatientTable on DoctorTable.doctor_id = PatientTable.doctor_id where PatientTable.age > 40;
-- 36. Display the patient name, doctor name and doctor salary for the patient whose doctor has the lowest salary.
select patient_name,doctor_name,salary from PatientTable left join DoctorTable on DoctorTable.doctor_id = PatientTable.doctor_id where salary = (select min(salary) from DoctorTable);
-- 37. Display diseases that occur more than once.
select disease,count(disease) from PatientTable group by disease having count(disease) >1;
-- 38. Display all patients whose doctor's experience is greater than 10 years.
select patient_name from PatientTable inner join DoctorTable on DoctorTable.doctor_id = PatientTable.doctor_id where experience >10;
-- 39. Display the names and salaries of the 2 lowest-paid doctors.
select doctor_name,salary from DoctorTable order by salary limit 2;
-- 40. Display the number of patients treated by doctors in each specialization.
select specialization, count(patient_name) from PatientTable inner join DoctorTable on DoctorTable.doctor_id = PatientTable.doctor_id group by specialization;