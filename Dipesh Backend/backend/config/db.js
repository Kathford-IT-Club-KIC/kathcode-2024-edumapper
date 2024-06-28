import mongoose from "mongoose"

 export const connectDB = async () => {
    await mongoose.connect(`mongodb+srv://dipeshdhakal13:98400345@cluster0.dogxhml.mongodb.net/food-del`).then(() => console.log("DB connected"));

}

