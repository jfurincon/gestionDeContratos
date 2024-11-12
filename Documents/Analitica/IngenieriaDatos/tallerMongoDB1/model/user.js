import mongoose, {Schema} from "mongoose";

const userSchema = new Schema({
    name:String,
    age:Number,
    mail:String
});

const User = mongoose.model("User", userSchema);
export default User;