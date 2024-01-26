# project_3
Project 3 Repo for Jack, Krishnendu, and Paul

Data Engineering Track
For this track, your group will follow data engineering processes. Here are the specific requirements:

Data must be stored in a SQL or NoSQL database (PostgreSQL, MongoDB, SQLite, etc) and the database must include at least two tables (SQL) or collections (NoSQL).
The database must contain at least 100 records.
Your project must use ETL workflows to ingest data into the database (i.e. the data should not be exactly the same as the original source; it should have been transformed in some way).

Your project must include a method for reading data from the database and displaying it for future use, such as:
Pandas DataFrame
Flask API with JSON output

Your project must use one additional library not covered in class related to data engineering. Consider libraries for data streaming, cloud, data pipelines, or data validation.
Your GitHub repo must include a README.md with an outline of the project including:

An overview of the project and its purpose
Instructions on how to use and interact with the project
Documentation of the database used and why (e.g. benefits of SQL or NoSQL for this project)
ETL workflow with diagrams or ERD
At least one paragraph summarizing efforts for ethical considerations made in the project
References for the data source(s)
References for any code used that is not your own

OPTIONAL: add user-driven interaction, either before or after the ETL process. e.g.:
BEFORE: provide a menu of options for the user to narrow the range of data being extracted from a data source (e.g. API or CSV file, where fields are known in advance).
AFTER: Once the data is stored in the database, add user capability to extract filtered data from the database prior to loading it in a Pandas DataFrame or a JSON output from a Flask API.
