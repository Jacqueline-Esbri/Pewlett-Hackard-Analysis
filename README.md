# Pewlett Hackard Analysis


## Overview of the Analysis

For this assignment, we were introduced to Structured Query Language (SQL), pgAdmin, and PostgreSQL interface. PostgreSQL was used to create databases and pgAdmin was used to work with the data imported.  The main goal of the assignment was to ask questions about the data and discover relationships between data tables using relational databases. SQL, PostgreSQL, and pgAdmin were the suitable tools for this project.

An organization named Pewlett-Hackard was looking to offer retirement packages for their employees who met certain criteria. Additionally, it was looking into which positions needed to be filled as a result of an expected "silver tsunami". Our analysis was focused on determining the number of retiring employees by title, and identify employees who were eligible, based on their criteria, to partake in their planned mentorship program.

Six CSV files were provided for this project. The files contained information about departments, employees, department employees, department managers, salaries, and employees titles. Our job entailed creating queries to access and analyse of all the data. Common errors were also handled in the process, such as duplicate name entries due to outdated records. The analysis found employees who no longer work for the company and duplicate name entries due to promotions. 


## Results

The beginning of the analysis showed 300,025 employees listed on the company's record. We then counted the employees eligible for retirement (born between 1952 and 1955) out of that list, and the result found 41,380 eligible employees. Due to the staggering number of retirement ready employees, we were tasked to break down the list by departments to find employees who were no longer with the company. After the employees' list was updated by counting current employees, it showed that 33,118 were eligible for retirement.

However, after performing further analysis, it was found that the number of employees eligible for retirement was 90,398...triple the amount of original number. It was also interesting to note that there were five listed managers for nine departments. At the end of the analysis, Pewlett-Hackard was provided with the following:

- Narrow search for retirement eligibility
- A specific number of employees retiring by title
- A meticulously crafted database foundation filled with data
- A comprehensive list of employees eligible for its planned mentorship program


## Fig.1

### Employees listed on Records
![emp_count_bf.PNG](PNGs/emp_count_bf.png)

## Fig.2

### Count of Retirement-Eligible Employees (unfiltered list)
![sum_ret_emp.PNG](PNGs/sum_ret_emp.png)

## Fig.3

### Count of Current Retirement-Ready employees (after filter)
![current_ret_elg.PNG](PNGs/current_ret_elg.png)


## Fig.4

### Retiring Employee Count by Title (after analysis)
![ret_titles.PNG](PNGs/ret_titles.png)
 
 ## Fig.5

### Count of Fig.4
![count_dept.PNG](PNGs/count_dept.png)

## Fig.6 

### List of Existing Managers by Departments
![dept_mng.PNG](PNGs/dept_mng.png)

## Fig.7

### List of Total Departments
![total_dept.PNG](PNGs/total_dept.png)


## Summary

In conclusion, the number of retirement-eligible employees was massive. The findings showed that over 90,000 will be eligible to retire in the company's near future. Furthermore, these employees will become eligible to retire around the same time. 

The company is also lacking management positions. There were five listed department managers for nine departments. A good question to ask the company is why there were no managers for the Marketing, Finance, Quality Management, and Development departments. Because Pewlett-Hackard is a large company, and these departments are vital in all organizations, this matter should be addressed accordingly.

Out of 300 thousand plus employees, the average yearly salary was $66,485. This number seems rather low considering the amount of senior level positions in the company. However, we were not given the location of the company, which might explain the average salary. In order to fill the staggering vacancies they face in the future, the company may need to adjust their salaries to attract new talent, and also keep their existing talent. Adjusting the salaries may prevent future costly turnovers. 

Finally, there are 1,549 employees eligible for the mentorship program. The company will need additional staff to accomplish the success of the planned program. Further analysis is needed to determine ages of existing employees. The age bracket to qualify for the mentorship program should be lowered in order to enable younger talent to participate in the program. Our findings showed that 1,549 employees are eligible for the mentorship program, but 90,398 are retiring, which leaves 88,849 open vacancies without mentors.

The analysis also showed that 5,800 employees are retiring from the Sales Department. However, the largest group of employees retiring by titles were Senior Engineers (29,414), followed by Senior Staff (28,255).

## Fig.8

### Average Salary
![avg_sal.PNG](PNGs/avg_sal.png)

## Fig.9

## Retiring Sales Dept.
![ret_sales.PNG](PNGs/ret_sales.png)

## Fig.10

### Total Count Eligible for Mentorship Program
![total_mnt.PNG](PNGs/total_mnt.png)

## Fig.11 

### Total Count Eligible for Mentorship Program by Title
![ment_by_title.PNG](PNGs/ment_by_title.png)

## Fig.11a

### Versus Retiring by Same Titles
![ret_titles.PNG](PNGs/ret_titles.png)

## Fig.12

### Difference Between Retiring Employees & Mentors
![vacancies.PNG](PNGs/vacancies.png)



