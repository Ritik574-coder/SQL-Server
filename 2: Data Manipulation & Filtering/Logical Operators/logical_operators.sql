/*
===========================================
Logical Operators – Lesson Overview
===========================================

1. AND Operator
   - Description: Returns rows where *all* conditions are true.
   - Use Case: Find employees WHERE Salary > 50000 AND Department = 'IT'.

2. OR Operator
   - Description: Returns rows where *at least one* condition is true.
   - Use Case: Get products WHERE Category = 'Electronics' OR Price < 100.

3. NOT Operator
   - Description: Negates a condition (returns rows where condition is false).
   - Use Case: Show students WHERE NOT Grade = 'F'.

4. Combining Multiple Conditions
   - Description: Mix AND, OR, NOT for complex filters.
   - Use Case: WHERE (Salary > 50000 AND Department = 'HR') OR Department = 'Finance'.

5. Operator Precedence
   - Description: SQL evaluates NOT first, then AND, then OR.
   - Use Case: WHERE NOT (Department = 'Sales' OR Department = 'Marketing').

6. Using Parentheses
   - Description: Control evaluation order explicitly.
   - Use Case: WHERE (Salary > 50000 AND Department = 'IT') OR (Salary < 30000 AND Department = 'Support').

-------------------------------------------
Summary:
Logical operators let you combine multiple conditions in the WHERE clause.
- AND = all conditions must be true
- OR = at least one condition must be true
- NOT = reverses the condition
Parentheses ensure clarity and correct evaluation order.
-------------------------------------------
Author : Ritik__
*/
