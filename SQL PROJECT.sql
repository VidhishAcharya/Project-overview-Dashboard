--Project Status
WITH project_status AS (
    SELECT 
        project_id,
        project_name,
        project_budget,
        'Upcoming' AS Status
    FROM [upcoming projects]

    UNION ALL

    SELECT 
        project_id,
        project_name,
        project_budget,
        'Completed' AS Status
    FROM completed_projects
)
--Bigtable
SELECT 
 E.employee_id,
 E.first_name,
 E.last_name,
 E.job_title,
 E.salary,
 D.Department_Name,
 D.Department_Budget,
 pd.project_id,
 p.project_name,
 p.project_budget,
 p.Status
FROM employees E
JOIN departments D
 ON E.department_id=D.Department_ID
JOIN project_assignments pd
on pd.employee_id=E.employee_id
join project_status p
 on p.project_id=pd.project_id