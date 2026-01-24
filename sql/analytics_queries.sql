/* =========================================================
   FINANCIAL OPERATIONS ANALYTICS QUERIES
   ========================================================= */

/* ---------------------------------------------------------
   1. Total Transactions & Total Revenue
   --------------------------------------------------------- */
SELECT
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue
FROM transactions
WHERE status = 'SUCCESS';


/* ---------------------------------------------------------
   2. Fraud / Failure Rate
   --------------------------------------------------------- */
SELECT
    COUNT(*) AS total_txns,
    SUM(is_fraud) AS fraud_txns,
    CAST(SUM(is_fraud) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS fraud_percentage
FROM transactions;


/* ---------------------------------------------------------
   3. Top 10 Customers by Total Spend
   --------------------------------------------------------- */
SELECT TOP 10
    c.customer_id,
    SUM(t.amount) AS total_spent
FROM transactions t
JOIN customers c 
    ON t.customer_id = c.customer_id
WHERE t.status = 'SUCCESS'
GROUP BY c.customer_id
ORDER BY total_spent DESC;


/* ---------------------------------------------------------
   4. Transactions by Hour of Day
   --------------------------------------------------------- */
SELECT
    DATEPART(HOUR, transaction_date) AS txn_hour,
    COUNT(*) AS txn_count
FROM transactions
GROUP BY DATEPART(HOUR, transaction_date)
ORDER BY txn_hour;


/* ---------------------------------------------------------
   5. Rank Customers by Spending (Window Function)
   --------------------------------------------------------- */
SELECT
    customer_id,
    SUM(amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS spending_rank
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY customer_id;


/* ---------------------------------------------------------
   6. Monthly Revenue Trend
   --------------------------------------------------------- */
SELECT
    FORMAT(transaction_date, 'yyyy-MM') AS txn_month,
    SUM(amount) AS monthly_revenue
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY FORMAT(transaction_date, 'yyyy-MM')
ORDER BY txn_month;


/* ---------------------------------------------------------
   7. Average Transaction Value
   --------------------------------------------------------- */
SELECT
    CAST(AVG(amount) AS DECIMAL(10,2)) AS avg_transaction_value
FROM transactions
WHERE status = 'SUCCESS';


/* ---------------------------------------------------------
   8. Failed Transaction Rate
   --------------------------------------------------------- */
SELECT
    COUNT(*) AS total_txns,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS failed_txns,
    CAST(
        SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS failed_percentage
FROM transactions;


/* ---------------------------------------------------------
   9. Revenue by Transaction Category
   --------------------------------------------------------- */
SELECT
    category,
    SUM(amount) AS total_revenue
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY category
ORDER BY total_revenue DESC;


/* ---------------------------------------------------------
   10. Customer Transaction Frequency
   --------------------------------------------------------- */
SELECT
    customer_id,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY customer_id
ORDER BY transaction_count DESC;


/* ---------------------------------------------------------
   11. Fraud Transactions by Hour
   --------------------------------------------------------- */
SELECT
    DATEPART(HOUR, transaction_date) AS txn_hour,
    SUM(is_fraud) AS fraud_count
FROM transactions
GROUP BY DATEPART(HOUR, transaction_date)
ORDER BY txn_hour;


/* ---------------------------------------------------------
   12. Top Revenue-Contributing Categories (Percentage)
   --------------------------------------------------------- */
SELECT
    category,
    SUM(amount) AS category_revenue,
    CAST(
        SUM(amount) * 100.0 /
        (SELECT SUM(amount) FROM transactions WHERE status = 'SUCCESS')
        AS DECIMAL(5,2)
    ) AS revenue_percentage
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY category
ORDER BY category_revenue DESC;

