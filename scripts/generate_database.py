# n = 1000 

from faker import Faker
import pandas as pd
import numpy as np
import duckdb
import sqlite3
import os


# Initialize Faker generator
fake = Faker()

# Generate data for customers
np.random.seed(0)
customer_ids = range(1, 1001)
customer_names = [fake.name() for _ in customer_ids]
customer_ages = np.random.randint(25, 70, size=1000)
customer_genders = np.random.choice(['Male', 'Female'], size=1000)
customer_regions = np.random.choice(['North', 'South', 'East', 'West'], size=1000)

# Create DataFrame for customers
df_customers = pd.DataFrame({
    'customer_id': customer_ids,
    'customer_name': customer_names,
    'age': customer_ages,
    'gender': customer_genders,
    'region': customer_regions
})

# Display the DataFrame
print("Customers Table:")
print(df_customers.head())
len(df_customers)

# Function to generate fake data
def generate_fake_data(num_rows):
    data = []
    for _ in range(num_rows):
        data.append({
            'id': fake.uuid4(),
            'name': fake.name(),
            'email': fake.email(),
            'address': fake.address(),
            'date_of_birth': fake.date_of_birth(),
            'created_at': fake.date_time_this_year()
        })
    return pd.DataFrame(data)

# Generate data for energy consumption
timestamps = pd.date_range(start='2020-01-01', periods=1000, freq='D')
customer_ids = np.random.choice(range(1, 1001), size=1000)
energy_usage = np.random.uniform(10, 1000, size=1000)  # Simulate energy usage in kWh

# Create DataFrame for energy consumption
df_energy_consumption = pd.DataFrame({
    'consumed_at': timestamps,
    'customer_id': customer_ids,
    'energy_usage_kWh': energy_usage
})

# Display the DataFrame
print("\nEnergy Consumption Table:")
print(df_energy_consumption.head())

# Generate data for customer feedback
feedback_dates = pd.date_range(start='2020-01-01', periods=1000, freq='W')
customer_ids = np.random.choice(range(1, 1001), size=1000)
ratings = np.random.randint(1, 6, size=1000)
comments = [fake.text(max_nb_chars=50) for _ in range(1000)]

# Create DataFrame for customer feedback
df_customer_feedback = pd.DataFrame({
    'feedback_date': feedback_dates,
    'customer_id': customer_ids,
    'rating': ratings,
    'comments': comments
})

# Display the DataFrame
print("\nCustomer Feedback Table:")
print(df_customer_feedback.head())

#### DUCKDB

# Get the current working directory
current_dir = os.getcwd()

# Adjust the path for the DuckDB file one level above the current directory
db_path = os.path.join(os.path.dirname(current_dir), 'aether_energy_analytics.duckdb')

# Connect to DuckDB and create an empty database file
conn = duckdb.connect(db_path)

# Create a cursor object using the connection
cursor = conn.cursor()


# Insert data into customers table
df_customers.to_sql('customers', conn, if_exists='replace', index=False)

# Insert data into energy_consumption table
df_energy_consumption.to_sql('energy_consumption', conn, if_exists='replace', index=False)

# Insert data into customer_feedback table
df_customer_feedback.to_sql('customer_feedback', conn, if_exists='replace', index=False)


# Commit changes to the database
conn.commit()

# Close the cursor and connection
cursor.close()
conn.close()
