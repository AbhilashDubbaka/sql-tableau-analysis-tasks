SELECT   a.gender,
	       ROUND(AVG(b.salary), 2) AS salary,
	       EXTRACT (YEAR FROM b.from_date) AS calendar_year,
	       d.dept_name
FROM     t_employees AS a
	       JOIN t_salaries AS b
	         ON a.emp_no = b.emp_no
	       JOIN t_dept_emp AS c
	         ON a.emp_no = c.emp_no
	       JOIN t_departments AS d
	         ON c.dept_no = d.dept_no
GROUP BY d.dept_no, a.gender, calendar_year
HAVING   EXTRACT (YEAR FROM b.from_date) <= 2002
ORDER BY d.dept_no