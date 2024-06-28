import express from 'express';
import { addPost, listPostByDate, removePost } from '../controller/postController.js';


const postRouter = express.Router()

postRouter.post("/add", addPost)
postRouter.get("/list", listPostByDate)
postRouter.post("/remove", removePost)

export default postRouter;