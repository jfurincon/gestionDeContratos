import mongoose, { Schema } from "mongoose";

const BySSchema = new Schema({
    "codigoByS":String,
    "descripcionActividad":String
});

const BienYServicio = mongoose.model("BienYServicio", BySSchema);
export default BienYServicio;

export const insertJSONData = async (jsonData) => {
    try{
        if (Array.isArray(jsonData)) {
            await BienYServicio.insertMany(jsonData);
        } else {
            const anexo = new BienYServicio(jsonData);
            await anexo.save();
        }
        console.log('Datos cargados correctamente');
    } catch (error) {
        console.error('Error al cargar los datos');
        throw error;
    }
};