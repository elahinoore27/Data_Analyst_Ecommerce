E-Commerce Sales Analytics

An end-to-end data analytics project that turns raw e-commerce transactions into clear business insights. The project demonstrates a practical data analyst workflow: Python for data preparation, MySQL for analysis, and Power BI for reporting.

## Overview

The goal is to understand sales performance, product demand, customer locations, payment preferences, and order status. It takes the data from an unclean Excel file through cleaning and analysis to an interactive dashboard that stakeholders can explore.

## Dataset

The cleaned dataset contains **380 transaction records** and **20 columns**. It includes order, customer, product, pricing, payment, delivery, and status information.

Examples of the fields include `Order_ID`, `Order_Date`, `City`, `State`, `Product`, `Category`, `Qty`, `Unit_Price`, `Discount`, `Payment_Mode`, `Order_Status`, `Sales`, `Net_Amount`, and `Profit`.

## Tools Used

| Tool | Purpose |
| --- | --- |
| Python | Load the data, perform EDA, clean records, and create derived fields |
| Pandas and NumPy | Data transformation and analysis |
| Jupyter Notebook | Run the Python workflow step by step |
| MySQL | Store the cleaned data and run SQL queries |
| SQLAlchemy and PyMySQL | Connect Python to MySQL |
| Power BI | Build an interactive sales dashboard |

## Project Workflow

```text
Raw Excel data
    ↓
Python: EDA and data cleaning
    ↓
Clean_Ecommerce.csv
    ↓
MySQL: SQL analysis
    ↓
Power BI dashboard
```

## Data Cleaning and EDA

The Python notebook follows these steps:

1. Loads the raw Excel dataset and reviews records, data types, statistics, and shape.
2. Checks for missing values and duplicate records.
3. Replaces `N/A`, `NULL`, and blank values with missing values.
4. Removes duplicate rows and extra spaces.
5. Standardises customer, city, and state names.
6. Validates email addresses and converts date and numeric fields.
7. Removes records with invalid quantities and fills selected missing values.
8. Creates useful analysis fields such as sales, year, weekday, net amount, and profit.
9. Exports the cleaned data for MySQL and Power BI.

## SQL Analysis

The SQL script answers common business questions, including:

- How many orders are in the dataset?
- What are total sales and total profit?
- Which products and cities generate the most sales?
- How do sales change by month?
- Which product generates the highest profit?
- Which payment methods are used most often?
- Which orders were cancelled?

## Power BI Dashboard

The dashboard is designed to give stakeholders a quick view of e-commerce performance. Recommended visuals include:

- KPI cards for Total Sales, Total Orders, Total Profit, and Average Order Value
- Monthly sales trend
- Sales by category, product, and city
- Payment-mode distribution
- Order-status breakdown
- Top products and profit by category
- Slicers for year, month, category, city, and payment mode

## Results Snapshot

The following results are calculated from `Clean_Ecommerce.csv`:

| Metric | Result |
| --- | ---: |
| Total orders | 380 |
| Net sales | 3,673,140.44 |
| Estimated profit | 734,628.09 |
| Average order value | 9,666.16 |
| Top-selling product | Laptop |
| Top category | Electronics |
| Most-used payment method | Wallet (87 orders) |

> These figures include every order status. Apply the relevant business rule for cancelled and returned orders before treating them as realised revenue.

## How to Run

### 1. Prepare the project files

Keep these files in the same project folder:

```text
python_Data.ipynb          # Python EDA and cleaning workflow
Clean_Ecommerce.csv        # Cleaned dataset
Final_SQL_Ecommerce.sql    # MySQL analysis queries
Steps of Cleaning.docx     # Cleaning-process notes
Ecommerce_Unclean_Project.xlsx  # Original source file required by the notebook
```

### 2. Set up Python

Use Python 3.10 or later, then install the required packages:

```bash
pip install pandas numpy sqlalchemy pymysql jupyter openpyxl
```

Start Jupyter and run `python_Data.ipynb` from top to bottom:

```bash
jupyter notebook
```

Before running the notebook, update the two date-conversion arguments from `errors='corece'` to `errors='coerce'`. Also create the `Month`, `Net_Amount`, and `Profit` fields before exporting to MySQL, because the SQL script uses them.

### 3. Load the data into MySQL

Create the database:

```sql
CREATE DATABASE ecommerce;
```

In the notebook, use your own local MySQL credentials. Do not commit passwords to the repository.

```python
from sqlalchemy import create_engine

engine = create_engine(
    "mysql+pymysql://<username>:<password>@localhost:3306/ecommerce"
)
df.to_sql("orders", con=engine, if_exists="replace", index=False)
```

### 4. Run the SQL queries

Open MySQL Workbench or another MySQL client, select the `ecommerce` database, and run `Final_SQL_Ecommerce.sql`.

### 5. Build the Power BI dashboard

Connect Power BI to the MySQL `orders` table (or import `Clean_Ecommerce.csv`). Create the measures and visuals listed above, then save the finished `.pbix` file in the project folder.

## Project Files

```text
python_Data.ipynb          # Python EDA, cleaning, and MySQL load
Clean_Ecommerce.csv        # Cleaned e-commerce dataset
Final_SQL_Ecommerce.sql    # MySQL business queries
Steps of Cleaning.docx     # Cleaning-process documentation
README.md                  # Project overview and setup guide
```

## Key Skills Demonstrated

- Exploratory data analysis and data cleaning with Python
- SQL querying and relational database workflows
- KPI design and dashboard development in Power BI
- Translating raw transactions into business-ready insig
