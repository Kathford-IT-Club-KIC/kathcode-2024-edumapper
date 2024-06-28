import postModel from "../models/postModel.js";
import fs from "fs"

const addPost = async(req,res) => {
    let image_filename = `${req.file.filename}`;
    
    const post= new postModel({
        name:req.body.name,
        description:req.body.description,
        image:image_filename
    })  
    try {
          const savedPost=await post.save()
        res.json({success:true,message:"Post Added",post:savedPost})
    } catch (error) {
        res.json({success:false,message:error.message})
    }
    

}



const listPost = async(req,res) => {
    try{
        const posts = await postModel.find()
        res.json({success:true,posts})
    }catch(error){
        res.json({success:false,message:error.message})
    }
    
}

const removePost = async(req,res) => {
    try {
        const post = await postModel.findByIdAndDelete(req.body.id)
        fs.unlinkSync(`uploads/${post.image}`,()=> { })
        await postModel.findByIdAndDelete(req.body.id)

        res.json({success:true,message:"Post Deleted"})
    } catch (error) {
        res.json({success:false,message:error.message})
    }
}


export {addPost,listPost,removePost}