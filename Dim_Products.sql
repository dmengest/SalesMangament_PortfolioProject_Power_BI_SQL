/****** Script for SelectTopNRows command from SSMS  ******/
SELECT p.[ProductKey]
      ,P.[ProductAlternateKey] AS ProductItemCode
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,p.[EnglishProductName] AS [Product Name],
	  ps.EnglishProductSubcategoryName AS [Sub Category],--joined in from subcategory Table
	  pc.EnglishProductCategoryName AS [Product Category]--joined from category Table
      --,[SpanishProductName]
      --,[FrenchProductName]
     -- ,[StandardCost]
     -- ,[FinishedGoodsFlag]
      ,p.[Color] AS [Product Color],
     -- ,[SafetyStockLevel]
     -- ,[ReorderPoint]
     -- ,[ListPrice]
      p.[Size] AS [Product_size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,P.[ProductLine] AS [Product Line],
     -- ,[DealerPrice]
     -- ,[Class]
     -- ,[Style]
      P.[ModelName] AS [Product Model Name]
      --,[LargePhoto]
      ,P.[EnglishDescription] AS [Product Discription]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      ,ISNULL(p.[Status], 'Outdated') AS [Product Status]
  FROM [AdventureWorksDW2019].[dbo].[DimProduct] AS p
  LEFT JOIN [dbo].[DimProductSubcategory] AS ps ON ps.ProductSubcategoryKey=p.ProductSubcategoryKey
  LEFT JOIN [dbo].[DimProductCategory] AS pc ON PS.ProductCategoryKey=pc.ProductCategoryKey
  ORDER BY P.ProductKey ASC