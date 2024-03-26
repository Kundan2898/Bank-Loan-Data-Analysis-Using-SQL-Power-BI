--Total Loan Applications
SELECT count(DISTINCT id) AS "Total Loan Applications" FROM bank_loan_data;

--Total Funded Amount
SELECT sum(loan_amount) AS "Total Funded Amount" FROM bank_loan_data;

--Total Amount Recieved
SELECT sum(total_payment) AS "Total Amount Recieved" FROM bank_loan_data;

--Average Intrest Rate
SELECT avg(int_rate)*100 AS "Average Intrest Rate" FROM bank_loan_data;

--Average DTI
SELECT avg(dti)*100 AS "Average DTI" FROM bank_loan_data;

--Good Loan Amount Percentage
SELECT (SELECT count(id) FROM bank_loan_data WHERE loan_status='Fully Paid' OR loan_status='Current')*100/count(id) AS "Good Loan Amount Percentage" 
FROM bank_loan_data;

--Good Loan Applications
SELECT count(id) AS "Good Loan Applications" FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status='Current';

--Good Loan Funded Amount
SELECT sum(loan_amount) AS "Good Loan Funded Amount" FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status='Current';

--Good Loan Revieved Amount
SELECT sum(total_payment) AS "Good Loan Revieved Amount" FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status='Current';




--Bad Loan Amount Percentage
SELECT (SELECT count(id) FROM bank_loan_data WHERE loan_status='Charged Off')*100/count(id) AS "Bad Loan Amount Percentage" 
FROM bank_loan_data;

--Bad Loan Applications
SELECT count(id) AS "Bad Loan Applications" FROM bank_loan_data
WHERE loan_status='Charged Off';

--Bad Loan Funded Amount
SELECT sum(loan_amount) AS "Bad Loan Funded Amount" FROM bank_loan_data
WHERE loan_status='Charged Off';

--Bad Loan Revieved Amount
SELECT sum(total_payment) AS "Bad Loan Revieved Amount" FROM bank_loan_data
WHERE loan_status='Charged Off';

--Loan Status Grid View
SELECT 
    loan_status,
    count(id) AS "Total Loan Applications",
    sum(total_payment) AS "Total Amount Recieved",
    sum(loan_amount) AS "Total Funded Amount",
    avg(int_rate)*100 AS "Average Intrest Rate",
    avg(dti)*100 AS "DTI" 
FROM bank_loan_data
GROUP BY loan_status;


--Monthly Trend By Issue Date
SELECT
    to_char(issue_date,'Month'),
    count(id) AS "Total Applications",
    sum(loan_amount) AS "Total Funded Amount",
    sum(total_payment) AS "Total Amount Recieved"
FROM bank_loan_data
GROUP BY to_char(issue_date,'Month'),EXTRACT(MONTH FROM issue_date)
ORDER BY EXTRACT(MONTH FROM issue_date);

--Regional Trend
SELECT
    address_state,
    count(id) AS "Total Applications",
    sum(loan_amount) AS "Total Funded Amount",
    sum(total_payment) AS "Total Amount Recieved"
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state;

--Trend By Term
SELECT
    term,
    count(id) AS "Total Applications",
    sum(loan_amount) AS "Total Funded Amount",
    sum(total_payment) AS "Total Amount Recieved"
FROM bank_loan_data
GROUP BY term
ORDER BY term;

--Trend By Employee Length
SELECT
    emp_length AS "Employee Length",
    count(id) AS "Total Applications",
    sum(loan_amount) AS "Total Funded Amount",
    sum(total_payment) AS "Total Amount Recieved"
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;

--Trend By Purpose
SELECT
    purpose AS "Purpose",
    count(id) AS "Total Applications",
    sum(loan_amount) AS "Total Funded Amount",
    sum(total_payment) AS "Total Amount Recieved"
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose;

--Trend By Home Ownership
SELECT
    home_ownership,
    count(id) AS "Total Applications",
    sum(loan_amount) AS "Total Funded Amount",
    sum(total_payment) AS "Total Amount Recieved"
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;







