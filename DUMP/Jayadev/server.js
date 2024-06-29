import express from "express"
import dotenv from 'dotenv'
import colors from 'colors'
import cors from 'cors'
import morgan from 'morgan'

import connectDB from "./config/db.js"

import authRoutes from "./routes/authRoutes.js"
import testRoutes from "./routes/testRoutes.js"
import errorMiddleware from "./middlewares/errorMiddleware.js"

//dotenv configuration 
dotenv.config()

//rest app 
const app = express()

//mongodb connection 
connectDB()

//validation middleware 
app.use(errorMiddleware)

//running port 
const PORT = process.env.PORT || 8080

//middlewares 
app.use(express.json())
app.use(cors())
app.use(morgan('dev'))

//routes 
// app.get('/',(req,res)=>{
//     res.send('<h1>Welcome to My Job Portal</h1>')
// })

app.use('/api/v1/test', testRoutes)
app.use('/api/v1/auth', authRoutes)

//port listening ?!
app.listen(PORT, () => {
    console.log(`Server Running in ${process.env.DEV_MODE} mode at ${PORT}`.yellow)
})

