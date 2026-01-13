SELECT d.department_name,
       SUM(b.revenue) AS total_revenue,
       SUM(b.cost) AS total_cost,
       SUM(b.revenue - b.cost) AS margin
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department_name;

SELECT d.department_name,
       AVG(b.cost) AS avg_cost_per_patient
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department_name;
