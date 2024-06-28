import express from "express"
import cors from "cors"
import { connectDB } from "./config/db.js"
import userRouter from "./Routes/userRouter.js"
import postRouter from "./Routes/postRoute.js"

const app = express();
const port = 4000

app.use(express.json())
app.use(cors())

//connect DB
connectDB();

//api endpoints
app.use("/api/user",userRouter)
app.use("/api/post",postRouter)

app.get("/", (req, res) => {
    res.send("API Working")
    
})



app.listen(port, () => {
    console.log(`Server started on http://localhost:${port}`)
})
