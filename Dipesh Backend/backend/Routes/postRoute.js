import express from 'express';
import { addPost,listPost,removePost } from '../controller/postController.js';


const postRouter = express.Router()

postRouter.post("/add", addPost)
postRouter.get("/list",listPost)
postRouter.delete("/remove",removePost)

export default postRouter;