import BienYServicio from '../models/modelByS';
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
            BienYServicio.insertJSONData(jsonData);
            res.send('Datos cargados correctamente');
        } catch (error) {
            res.send('Error al cargar los datos');
        }
    });
};

// post
export const createByS = async (req, res) => {
    try{
        let data = req.body;
        await BienYServicio.create(data);
        res.send("data inserted");
    }catch(error){
        console.log(error);
    }
};

// get
export const getByS = async (req, res) => {
    try{
        let datos = await BienYServicio.find();
        res.send(datos);
    }catch(error){
        console.log(error);
    }
};

// put
export const updateByS = async (req, res) => {
    try{
        let data = req.body;
        let id = req.params.codigoByS;
        await BienYServicio.findByIdAndUpdate(id, { $set: data }, { new: true });
        let obs = await BienYServicio.find({ codigoByS: id });
        res.status(200).json(obs);
    }catch(error){
        console.log(error);
    }
};

// delete
export const deleteByS = async (req, res) => {
    try{
        let id = req.params.codigoByS;
        await BienYServicio.findByIdAndDelete(id);
        res.send("data deleted");
    }catch(error){
        console.log
    }
};