import mongoose, { Schema } from "mongoose";

const anexoSchema = new Schema({
    "idAnexo":Integer,
    "documentoContrato":Boolean,
    "documentoConsorcio":Boolean,
    "actaFinal":Boolean,
    "actaInicio":Boolean,
    "certificacion":Boolean
});

const Anexo = mongoose.model("Anexo", anexoSchema);
export default Anexo;

export const insertJSONData = async (jsonData) => {
    try{
        if (Array.isArray(jsonData)) {
            await Anexo.insertMany(jsonData);
        } else {
            const anexo = new Anexo(jsonData);
            await anexo.save();
        }
        console.log('Datos cargados correctamente');
    } catch (error) {
        console.error('Error al cargar los datos');
        throw error;
    }
};
