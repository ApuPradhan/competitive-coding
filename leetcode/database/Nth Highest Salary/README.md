# 📊 Nth Highest Salary in PostgreSQL

This project provides a PostgreSQL stored function `NthHighestSalary(n)` that returns the **n-th highest distinct salary** from an `Employee` table.  
If there are fewer than `n` distinct salaries, or if `n` is invalid (≤ 0), the function safely returns `NULL`.

---

## 🗄️ Table Definition

The problem is based on an `Employee` table:

```sql
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);
id → Unique identifier for each employee.

salary → Employee salary (can have duplicates).

🚀 Function Implementation
sql
Copy code
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
📝 Explanation of the Solution
Guard Clause

If the input n is less than 1, the function immediately returns NULL.

Query Logic

SELECT DISTINCT e.salary → ensures only unique salary values.

ORDER BY e.salary DESC → sorts salaries from highest to lowest.

OFFSET n - 1 LIMIT 1 → skips the first n-1 salaries and selects the nth one.

Wrapper Function

The query is wrapped in a PL/pgSQL function so it can be reused as NthHighestSalary(n).

Always returns exactly one row (either a salary value or NULL).

✅ Example Usage
Example 1: Normal Case
sql
Copy code
INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);

SELECT * FROM NthHighestSalary(2);
Output:

markdown
Copy code
 salary 
--------
 200
Example 2: Not Enough Salaries
sql
Copy code
SELECT * FROM NthHighestSalary(5);
Output:

markdown
Copy code
 salary 
--------
 NULL
Example 3: Invalid Input
sql
Copy code
SELECT * FROM NthHighestSalary(0);
Output:

markdown
Copy code
 salary 
--------
 NULL
⚡ Performance Tip
For large datasets, create an index to speed up top-N queries:

sql
Copy code
CREATE INDEX idx_salary_desc ON Employee (salary DESC);
ANALYZE Employee;
This allows PostgreSQL to fetch the top salaries directly from the index instead of scanning and sorting the entire table.

🏆 Key Takeaways
Robust → Handles invalid input (n ≤ 0).

Correct → Returns NULL if fewer than n distinct salaries.

Efficient → Index-friendly for faster lookups.

Reusable → Can be called as SELECT * FROM NthHighestSalary(n);