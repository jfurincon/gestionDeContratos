import e from "express";
import Usuario from "../models/modelUsuario.js";

// post
export const createUsuario = async (req, res) => {
    try{
        let data = req.body;
        // verify if the user already exists
        let user = await Usuario.findOne({ nombreUsuario: data.nombreUsuario });
        if(user){
            res.send("Usuario ya existe");
            return;
        } else{
            await Usuario.create(data);
            res.send("data inserted");
        }
    }catch(error){
        console.log(error);
    }
};

// get
export const getUsuarios = async (req, res) => {
    try{
        let datos = await Usuario.find();
        res.send(datos);
    }catch(error){
        console.log(error);
    }
};

// put
export const updateUsuario = async (req, res) => {
    try{
        let data = req.body;
        let id = req.params.idUsuario;
        await Usuario.findByIdAndUpdate(id, { $set: data }, { new: true });
        let obs = await Contrato.find({ idUsuario: id });
        res.status(200).json(obs);
    }catch(error){
        console.log(error);
    }
};

// delete
export const deleteUsuario = async (req, res) => {
    try{
        let id = req.params.idUsuario;
        await Usuario.findByIdAndDelete(id);
        res.send("data deleted");
    }catch(error){
        console.log(error);
    }
};