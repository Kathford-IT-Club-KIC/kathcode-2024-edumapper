# app.py
import streamlit as st
from pymongo import MongoClient

# MongoDB Connection
@st.cache(allow_output_mutation=True)
def get_database():
    client = MongoClient('mongodb+srv://mukeshpr443:mukesh@cluster0.4ycn4qv.mongodb.net/?appName=Cluster0')
    db = client.stre  # Replace with your database name
    return db

# Function to fetch and display data
def show_data():
    db = get_database()
    users = db.use.find({}, {'_id': 0})  # Exclude _id field from results
    st.header('User Data')
    for user in users:
        st.write(f"Name: {user['name']}, Area: {user['area']}, Qualification: {user['qualification']}")
    st.write('---')

# Main function
def main():
    st.title('Display MongoDB Data in Streamlit')
    show_data()

if __name__ == '__main__':
    main()
