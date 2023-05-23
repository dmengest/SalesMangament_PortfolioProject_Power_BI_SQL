# Sales Management Portfolio Project using Power BI and SQL

## Introduction 
This project demonstrates a range of techniques for cleaning and transforming data tables using SQL for creating interactive sale dashboard and report.
## Business Request
The business request entails the development of a comprehensive Power BI dashboard for internet sales analysis. The dashboard should enable tracking of top-performing customers and products, allow filtering of data for individual customers and products, and provide insights on sales performance compared to the budget. The objective is to enhance decision-making, identify sales opportunities, and monitor sales trends over time.

## Data Cleansing & Transformation (SQL)
To create the necessary data model for doing analysis and fulfilling the business needs defined in the user stories the following tables were extracted using SQL. One data source (sales budgets) were provided in Excel format and were connected in the data model in a later step of the process.

Below are the SQL statements for cleansing and transforming necessary data.

```
DIM_Customer:

SELECT 
  [CustomerKey] --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  , c.[FirstName] AS [First Name], 
  -- ,[MiddleName]
  c.[LastName] AS [Last Name], 
  c.FirstName + '' + c.LastName AS [Full Name] -- 
   ,[NameStyle]
  -- ,[BirthDate]
  -- ,[MaritalStatus]
  -- ,[Suffix]
  , CASE c.[Gender] WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender --,[EmailAddress]
  --,[YearlyIncome]
  -- ,[TotalChildren]
  -- ,[NumberChildrenAtHome]
  -- ,[EnglishEducation]
  -- ,[SpanishEducation]
  -- ,[FrenchEducation]
  -- ,[EnglishOccupation]
  -- ,[SpanishOccupation]
  --,[FrenchOccupation]
  -- ,[HouseOwnerFlag]
  -- ,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  -- ,[Phone]
  ,  [DateFirstPurchase] 
  -- ,[CommuteDistance]
  , g.City AS [Customer City] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c 
  LEFT JOIN [dbo].[DimGeography] AS g on c.GeographyKey = g.GeographyKey --left join customer table and geography by geograpghy key var --
ORDER BY 
  CustomerKey ASC --ordered list by Customerskey 
  
DIM_Calender:


SELECT [DateKey]
      ,[FullDateAlternateKey] as Date
      --,[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek] as Day
      --,[SpanishDayNameOfWeek]
      --,[FrenchDayNameOfWeek]
      --,[DayNumberOfMonth]
      --,[DayNumberOfYear]
      ,[WeekNumberOfYear] as weekNr
      ,[EnglishMonthName] as Month,
	  LEFT([EnglishMonthName],3) as MonthShort,
     -- ,[SpanishMonthName]	
      --,[FrenchMonthName],
	  [MonthNumberOfYear] as MonthNo,
      [CalendarQuarter] as Quarter,
     [CalendarYear] as Year
      --,[CalendarSemester]
      --,[FiscalQuarter]
      --,[FiscalYear]
      --,[FiscalSemester]
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  where [CalendarYear] >=2019
  
  
Dim_Product:

SELECT
    [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      --,[PromotionKey]
      --,[CurrencyKey]
      --,[SalesTerritoryKey]
      ,[SalesOrderNumber]
     -- ,[SalesOrderLineNumber]
     -- ,[RevisionNumber]
     -- ,[OrderQuantity]
      --,[UnitPrice]
      --,[ExtendedAmount]
      --,[UnitPriceDiscountPct]
     -- ,[DiscountAmount]
     -- ,[ProductStandardCost]
     -- ,[TotalProductCost]
      ,[SalesAmount]
      --,[TaxAmt]
      --,[Freight]
      --,[CarrierTrackingNumber]
      --,[CustomerPONumber]
      --,[OrderDate]
      --,[DueDate]
      --,[ShipDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  WHERE LEFT(OrderDateKey,4)>=YEAR(GETDATE())-2
  ORDER BY OrderDateKey ASC
  
  
DIM_InternetSale:

SELECT
    [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      --,[PromotionKey]
      --,[CurrencyKey]
      --,[SalesTerritoryKey]
      ,[SalesOrderNumber]
     -- ,[SalesOrderLineNumber]
     -- ,[RevisionNumber]
     -- ,[OrderQuantity]
      --,[UnitPrice]
      --,[ExtendedAmount]
      --,[UnitPriceDiscountPct]
     -- ,[DiscountAmount]
     -- ,[ProductStandardCost]
     -- ,[TotalProductCost]
      ,[SalesAmount]
      --,[TaxAmt]
      --,[Freight]
      --,[CarrierTrackingNumber]
      --,[CustomerPONumber]
      --,[OrderDate]
      --,[DueDate]
      --,[ShipDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  WHERE LEFT(OrderDateKey,4)>=YEAR(GETDATE())-2
  ORDER BY OrderDateKey ASC`
```

### Data Model
![image](https://github.com/dmengest/SalesMangament_PortfolioProject_Power_BI_SQL/assets/132204210/1b3a81fe-2d1a-4c24-8dc4-6f6b1fdb6e80)




