import Anexo from '../models/anexoModel.js';
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
            modelAnexo.insertJSONData(jsonData);
            res.send('Datos cargados correctamente');
        } catch (error) {
            res.send('Error al cargar los datos');
        }
    });
};

// post
export const createAnexo = async (req, res) => {
    try{
        let data = req.body;
        await Anexo.create(data);
        res.send("data inserted");
    }catch(error){
        console.log(error);
    }
};

// get
export const getAnexos = async (req, res) => {
    try{
        let datos = await Anexo.find();
        res.send(datos);
    }catch(error){
        console.log(error);
    }
};

// put
export const updateAnexo = async (req, res) => {
    try{
        let data = req.body;
        let id = req.params.idRUP;
        await Anexo.findByIdAndUpdate(id, { $set: data }, { new: true });
        let obs = await Anexo.find({ idRUP: id });
        res.status(200).json(obs);
    }catch(error){
        console.log(error);
    }
};

// delete
export const deleteAnexo = async (req, res) => {
    try{
        let id = req.params.idRUP;
        await Anexo.findByIdAndDelete(id);
        res.send("data deleted");
    }catch(error){
        console.log(error);
    }
};