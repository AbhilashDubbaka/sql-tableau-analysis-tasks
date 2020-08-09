SELECT   c.dept_name,
	       d.gender,
		     b.emp_no,
		     b.from_date,
		     b.to_date,
		     a.calendar_year,
		     CASE WHEN EXTRACT (YEAR FROM b.to_date) >= a.calendar_year
		 		      AND EXTRACT (YEAR FROM b.from_date) <= a.calendar_year
				      THEN 1
		 	        ELSE 0
			        END AS active
FROM     (SELECT EXTRACT (YEAR FROM hire_date) AS calendar_year
		      FROM t_employees
		      GROUP BY calendar_year) AS a
		     CROSS JOIN t_dept_manager AS b
	       JOIN t_departments AS c
		       ON b.dept_no = c.dept_no
		     JOIN t_employees AS d
	         ON b.emp_no = d.emp_no
ORDER BY b.emp_no, calendar_year;