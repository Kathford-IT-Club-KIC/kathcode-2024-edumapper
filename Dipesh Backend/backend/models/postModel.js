import mongoose from "mongoose"

const postSchema = new mongoose.Schema({
    name: { type: String },
    description: { type: String,required:true },
    image: { type: String, required: true},
    // {timestamp:true}
    
})

const postModel=mongoose.models.post || mongoose.model("post",postSchema)

export default postModel;



