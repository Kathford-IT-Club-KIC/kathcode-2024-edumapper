import express from "express"
import cors from "cors"
import { connectDB } from "./config/db.js"
import userRouter from "./Routes/userRouter.js"
import Searchrouter from "./Routes/SearchRoutes.js";

import postRouter from "./Routes/postRoute.js"

const app = express();
const port = 4000

app.use(express.json())
app.use(cors())

//connect DB
connectDB();

//api endpoints
app.use("/api/user",userRouter)

app.get("/", (req, res) => {
    res.send("API Working")
    
})

// Routes
// const searchController = require('./controllers/searchController');

// app.get('/search', searchController.searchProducts);

app.listen(port, () => {
    console.log(`Server started on http://localhost:${port}`)
})
