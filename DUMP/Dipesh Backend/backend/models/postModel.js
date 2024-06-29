import mongoose from "mongoose"

const postSchema = new mongoose.Schema({
    name: { type: String, required: true },
    description: { type: String, required: true },
    date: { type: Date, default: Date.now },
    // image: { type: String, required: false },

})

const postModel = mongoose.models.post || mongoose.model("post", postSchema)

export default postModel;



