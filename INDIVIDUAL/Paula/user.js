//Modelo para definir la manipualcion del modulo de usuario

const moongose = require ('moongose');

const userSchema = new moongose.Schema({
    nombre: {
        type:String,
        require:true
    },
    edad: {
        type:Number,
        require:true
    }
});

modelo.exports = moongose.model('user', userSchema);