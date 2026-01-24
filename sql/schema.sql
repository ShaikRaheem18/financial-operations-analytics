CREATE DATABASE financial_ops;
USE financial_ops;

drop table customers;
drop table transactions;


CREATE TABLE customers (
    customer_id BIGINT PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(50),
    age_group VARCHAR(50),
    risk_profile VARCHAR(50)
);

drop table branches;
CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    manager_name VARCHAR(50)
);


CREATE TABLE transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    customer_id BIGINT,
    branch_id INT,
    transaction_date DATETIME,
    amount DECIMAL(10,2),
    merchant VARCHAR(100),
    category VARCHAR(50),
    payment_method VARCHAR(50),
    status VARCHAR(50),
    is_fraud INT,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

    CONSTRAINT fk_branch
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);