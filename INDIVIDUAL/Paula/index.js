//conexion a BD
const express = require('express');
const mongoose = require('mongoose');

const app = express();
const PORT = 3000;

//Crear el cuerpo de las peticiones (Middleware)
app.use (express.json());

//conexion BD
mongoose.connect('mongodb://localhost:27017/BDMongo',{
    useNewURLParser: true,
    useUnifiedTopology: true
}).then(()=>console.log('Se conecto a MongoDB'))
.catch(err=>console.error('no se conecto a BD error: ',err))

//Iniciar servidor
app.listen(PORT,()=>{
    console.log('Servidor ejecutandose sobre el puerto: ${PORT}');
});