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