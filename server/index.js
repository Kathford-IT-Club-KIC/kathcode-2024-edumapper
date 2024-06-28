const express = require("express");
const cors = require('cors');
const mongoose = require("mongoose");

const app = express();

const authRouter = require("./routes/auth");

// Your MongoDB connection string
const DB = "mongodb+srv://mukeshpr443:mukesh@cluster0.4ycn4qv.mongodb.net/?appName=Cluster0";

// Middleware
app.use(cors());
app.use(express.json());
app.use(authRouter);

// MongoDB connection
mongoose.connect(DB, {
  useNewUrlParser: true,
  useUnifiedTopology: true
})
.then(() => {
  console.log("Connection Successful!");
})
.catch((e) => {
  console.error('Cannot Connect to MongoDB:', e);
});

const PORT = 3000;
const HOST = 'localhost';

app.listen(PORT, HOST, () => {
  console.log(`Server is running on http://${HOST}:${PORT}`);
});
