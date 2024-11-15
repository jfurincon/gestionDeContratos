import { Schema } from "mongoose";

const contratoSchema = new Schema({
    "idRUP":Integer,
    "codigoContrato":String,
    "descripcionContrato":String,
    "fechaInicio":Date,
    "fechaFin":Date,
    "valorSMMLV":Integer,
    "valorContrato":Integer,
    "idCliente":Integer
});

export const Contrato = mongoose.model("Contrato", contratoSchema);