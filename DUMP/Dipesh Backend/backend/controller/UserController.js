import userModel from "../models/userModel.js";
import jwt from "jsonwebtoken"
import bcrypt from "bcrypt"
import validator from "validator"


//login user

const loginUser = async (req,res) => {
    const { email, password } = req.body;
    try {
        const user = await userModel.findOne({ email });
        
        if (!user) {
            return res.json({success:false,message:"User Not found"})
        }

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.json({success:false,message:"Invalid Crendetials"})
        }

        const token = createToken(user._id);
        res.json({success:true,token})
    } catch (error) {
        console.log(error);
        res.json({success:false,message:"Error"})
    }
    


}

//create token
const createToken = (id) => {
    return jwt.sign({id},process.env.JWT_SECRET)
}


//register user

const registerUser = async (req, res) => {
    const { name, password, email,district,area,qualification } = req.body;
    try {
        //checking if the user already exist
        const exists = await userModel.findOne({ email })
        if (exists) {
            return res.json({ success: false, message: "User Already Exist" })    
        }
        //validating email and password
        if (!validator.isEmail(email)) {
            return res.json({ success: false, message: "Enter the valid Email" })        
        }

        if (password.length<8) {
            return res.json({success:false,message:"Enter a strong password"})
        }

        // hashing user's password

        const salt = await bcrypt.genSalt(10)
        const hashedPassword = await bcrypt.hash(password, salt)

        const newUser = new userModel({
            name: name,
            email: email,
            password: hashedPassword,
            district: district,
            area: area,
            qualification:qualification
        })

        const user = await newUser.save()
        const token = createToken(user._id)
        res.json({ success: true, token })
        
        

    } catch (error) {
        console.log(error);
        res.json({success:false,message:"Error"})

    }
    
}
const updateUser = async (req, res) => {
    const { id } = req.params;
    const { name, password, email, district, area, qualification } = req.body;
    try {
        const user = await userModel.findById(id);

        if (!user) {
            return res.json({ success: false, message: "User Not Found" });
        }

        // validating email if it's being updated
        if (email && !validator.isEmail(email)) {
            return res.json({ success: false, message: "Enter a valid Email" });
        }

        if (password && password.length < 8) {
            return res.json({ success: false, message: "Enter a strong password" });
        }

        // updating user's password if provided
        if (password) {
            const salt = await bcrypt.genSalt(10);
            user.password = await bcrypt.hash(password, salt);
        }

        // updating other fields if provided
        if (name) user.name = name;
        if (email) user.email = email;
        if (district) user.district = district;
        if (area) user.area = area;
        if (qualification) user.qualification = qualification;

        const updatedUser = await user.save();
        res.json({ success: true, user: updatedUser });
    } catch (error) {
        console.log(error);
        res.json({ success: false, message: "Error" });
    }
}

export {loginUser,registerUser,updateUser}