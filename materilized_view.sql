
--Creation of Standarad View(newview)
create view newview as 
SELECT DimProduct.Productkey,DimProduct.EnglishProductName, DimProduct.StandardCost, DimProduct.Color, DimProduct.ListPrice, DimProduct.Size, DimProduct.ProductLine, DimProductCategory.EnglishProductCategoryName, 
                  DimProductSubcategory.EnglishProductSubcategoryName
FROM     DimProduct INNER JOIN
                  DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey INNER JOIN
                  DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

----------------------------------
--Creation of Materialized View(materialized_view)
create view materialized_view with schemabinding as 
SELECT  DimProduct.Productkey,DimProduct.EnglishProductName, DimProduct.StandardCost, DimProduct.Color, DimProduct.ListPrice, DimProduct.Size, DimProduct.ProductLine, DimProductCategory.EnglishProductCategoryName, 
                  DimProductSubcategory.EnglishProductSubcategoryName
FROM     dbo.DimProduct INNER JOIN
                  dbo.DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey INNER JOIN
                  dbo.DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

CREATE UNIQUE CLUSTERED INDEX idx_materialized_view ON materialized_view (Productkey);


SET STATISTICS IO, TIME ON; -- Enables performance tracking
SELECT * FROM newview;
SELECT * FROM materialized_view WITH (NOEXPAND); -- Forces indexed view usage
SET STATISTICS IO, TIME OFF; -- Disables tracking
-----------------------

SET SHOWPLAN_ALL ON;
GO
SELECT * FROM newview;
SELECT * FROM materialized_view WITH (NOEXPAND);
GO
SET SHOWPLAN_ALL OFF;
GO


