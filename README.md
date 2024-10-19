# Data Analysis Graduation Project For DEPI

## Project Overview
A comprehensive analysis of employee attrition, satisfaction, and performance using IBM's HR Analytics dataset. This project aims to help decision-makers proactively address workforce management challenges through data-driven insights.

## Team Members
- Ahmed Khoukh
- Salma Abdrabou
- Aml Abdo Zayed
- Mennatullah Taha
- Abdelrhman Aleskandrany
- Al-Qasem Ezzaldeen

Under the supervision of Eng. Ahmed Radwan

## Problem Statement
Employee attrition, satisfaction, and performance are critical factors in maintaining a productive workforce. High turnover, low job satisfaction, and poor work-life balance can negatively impact company success. This project analyzes and predicts key HR outcomes using historical employee data to help decision-makers address potential issues proactively.

## Key Objectives
1. **Evaluate Employee Performance**: Identify employees likely to leave the company using factors such as age, income, job satisfaction, overtime, and work-life balance
2. **Analyze Employee Attrition**: Investigate the impact of job involvement, job satisfaction, and years at the company on employee performance ratings
3. **Assess Monthly Income**: Forecast employee salary based on features like age, years at the company, job satisfaction, and performance rating
4. **Measure Job Satisfaction**: Analyze factors influencing employee job satisfaction, focusing on work-life balance, overtime, and training opportunities

## Dataset Information
- **Source**: Kaggle IBM HR Analytics Attrition Dataset
- **Size**: 1,470 employee records
- **Features**: 35 columns
- **Format**: CSV file

## Methodology

### 1. Data Preprocessing
- Removed irrelevant columns
- Handled missing values using median for numerical and mode for categorical data
- Exported cleaned data to "Clean_data.csv"

### 2. Exploratory Data Analysis
Used various visualization techniques including:
- Distance from home vs. attrition analysis
- Working years distribution
- Monthly income patterns
- Overtime impact analysis
- Department-wise attrition distribution
- Correlation analysis using heatmaps

### 3. Predictive Modeling
Implemented several machine learning models:
- Random Forest Classifier for attrition prediction (96% accuracy)
- Linear Regression for salary prediction (R² score: 89%)
- Logistic Regression for performance rating prediction (94% accuracy)
- Random Forest Classifier for work-life balance prediction (92% accuracy)

## Key Findings
1. Employees closer to the workplace showed higher attrition rates
2. Fresh employees were more prone to attrition compared to experienced staff
3. Lower monthly income correlated with higher attrition rates
4. Overtime work significantly impacted attrition rates

## Strategic Recommendations
1. **Enhance Work-Life Balance**
   - Implement flexible work schedules
   - Offer remote work options

2. **Career Development**
   - Provide training opportunities
   - Create clear career progression paths

3. **Recognition and Rewards**
   - Implement recognition programs
   - Develop performance-based rewards

4. **Workload Management**
   - Monitor employee workloads
   - Prevent burnout through proper resource allocation

5. **Compensation**
   - Regular salary reviews
   - Competitive pay adjustments

6. **Feedback Mechanisms**
   - Establish regular feedback channels
   - Conduct thorough exit interviews

## Tools Used
- Python (Pandas, NumPy)
- Visualization: Matplotlib, Seaborn, Plotly
- SQL
- Machine Learning: Scikit-learn, Imbalanced-learn
- Dashboard: Tableau

## Challenges and Limitations
- Initial overfitting issues with Random Forest algorithm
- Addressed through model optimization and algorithm selection
- Limited dataset size may impact generalizability

## Conclusion
The project successfully identified key factors influencing employee attrition and provided actionable insights for improving workforce retention. The implemented predictive models demonstrate high accuracy in forecasting attrition risks and salary trends. Continuous monitoring and refinement of retention strategies based on data-driven insights will be crucial for maintaining a satisfied and motivated workforce.
