import express from 'express';
const router = express.Router();
import { getUsuarios, createUsuario, updateUsuario, deleteUsuario } from '../controllers/usuarioController.js';

router.get('/usuarios', getUsuarios);
router.post('/usuarios', createUsuario);
router.put('/usuarios/:idUsuario', updateUsuario);
router.delete('/usuarios/:idUsuario', deleteUsuario);

export default router;
