import mongoose from 'mongoose';

const postSchema = new mongoose.Schema({
    description: {
        type: String,
        required: [true, 'Please Provide Description'] // Assuming description is required
    },
    image: {
        type: String, // Storing image URLs
    },
    name: {
        type: String,
        required: true, // Assuming name is required
    }
}, { timestamps: true }); // Automatically manage createdAt and updatedAt timestamps

export default mongoose.model('Post', postSchema);
