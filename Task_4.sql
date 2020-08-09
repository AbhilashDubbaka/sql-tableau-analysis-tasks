DROP FUNCTION IF EXISTS filter_salary;

CREATE OR REPLACE FUNCTION filter_salary (IN p_min_salary DOUBLE PRECISION, IN p_max_salary DOUBLE PRECISION)
RETURNS TABLE (gender gender, dept_name VARCHAR(40), avg_salary NUMERIC )
AS $$
BEGIN
RETURN QUERY(SELECT   b.gender,
                      d.dept_name,
                      ROUND(AVG(a.salary), 0) AS avg_salary
             FROM     t_salaries AS a
                      JOIN t_employees AS b
                        ON a.emp_no = b.emp_no
                      JOIN t_dept_emp AS c
                        ON b.emp_no = c.emp_no
                      JOIN t_departments AS d
                        ON c.dept_no = d.dept_no
             WHERE    a.salary BETWEEN p_min_salary AND p_max_salary
             GROUP BY d.dept_no, b.gender);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM filter_salary(50000, 90000);