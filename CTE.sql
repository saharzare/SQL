--How to delete duplicated data with CTE!
WITH mycte AS(
SELECT ROW_NUMBER() OVER (PARTITION BY TITLE, TYPE, PRICE ORDER BY [title_id]) AS ROWNUM FROM titles
)
DELETE mycte WHERE ROWNUM >1;
