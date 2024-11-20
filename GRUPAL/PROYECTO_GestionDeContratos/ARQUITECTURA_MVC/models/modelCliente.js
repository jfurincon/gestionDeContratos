import mongoose, { Schema } from "mongoose";

const clienteSchema = new Schema({
    "idCliente":Integer,
    "nombreEntidad":String,
    "ubicacionCliente":String
});

const Cliente = mongoose.model("Cliente", clienteSchema);
export default Cliente;

export const insertJSONData = async (jsonData) => {
    try{
        if (Array.isArray(jsonData)) {
            await Cliente.insertMany(jsonData);
        } else {
            const anexo = new Cliente(jsonData);
            await anexo.save();
        }
        console.log('Datos cargados correctamente');
    } catch (error) {
        console.error('Error al cargar los datos');
        throw error;
    }
};