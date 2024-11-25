import Contrato from '../models/modelContrato.js';
import FileSystem from 'fs';

// procesar la carga de archivos JSON
export const uploadJSON = (req, res) => {
    const file = req.file;
    FileSystem.readFile(file.path, 'utf8', (err, data) => {
        if (err) {
            console.error(err);
        }
        try{
            const jsonData = JSON.parse(data);
            Contrato.insertJSONData(jsonData);
            res.send('Datos cargados correctamente');
        } catch (error) {
            res.send('Error al cargar los datos');
        }
    });
};

// post
export const createContrato = async (req, res) => {
    try{
        let data = req.body;
        await Contrato.create(data);
        res.send("data inserted");
    }catch(error){
        console.log(error);
    }
};

// get
export const getContratos = async (req, res) => {
    try{
        let datos = await Contrato.find();
        res.send(datos);
    }catch(error){
        console.log(error);
    }
};

// put
export const updateContrato = async (req, res) => {
    try{
        let data = req.body;
        let id = req.params.idRUP;
        await Contrato.findByIdAndUpdate(id, { $set: data }, { new: true });
        let obs = await Contrato.find({ idRUP: id });
        res.status(200).json(obs);
    }catch(error){
        console.log(error);
    }
};

// delete
export const deleteContrato = async (req, res) => {
    try{
        let id = req.params.idRUP;
        await Contrato.findByIdAndDelete(id);
        res.send("data deleted");
    }catch(error){
        console.log(error);
    }
};