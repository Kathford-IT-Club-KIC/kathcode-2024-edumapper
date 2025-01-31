import mongoose, { mongo } from "mongoose"

const userSchema = new mongoose.Schema({
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    district: { type: String, required: true },
    area: { type: String, required: true },
    qualification:{type:String,required:false}
    
    
},{minimize:false})


const userModel = mongoose.models.user || mongoose.model("user", userSchema);

export default userModel;