import express from "express"
import { loginUser, registerUser, updateUser } from "../controller/UserController.js"

const userRouter = express.Router()
userRouter.post("/register", registerUser)
userRouter.post("/login", loginUser)
userRouter.post("/update",updateUser)

export default userRouter;

