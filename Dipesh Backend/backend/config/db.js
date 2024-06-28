import mongoose from "mongoose"

 export const connectDB = async () => {
    await mongoose.connect(`mongodb+srv://mukeshpr443:mukesh@cluster0.4ycn4qv.mongodb.net/?appName=Cluster0`).then(() => console.log("DB connected"));

}

//mongodb+srv://mukeshpr443:mukesh@cluster0.dogxhml.mongodb.net/edumapper