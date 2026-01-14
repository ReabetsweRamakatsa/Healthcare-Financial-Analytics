-- 1. Departmental Profitability & Efficiency
WITH DeptFinancials AS (
    SELECT 
        d.department_name,
        COUNT(p.patient_id) AS patient_count,
        SUM(b.revenue) AS total_revenue,
        SUM(b.cost) AS total_cost
    FROM billing b
    JOIN patients p ON b.patient_id = p.patient_id
    JOIN departments d ON p.department_id = d.department_id
    GROUP BY d.department_name
)
SELECT 
    department_name,
    patient_count,
    total_revenue,
    total_cost,
    (total_revenue - total_cost) AS total_margin,
    -- KPI: Profitability per dollar earned
    ((total_revenue - total_cost) / NULLIF(total_revenue, 0)) * 100 AS margin_percent,
    -- KPI: Operating efficiency
    (total_cost / NULLIF(total_revenue, 0)) AS cost_to_charge_ratio
FROM DeptFinancials;

-- 2. Market Share & Revenue Concentration
WITH RevenueShare AS (
    SELECT 
        d.department_name,
        SUM(b.revenue) AS dept_revenue
    FROM billing b
    JOIN patients p ON b.patient_id = p.patient_id
    JOIN departments d ON p.department_id = d.department_id
    GROUP BY d.department_name
)
SELECT 
    department_name,
    dept_revenue,
    -- Window function to calculate % of total hospital revenue
    (dept_revenue / SUM(dept_revenue) OVER()) * 100 AS revenue_market_share_pct
FROM RevenueShare;

-- 3. Service Complexity (Case Mix) Analysis
WITH CaseAverages AS (
    SELECT 
        d.department_name,
        AVG(b.revenue) AS avg_rev_per_patient,
        AVG(b.cost) AS avg_cost_per_patient
    FROM billing b
    JOIN patients p ON b.patient_id = p.patient_id
    JOIN departments d ON p.department_id = d.department_id
    GROUP BY d.department_name
)
SELECT 
    department_name,
    avg_rev_per_patient,
    avg_cost_per_patient,
    -- Classification for dashboard filtering
    CASE 
        WHEN avg_rev_per_patient > (SELECT AVG(revenue) FROM billing) THEN 'High Complexity'
        ELSE 'Routine/Low Complexity'
    END AS service_tier
FROM CaseAverages;

-- 4. ROI & Resource Multiplier
WITH ROICalculation AS (
    SELECT 
        d.department_name,
        SUM(b.revenue) AS total_revenue,
        SUM(b.cost) AS total_cost
    FROM billing b
    JOIN patients p ON b.patient_id = p.patient_id
    JOIN departments d ON p.department_id = d.department_id
    GROUP BY d.department_name
)
SELECT 
    department_name,
    -- How many dollars back for every $1 spent
    (total_revenue / NULLIF(total_cost, 0)) AS roi_multiplier
FROM ROICalculation
ORDER BY roi_multiplier DESC;
