import Cliente from '../models/modelCliente';
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
            Cliente.insertJSONData(jsonData);
            res.send('Datos cargados correctamente');
        } catch (error) {
            res.send('Error al cargar los datos');
        }
    });
};

// post
export const createCliente = async (req, res) => {
    try{
        let data = req.body;
        // verificar si el cliente ya existe
        let cliente = await Cliente.find({ idCliente: data.idCliente });
        if (cliente){
            res.send("Cliente ya existe");
        } else {
            await Cliente.create(data);
            res.send("data inserted");
        }
    }catch(error){
        console.log(error);
    }
};

// get
export const getClientes = async (req, res) => {
    try{
        let datos = await Cliente.find();
        res.send(datos);
    }catch(error){
        console.log(error);
    }
};

// get cliente por palabra clave en la ubicacion 
export const getClienteByKeyword = async (req, res) => {
    try{
        let keyword = req.params.keyword;
        let datos = await Cliente.find({ ubicacionCliente: { $regex: keyword } });
        res.send(datos);
    }catch(error){
        console.log(error);
    }
};

// put
export const updateCliente = async (req, res) => {
    try{
        let data = req.body;
        let id = req.params.idRUP;
        await Cliente.findByIdAndUpdate(id, { $set: data }, { new: true });
        let obs = await Cliente.find({ idRUP: id });
        res.status(200).json(obs);
    }catch(error){
        console.log(error);
    }
};

// delete
export const deleteCliente = async (req, res) => {
    try{
        let id = req.params.idRUP;
        await Cliente.findByIdAndDelete(id);
        res.send("data deleted");
    }catch(error){
        console.log(error);
    }
};

