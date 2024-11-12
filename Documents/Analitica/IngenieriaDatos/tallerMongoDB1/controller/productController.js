import { run } from 'node:test';
import {Product} from '../model/product.js';

//  post
export const createProduct = async (req, res) => {
    try{
        let data = req.body;
        await Product.create(data);
        let productos = await Product.find();
        res.status(200).json(productos); 
    }catch(error){
        console.log(error);
    }
};

// get
export const getProduct = async (req, res) => {
    try{
        let productos = await Product.find();
        res.status(200).json(productos);
    }catch(error){
        console.log(error);
    }
};

// get, order by price desc
export const getProductDesc = async (req, res) => {
    try{
        let productos = await Product.find().sort({price: -1});
        res.status(200).json(productos);
    }catch(error){
        console.log(error);
    }
};

// get price over 100
export const getProduct100 = async (req, res) => {
    try{
        let productos = await Product.find({price: {$gte: 100}});
        res.status(200).json(productos);
    }catch(error){
        console.log(error);
    }
};

// put
export const updateProduct = async (req, res) => {
    try{
        let id = req.params.id;
        let data = req.body;
        await Product.findByIdAndUpdate(id,
            {$set: data},{new:true});
        let productos = await Product.find();
        res.status(200).json(productos);
    }catch(error){
        console.log(error);
    }
};

// put, add true/false field to all products 
export const updateProductStock = async (req, res) => {
    try{
        await Product.updateMany(
            {stock:{$exists:false}},
            {$set: {stock: true}}
        );
        let productos = await Product.find();
        console.log(productos);
        res.status(200).json({message: "Stock field added to all products"});
    }catch(error){
        console.log(error);
    }
};

// put false to products with price over 8000
export const updateProductStockf = async (req, res) => {
    try{
        let products = await Product.updateMany({price:{ $gte: 8000}}, {$set: {stock: false}});
        res.status(200).json(products);
    }catch(error){
        console.log(error);
    }
};

// delete
export const deleteProduct = async (req, res) => {
    try{
        let id = req.params.id;
        await Product.findByIdAndDelete(id);
        let productos = await Product.find();
        res.status(200).json(productos);
    }catch(error){
        console.log(error);
    }
};

// delete products with price less than 10000
export const deleteProduct50 = async (req, res) => {
    try{
        let productos = await Product.deleteMany({price: {$lt: 10000}});
        res.status(200).json(productos);
    }catch(error){
        console.log(error);
    }
};

// average price per category
export const avgPrice = async (req, res) => {
    try{
        let productos = await Product.aggregate([{$group: {_id: "$category",
            avgPrice: {$avg: "$price"}}}]);
        res.status(200).json(productos);
    }catch(error){
        console.log(error);
    }
};

// get category with the higher average price
export const maxAvgPrice = async (req, res) => {
    try{
        let productos = await Product.aggregate([{$group: {_id: "$category",
            avgPrice: {$avg: "$price"}}}, {$sort: {avgPrice: -1}}, {$limit: 1}]); // sort desc and just take the first one
        res.status(200).json(productos);
    }catch(error){
        console.log(error);
    }
};