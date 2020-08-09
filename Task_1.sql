SELECT   EXTRACT (YEAR FROM a.from_date) AS calendar_year,
	       b.gender,
	       COUNT(b.emp_no) AS num_of_employees
FROM     t_dept_emp AS a
	       JOIN t_employees b
	         ON a.emp_no = b.emp_no
GROUP BY calendar_year, b.gender
HAVING   EXTRACT (YEAR FROM a.from_date) >= 1990;