import { Schema } from "mongoose";

const clienteSchema = new Schema({
    "idCliente":Integer,
    "nombreEntidad":String,
    "ubicacionCliente":String
});

export const Cliente = mongoose.model("Cliente", clienteSchema);