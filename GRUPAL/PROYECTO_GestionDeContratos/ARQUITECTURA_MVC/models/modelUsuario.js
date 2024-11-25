import mongoose, {Schema} from "mongoose";

const usuarioSchema = new Schema({
    "idUsuario":Number,
    "nombreUsuario":String,
    "cargoUsuario":String
});

const Usuario = mongoose.model("Usuario", usuarioSchema);
export default Usuario;