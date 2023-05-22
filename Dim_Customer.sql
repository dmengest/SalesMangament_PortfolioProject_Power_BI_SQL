-- Cleansed Dim_Customers Table--
SELECT 
  [CustomerKey] --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  , c.[FirstName] AS [First Name], 
  -- ,[MiddleName]
  c.[LastName] AS [Last Name], 
  c.FirstName + '' + c.LastName AS [Full Name] --  ,[NameStyle]
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
