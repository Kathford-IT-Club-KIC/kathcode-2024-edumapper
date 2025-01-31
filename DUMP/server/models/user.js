const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name : {
        type:String,
        required:true,
        trim:true
    },
    email :{
        type : String,
        required : true,
        trim: true,
        validate:{
            validator: (value)=>{
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: 'Enter a valid Email',
        }
    },
    password:{
        required:true,
        type:String,
        validate:{
            validator: (value)=>{
                return value.length > 8;
            },
            message: 'Enter a long password',
        }
    },
    district:{
        type:String
    },
    area:{
        type:String
    },
    qualification:{
        type:String
    },
    photo: {
        type: String,
        default: 'assets/images/profile.jpeg' 
    }
});

const User = mongoose.model("User", userSchema);
module.exports = User;