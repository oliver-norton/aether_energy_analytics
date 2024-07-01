# dbt_example
- PROJECT GOALS 

- Name: dbt_project_learning
- Deadline: 05/07/2024

Functional requirements:

* [ ] Generate fake data (Python)
* [ ] Create a database (Python)
* [ ] Create a dbt project (By hand)
* [ ] Perform SQL queries on dbt (By hand, SQL)
* [ ] Delete the data and database afterwards
* [X] Accessible on github


Optional features:

* [ ] Create ETL pipelines by connecting to airflow or another tool 
* [ ] Use social media or other data that is non-sensitive but unique
* [ ] Make it unique or special

Learning goals:
- 


Folder structure:
jaffle_shop_duck_db - folder for database + scripts + environment 
github = github stuff
.vscode = vscode stuff 
logs = dbt logs file that is auto generated 
models = part of database, make by hand, contains sql files, models 
staging = testing 
 
scripts = creating data and database and connecting it to dbt 
seeds = storage, csv files - not needed for cloud-based
target = output of your dbt functions, generated by your functions