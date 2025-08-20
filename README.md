# Migration-Analytics-with-Python-SQL-Excel
"A complete data analytics case study of student migration patterns worldwide, showcasing Python scripts, SQL queries, and interactive Excel dashboards."
# Global Student Migration Analysis  

## Project Overview  
This project analyzes global student migration patterns using a dataset of 5,000 international students.  
It demonstrates a complete data analysis workflow with Python, SQL, and Excel, covering:  

- Data cleaning and preparation  
- Exploratory data analysis (EDA)  
- Feature engineering  
- Visualization and dashboards  
- KPI tracking and insights  

The dataset includes demographics, academic background, scholarships, language proficiency, visa information, and career outcomes.  

## Objectives  
- Prepare and clean raw data for analysis  
- Explore migration, academic, and career outcomes  
- Compare students with scholarships versus non-scholarship students  
- Visualize global mobility and placement patterns  
- Extract insights for decision-making in education and recruitment  

## Tools and Technologies  
- **Python:** Pandas, NumPy, Matplotlib, Seaborn  
- **SQL:** Data validation, querying, and KPI calculations  
- **Excel:** Pivot tables, slicers, and interactive dashboards  

## Project Structure  
├── data/ # Dataset (student migration records)
├── python-analysis/ # Python scripts and notebooks
├── sql-analysis/ # SQL queries and scripts
├── excel-dashboard/ # Excel pivot tables and dashboards
└── README.md # Documentation

markdown
Copy
Edit

## Workflow  

### Data Cleaning and Preparation  
- Removed duplicates and standardized inconsistent entries  
- Treated missing values logically (e.g., salary = NaN instead of 0)  
- Normalized text fields for consistency  

### Feature Engineering  
- Created binary flags (`scholarship_flag`, `placement_flag`)  
- Derived new metrics such as salary by scholarship status and placement rates  

### Exploratory Data Analysis (EDA)  
- Identified top destinations and most popular fields of study  
- Examined placement and salary distributions  
- Investigated correlations between GPA, test scores, and salaries  

### Visualization and Dashboards  
- **Python:** bar charts, histograms, heatmaps, line plots  
- **SQL:** aggregation queries and KPI calculations  
- **Excel:** interactive dashboard with KPIs and slicers  

### Key Performance Indicators (KPIs)  
- Placement Rate: **50.18%**  
- Average Starting Salary: **$88,618**  
- Scholarship Rate: **52%**  
- Top Employers: **Microsoft, Google, Apple, IBM**  

## Insights and Findings  
- Scholarships are strongly associated with higher placement rates and better salaries  
- Language proficiency significantly affects employability abroad  
- Engineering and Data Science graduates achieve the highest salary outcomes  
- Leading recruiters include Microsoft, Google, Apple, IBM, and Deloitte  

## Conclusion  
This project demonstrates how Python, SQL, and Excel can be used together to transform raw datasets into actionable insights.  
By analyzing student migration patterns, stakeholders can make informed decisions regarding scholarships, partnerships, and career support initiatives.  

## About  
Developed as part of training at **National Telecommunication Institute (NTI)** and **ITIDA**.
