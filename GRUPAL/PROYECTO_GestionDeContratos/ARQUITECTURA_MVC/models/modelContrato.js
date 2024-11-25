import mongoose, { Schema } from "mongoose";

const contratoSchema = new Schema({
    "idRUP":Integer,
    "codigoContrato":String,
    "descripcionContrato":String,
    "fechaInicio":Date,
    "fechaFin":Date,
    "valorSMMLV":Integer,
    "valorContrato":Integer
});

const Contrato = mongoose.model("Contrato", contratoSchema);
export default Contrato;

export const insertJSONData = async (jsonData) => {
    try{
        if (Array.isArray(jsonData)) {
            await Contrato.insertMany(jsonData);
        } else {
            const anexo = new Contrato(jsonData);
            await anexo.save();
        }
        console.log('Datos cargados correctamente');
    } catch (error) {
        console.error('Error al cargar los datos');
        throw error;
    }
};