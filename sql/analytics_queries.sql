
--Total transactions & revenue
SELECT
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue
FROM transactions
WHERE status = 'SUCCESS';

---2️ Fraud / failure rate
SELECT
    COUNT(*) AS total_txns,
    SUM(is_fraud) AS fraud_txns,
    CAST(SUM(is_fraud) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS fraud_percentage
FROM transactions;

----Top customers by spend
SELECT TOP 10
    c.customer_id,
    SUM(t.amount) AS total_spent
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.status = 'SUCCESS'
GROUP BY c.customer_id
ORDER BY total_spent DESC;

----Transactions by hour
SELECT
    DATEPART(HOUR, transaction_date) AS txn_hour,
    COUNT(*) AS txn_count
FROM transactions
GROUP BY DATEPART(HOUR, transaction_date)
ORDER BY txn_hour;

----Rank customers by spending
SELECT
    customer_id,
    SUM(amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS spending_rank
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY customer_id;

