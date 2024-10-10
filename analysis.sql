create database hrdata;
use hrdata;
CREATE TABLE hrdata(
    EmployeeNumber INT PRIMARY KEY,
    Age INT,
    Attrition VARCHAR(255),
    BusinessTravel VARCHAR(255), 
    DailyRate INT,
    Department VARCHAR(255), 
    DistanceFromHome INT,
    Education INT, 
    EducationField VARCHAR(255), 
    EnvironmentSatisfaction INT,
    Gender VARCHAR(255), 
    HourlyRate DECIMAL(5,2),
    JobInvolvement INT, 
    JobLevel INT, 
    JobRole VARCHAR(255), 
    JobSatisfaction INT,
    MaritalStatus VARCHAR(255), 
    MonthlyIncome DECIMAL(10,2),
    MonthlyRate INT,
    NumCompaniesWorked INT,
    OverTime VARCHAR(255),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT, 
    StockOptionLevel INT, 
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT, 
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

-- Performance and compensation 
-- Is there a relationship between salary (MonthlyIncome) and job performance?
SELECT 
    PerformanceRating,
    round(AVG(MonthlyIncome), 2) AS AverageMonthlyIncome,
    COUNT(*) AS EmployeeCount
FROM hrdata
GROUP BY PerformanceRating
ORDER BY PerformanceRating;

-- Do employees with higher job satisfaction receive better performance ratings? 
SELECT 
    JobSatisfaction,
    round(AVG(PerformanceRating), 2) AS AveragePerformanceRating,
    COUNT(*) AS EmployeeCount
FROM hrdata
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- How do stock options affect employee retention?
SELECT 
    StockOptionLevel,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate,
    round(AVG(YearsAtCompany),2) AS AverageYearsAtCompany
FROM hrdata
GROUP BY StockOptionLevel
ORDER BY StockOptionLevel;

-- Attrition Rate per Job Role
SELECT 
    JobRole,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY JobRole
ORDER BY AttritionRate DESC;

-- Does the number of hours worked (OverTime) impact job satisfaction?
SELECT 
    OverTime,
    round(AVG(JobSatisfaction), 2) AS AverageJobSatisfaction,
    COUNT(*) AS EmployeeCount
FROM hrdata
GROUP BY OverTime
ORDER BY OverTime;

-- How do training opportunities (TrainingTimesLastYear) affect employee satisfaction and retention?
SELECT 
    TrainingTimesLastYear,
    round(AVG(JobSatisfaction),2) AS AverageJobSatisfaction,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY TrainingTimesLastYear
ORDER BY TrainingTimesLastYear;

-- Attrition Rate per Job satisfaction
SELECT 
    JobSatisfaction,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Demographics & Employee Experience
-- Do younger employees leave the company more frequently than older employees?
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age >= 50 THEN '50 and above'
    END AS AgeGroup,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

-- What are the differences in satisfaction levels between male and female employees?
SELECT 
    Gender,
    round(AVG(JobSatisfaction), 2) AS AverageJobSatisfaction,
    COUNT(*) AS EmployeeCount,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY Gender
ORDER BY Gender;

-- Are employees in certain educational fields more likely to have higher job satisfaction?
SELECT 
    EducationField,
    round(AVG(JobSatisfaction), 2) AS AverageJobSatisfaction,
    COUNT(*) AS EmployeeCount,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY EducationField
ORDER BY AverageJobSatisfaction DESC;

-- Job Roles & Progression
-- Do employees who frequently switch companies (NumCompaniesWorked) have higher attrition rates?
SELECT 
    NumCompaniesWorked,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY NumCompaniesWorked
ORDER BY AttritionRate DESC;

-- How does promotion history (YearsSinceLastPromotion) correlate with job satisfaction and retention?
SELECT 
    YearsSinceLastPromotion,
    round(AVG(JobSatisfaction), 2) AS AverageJobSatisfaction,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

-- Departmental & Organizational Trends
-- Which department has the highest satisfaction level among employees?
SELECT 
    Department,
    round(AVG(JobSatisfaction), 2) AS AverageJobSatisfaction,
    COUNT(*) AS EmployeeCount
FROM hrdata
GROUP BY Department
ORDER BY AverageJobSatisfaction DESC;

-- Travel & Work Locations
-- Does frequent business travel affect employee retention or job satisfaction?
SELECT 
    BusinessTravel,
    AVG(JobSatisfaction) AS AverageJobSatisfaction,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY BusinessTravel
ORDER BY BusinessTravel;

-- How does distance from home (DistanceFromHome) impact employee retention or satisfaction?
SELECT 
    CASE 
        WHEN DistanceFromHome < 5 THEN '0-4 miles'
        WHEN DistanceFromHome BETWEEN 5 AND 10 THEN '5-10 miles'
        WHEN DistanceFromHome BETWEEN 11 AND 15 THEN '11-15 miles'
        WHEN DistanceFromHome > 15 THEN '16+ miles'
    END AS DistanceRange,
    round(AVG(JobSatisfaction), 2) AS AverageJobSatisfaction,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    round((COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2) AS AttritionRate
FROM hrdata
GROUP BY DistanceRange
ORDER BY AttritionRate DESC;
