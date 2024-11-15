import { Schema } from "mongoose";

const BySSchema = new Schema({
    "codigoByS":String,
    "descripcionActividad":String
});

export const BienYServicio = mongoose.model("BienYServicio", BySSchema);