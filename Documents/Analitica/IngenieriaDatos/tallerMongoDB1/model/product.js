import mongoose, {Schema} from "mongoose";
import { stringify } from "querystring";

const productSchema = new Schema({
    name:String,
    price:Number,
    category:String,
    stock:Boolean
});

export const Product = mongoose.model("Product", productSchema);