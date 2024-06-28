import streamlit as st
import pymongo

# Connect to MongoDB Atlas
client = pymongo.MongoClient('mongodb+srv://mukeshpr443:mukesh@cluster0.4ycn4qv.mongodb.net/?appName=Cluster0')
db = client.StreamlitDB
collection = db.userinfo

# Streamlit app
st.title('Data Submission to MongoDB Atlas')

# Form to submit data
st.subheader('Submit Data')
name = st.text_input('Enter Name')
age = st.number_input('Enter Age')
    
if st.button('Submit'):
    nameexist = False
    for item in collection.find({},{'_id':0}):
        if name in item['name']:
            st.write('Name already exists in the database')
            nameexist = True
            break    
    
    # Prepare data to insert
    if nameexist == False:
        data = {
            'name': name,
            'age': age
        }
        # Insert data into MongoDB
        collection.insert_one(data)
        st.success('Data submitted successfully!')

# Display existing data from MongoDB (optional)
st.subheader('Existing Data in MongoDB')
for item in collection.find({},{'_id':0}):
    st.write(item['name'])
