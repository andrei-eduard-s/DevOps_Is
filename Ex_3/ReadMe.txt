In order to solve this task, I did the following steps:

1. Create a MySql container. Create a database named “company”:
	"docker run -d --name my_mysql_container -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=company mysql:latest"

2. Import the company.sql file in your company database.
	"docker cp company.sql my_mysql_container:/company.sql"

3. Create a user and assign all the permissions required for the database “company”:
	"docker exec -it my_mysql_container mysql -u root -p"
	# Now we are running our commands on MySQL server:
	"CREATE USER 'andrei'@'%' IDENTIFIED BY 'admin';
	"GRANT ALL PRIVILEGES ON company.* TO 'andrei'@'%';
	"FLUSH PRIVILEGES;"

# In Exec tab, running the command to add all the data from the company.sql file to our database "companie", I noticed a bug:
"sh-4.4# mysql -u root -p companie < company.sql
	Enter password: 
	ERROR 1366 (HY000) at line 12: Incorrect integer value: 'Consulting' for column 'department' at row 41"
 # This appears because we try to add the value 'Consulting' in the column 'department' which requires an 'INT' value.
	I will update the file company.sql to use an INT value in that specific column.

4. Find the average salary for each department:
	"SELECT department_name, AVG(salary) AS average_salary FROM employees
	JOIN departments ON employees.department = departments.department_id
	GROUP BY department_name;"

