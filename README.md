# SQL
#### SQL-toolkit
##### Comparision of Standard view and materialized view
The SQL script which contains the comparision of two views: a standard view (newview) and a materialized view (materialized_view). The purpose of these views is to provide structured access to product-related information by joining tables containing product details, subcategories, and categories.
This script demonstrates how to create and optimize views for efficient data retrieval. The standard view provides flexibility without storage overhead, while the materialized view enhances performance by precomputing results and indexing them.

##### Transaction (commit & rollback)
Why Use Transactions?

Transactions ensure data integrity and consistency by grouping multiple SQL operations into a single unit of work. If any operation within the transaction fails, the entire set of operations is rolled back, preventing partial or inconsistent data from being stored in the database. This is crucial for maintaining referential integrity, especially when inserting dependent records in multiple related tables.


