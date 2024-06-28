import pymongo

# Connect to MongoDB Atlas
client = pymongo.MongoClient('mongodb+srv://mukeshpr443:mukesh@cluster0.4ycn4qv.mongodb.net/?appName=Cluster0')
db = client.StreamlitDB
collection = db.userinfo