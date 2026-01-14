# Healthcare Financial & Department Performance Analytics

SQL & Power BI project analysing healthcare departmental revenue, cost, and efficiency.
ervice lines are located.

# Data Transformation (SQL)

I utilized Common Table Expressions (CTEs) to modularize the logic, making the scripts easier to maintain and faster to execute.

# 1. Departmental Profitability Analysis

Analysis: Calculates the "bottom line" for each department.

Visual Suggestion: KPI Cards & Matrix Table.

Logic: Groups all billing records by department to find total margin and cost-to-charge ratios.

# 2. Revenue Concentration (Market Share)
Analysis: Determines the "Revenue Engines" of the facility.

Visual Suggestion: Donut Chart.

Logic: Uses a SUM() OVER() window function to calculate each department's percentage contribution to the total hospital revenue.

# 3. Service Complexity & Intensity
Analysis: Differentiates between high-volume/low-cost vs. low-volume/high-complexity departments.

Visual Suggestion: Scatter Plot.

Logic: Categorizes departments based on whether their average revenue per patient exceeds the hospital benchmark.

# Dashboard Features & KPI Definitions
Profit Margin %: Measures efficiency. High margins indicate strong negotiation with payers or excellent cost control.

ROI Multiplier: For every $1 spent on departmental operations, how many dollars are returned in revenue.

Case Mix Tier: A classification to help administrators understand the clinical intensity of the department's workload.

# Power BI Setup
Extract: Run the MasterFinancials SQL query to import a flattened, high-performance dataset.

Transform: Use DAX to create dynamic measures for Total Revenue, Total Margin %, and ROI.

# Business Impact
By using this dashboard, hospital leadership can:

Identify underperforming departments where costs exceed revenue.

Adjust staffing levels based on patient volume trends.

Optimize the "Payer Mix" by seeing which service lines are most lucrative.
