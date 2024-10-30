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

// agregar las rutas para manupular los datos

const user = require('./user.js');

// Registrar un usuario nuevo

app.post('/user', async (req, res) => {
    try{
        const user = new user(req.body);
        await user.save();
        res.status(201).send(user);
    }catch(error){
        res.status(400).send(error);
    }
});

// consultar todos los usuarios

app.get('/user', async (req, res) => {
    try{
        const users = await user.find();
        res.status(201).send(users);
    }catch(error){
        res.status(400).send(error);
    }
});

// consultar un usuario por id

app.get('/user/:id', async (req, res) => {
    try{
        const user = await user.findById(req.params.id);
        if(!user){
            return res.status(404).send();
        }
        res.status(201).send(user);
    }catch(error){
        res.status(400).send(error);
    }
});

// actualizar un usuario por id

app.get('/user/:id', async (req, res) => {
    try{
        const user = await user.findByIdAndUpdate(req.params.id, req.body, {new: true});
        if(!user){
            return res.status(404).send();
        }
        res.status(200).send(user);
    }catch(error){
        res.status(400).send(error);
    }
});

// eliminar un usuario por id

app.delete('/user/:id', async (req, res) => {
    try{
        const user = await user.findByIdAndDelete(req.params.id);
        if(!user){
            return res.status(404).send();
        }
        res.status(200).send(user);
    }catch(error){
        res.status(400).send(error);
    }
});