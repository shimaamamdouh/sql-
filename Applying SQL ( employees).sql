/* 

Hello, My name is Shimaa
it's your first lessn SqL statement 

*/

# * means All 
 #Capital 
SELECT 
    *
FROM
    employees;
  #Small  
  #CTRL + B 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
    #AND Vs OR 
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis' AND gender = 'F';
    
    #CTRL+ B
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
        
  /*
  Assignment

Task 1:
Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.

Task 2:
Extract all records from the Employees table except those whose first name is John, Mark, or Jacob.

*/

#NOTES 

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John', 'Mark', 'Jacob');
    
    #LIKE VS NOT LIKE 
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('An%');
    
    # AN  (%) Starting with 
    
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name Like ('%An');
    
# %An  Ending with 

    
/*Assignment

Working with the "employees" table, use the LIKE operator to select the data about all individuals, whose first name starts with "Mark"; specify that the name can be succeeded by any sequence of characters.

Retrieve a list with all employees who have been hired in the year 2000.

Retrieve a list with all employees whose employee number is written with 5 characters, and starts with "1000".

*/

SELECT 
    *
FROM
    employees
WHERE
    first_name Like ('Mark_');





SELECT 
    *
FROM
    employees
WHERE
    hire_date Like ('2000%');
    
    
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no Like ('1000%');
    
    
    
 /*Assignment

Extract all individuals from the "employees" table whose first name contains "Jack".

Once you have done that, extract another list containing the names of employees that do not contain "Jack". 
*/
  SELECT 
    *
FROM
    employees
WHERE
    first_name = ('Jack');

    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Jack');
    
    
    /*Assignment

Select all the information from the "salaries" table regarding contracts from 66,000 to 70,000 dollars per year.

Retrieve a list with all individuals whose employee number is not between "10004" and "10012".

Select the names of all departments with numbers between "d003" and "d006".

*/


SELECT 
    *
FROM
    employees
WHERE
    salaries between '60000' AND '70000';
    
    
    /*
    Assignment

Select all data from the "employees" table, ordering it by "hire date" in descending order.
*/

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;
#first name, last name order in ASC

SELECT 
    *
FROM
    employees
ORDER BY fist_name, last_name ASC;

/*
This will be a slightly more sophisticated task.

Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. The second column, renamed to "emps_with_same_salary", must show the number of employees contracted to that salary. Lastly, sort the output by the first column.

*/


SELECT 
    *
FROM 
 salaries
 Where salary >= '80000';
 
 
 SELECT 
    salary, count(salary) AS 'emps_with same salary'
FROM 
 salaries
 Where salary >= '80000'
 Group by salary
 order by salary;
 
 
 

 
    






    

    
