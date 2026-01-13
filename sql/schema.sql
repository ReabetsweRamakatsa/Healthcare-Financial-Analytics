CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE billing (
    billing_id INT PRIMARY KEY,
    patient_id INT,
    billing_date DATE,
    revenue DECIMAL(10,2),
    cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
