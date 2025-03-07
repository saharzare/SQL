USE PUBS
  GO
--How to delete duplicated data with CTE!
WITH mycte AS(
SELECT ROW_NUMBER() OVER (PARTITION BY TITLE, TYPE, PRICE ORDER BY [title_id]) AS ROWNUM FROM titles
)
DELETE mycte WHERE ROWNUM >1;
---------------------------------------------------------------------------
--Price Deviation Analysis by Book Type Using Window Functions
WITH CTE2 AS(
  SELECT TITLE,TYPE,PRICE, AVG(PRICE) OVER(PARTITION BY TYPE ORDER BY PRICE DESC) AS AVG_PRICE FROM TITLES)
SELECT CTE2.AVG_PRICE-CTE2.PRICE AS DIFF,CTE2.title,CTE2.TYPE FROM CTE2;
