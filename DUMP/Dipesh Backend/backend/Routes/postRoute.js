import express from 'express';
import  authMiddleware  from "../middleware/auth.js"
import { addPost, listPost, removePost } from '../controller/postController.js';


const postRouter = express.Router()

postRouter.post("/add", authMiddleware,addPost)
postRouter.get("/list", authMiddleware,listPost)
postRouter.post("/remove",authMiddleware,removePost)

export default postRouter;

