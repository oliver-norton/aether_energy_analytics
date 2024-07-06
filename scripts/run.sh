#!/bin/bash
set -e

# when script fails, give error 1

dbt build 
python /scripts/upload.py 
# duckdb dfjsdsdf
# here you can run both dbt command and python command

# this is all done for production, this is a pipeline 