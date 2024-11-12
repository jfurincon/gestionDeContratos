import { run } from 'node:test';
import User from '../model/user.js';

//  post
export const createUser = async (req, res) => {
    try{
        let data = req.body;
        await User.create(data);
        let usuarios = await User.find();
        res.status(200).json(usuarios); 
    }catch(error){
        console.log(error);
    }
};

// get
export const getUsers = async (req, res) => {
    try{
        let usuarios = await User.find();
        res.status(200).json(usuarios);
    }catch(error){
        console.log(error);
    }
};

// get users with 30 years old or older
export const getUsers30 = async (req, res) => {
    try{
        let usuarios = await User.find({age: {$gte: 30}});
        res.status(200).json(usuarios);
    }catch(error){
        console.log(error);
    }
};

// get by name
export const getUsersN = async (req, res) => {
    try{
        let nameG = req.params.name;
        let usuarios = await User.find({name: nameG});
        res.status(200).json(usuarios);
    }catch(error){
        console.log(error);
    }
};

// put
export const updateUser = async (req, res) => {
    try{
        let id = req.params.id;
        let data = req.body;
        await User.findByIdAndUpdate(id,
            {$set: data},{new:true});
        let usuarios = await User.find();
        res.status(200).json(usuarios);
    }catch(error){
        console.log(error);
    }
};

// put, add true/false field to users 30 years old or older
export const updateUser30 = async (req, res) => {
    try{
        await User.updateMany({age: {$gte: 30}}, {$set: {isOld: true}});
        res.status(200).json(usuarios);
    }catch(error){
        console.log(error);
    }
};

// delete by name
export const deleteUser = async (req, res) => {
    try{
        let nameC = req.params.name;
        await User.deleteOne({name :nameC});
        let usuarios = await User.find();
        res.status(200).json(usuarios);
    }catch(error){
        console.log(error);
    }
};

// delete, delete users with less than 30 years old
export const deleteUser30 = async (req, res) => {
    try{
        let usuarios = await User.deleteMany({age: {$lt: 30}});
        res.status(200).json(usuarios);
    }catch(error){
        console.log(error);
    }
};
