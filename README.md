# Hospital Management Database Analysis using MySQL

## Project Overview
A relational database project developed using MySQL to manage hospital doctor and patient records and perform SQL-based data analysis. The project demonstrates database creation, table relationships, data manipulation, and querying techniques to extract meaningful insights from hospital data.

## Database Structure
The database `Hospital1_db` consists of two relational tables:

### 1. DoctorTable
Stores doctor information, including:
- Doctor ID (Primary Key)
- Doctor Name
- Specialization
- Experience
- Salary

### 2. PatientTable
Stores patient information, including:
- Patient ID (Primary Key)
- Patient Name
- Age
- City
- Disease
- Doctor ID (Foreign Key)

The tables are connected through the `doctor_id` field, establishing a relationship between doctors and their assigned patients. A foreign key constraint with ON DELETE CASCADE is implemented.

## Dataset
The project uses a sample hospital dataset created manually using SQL INSERT statements.

- **DoctorTable:** 6 records containing doctor details, specializations, experience, and salaries.
- **PatientTable:** 8 records containing patient details, demographics, diseases, and assigned doctor IDs.

No external dataset was used.

## SQL Concepts Covered
- Database and Table Creation (CREATE DATABASE, CREATE TABLE)
- Primary Keys and Foreign Keys
- Data Insertion (INSERT)
- Data Manipulation (UPDATE)
- Table Modification (ALTER TABLE)
- Data Retrieval (SELECT)
- Filtering (WHERE, DISTINCT, BETWEEN, LIKE)
- Sorting (ORDER BY, LIMIT)
- Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
- Grouping and Filtering Groups (GROUP BY, HAVING)
- Joins (INNER JOIN, LEFT JOIN)
- Subqueries and Nested Queries

## Project Analysis
Implemented 35+ SQL queries to explore and analyse hospital records, including:

- Doctor salary comparisons and salary distribution.
- Doctor specializations and experience analysis.
- Patient demographics and disease distribution.
- Doctor-patient relationships and patient counts.
- City-wise patient distribution.
- Identification of doctors with the highest and lowest salaries.
- Analysis of doctors treating multiple patients.

## Tools Used
- MySQL
- MySQL Workbench

## Repository Contents
- `Hospital1_db.sql` – Complete SQL script containing database creation, table creation, sample data insertion, and SQL queries.
