CREATE OR REPLACE FUNCTION NthHighestSalary(n INT) 
RETURNS TABLE (Salary INT) AS $$
BEGIN
  IF n < 1 THEN
    -- If n is 0 or negative, return NULL
    RETURN QUERY SELECT NULL::INT;
  ELSE
    RETURN QUERY
    SELECT t.salary
    FROM (
      SELECT DISTINCT e.salary
      FROM Employee e
      ORDER BY e.salary DESC
      OFFSET n - 1 LIMIT 1
    ) t;
  END IF;
END;
$$ LANGUAGE plpgsql;
