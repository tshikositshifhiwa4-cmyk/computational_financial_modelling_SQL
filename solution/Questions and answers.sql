/*key:
p = payments, origional sum of the money (Principal)
I = interest
r = interest rate (AnnualRate)
t = time (TermYears)
A = annual total amount
n = number of years (TermYears)
m = number of conversions per year (frequency)
i = inflation rate (AnnualRate)
^ = exponent (power of)
* = multiplication
/ = division
+ = additiion
- = subtraction
*/
----------------------------------------------------------------------------------------------------

/* Quetions and Answers */

/* 1.  Simple Interest: I = P * r * t*/
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    ROUND(Principal * AnnualRate * TermYears, 2) AS Result
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 1;

/* 2.  Annual Compound: A = P * (1 + r)^n */
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    ROUND(Principal * POWER((1 + AnnualRate), TermYears), 2) AS Result
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 2;

/*3.  Hire Purchase Installment: Monthly = [P * (1 + r * t)] / 36 */
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    ROUND((Principal * (1 + (AnnualRate * TermYears))) / 36, 2) AS Result
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 3;

/*  4.  Inflation Projection: A = P * (1 + i)^n */
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    ROUND(Principal * POWER((1 + AnnualRate), TermYears), 2) AS Result
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 4;

/* 5.  Reducing Balance Depreciation: A = P * (1 - i)^n */
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    ROUND(Principal * POWER((1 - AnnualRate), TermYears), 2) AS Result
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 5;

/* 6.  Quarterly Compound: A = P * (1 + r/4)^(4 * n) */
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    Frequency,
    ROUND(Principal * POWER((1 + (AnnualRate / Frequency)), (Frequency * TermYears)), 2) AS Result
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 6;

/* 7.  Monthly Loan Accrual: I = [P * (1 + r/12)^12] - P */
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    Frequency,
    ROUND((Principal * POWER((1 + (AnnualRate / Frequency)), (Frequency * TermYears))) - Principal, 2) AS Result
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 7;

/* 8.  Doubling Time (Simple): t = 1 / r */
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    ROUND(1 / AnnualRate, 2) AS YearsToDouble
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 8;

/* 9.  Effective Annual Rate: EAR = (1 + r/m)^m - 1 */
SELECT
    TaskID,
    ModelName,
    AnnualRate,
    Frequency,
    ROUND(POWER((1 + (AnnualRate / Frequency)), Frequency) - 1, 4) AS EffectiveAnnualRate
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 9;

/* 10. Semi-Annual Growth: A = P * (1 + r/2)^(2 * n) */
SELECT
    TaskID,
    ModelName,
    Principal,
    AnnualRate,
    TermYears,
    Frequency,
    CAST (ROUND(Principal * POWER((1 + (AnnualRate / Frequency)), (Frequency * TermYears)), 2) AS DECIMAL (10,2)
    )AS Result
FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]
WHERE TaskID = 10;
