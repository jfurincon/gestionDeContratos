import express from 'express';
const router = express.Router();
import { getClientes, createCliente, updateCliente, deleteCliente } from '../controllers/clienteController.js';

router.get('/clientes', getClientes);
router.post('/clientes', createCliente);
router.put('/clientes/:idRUP', updateCliente);
router.delete('/clientes/:idRUP', deleteCliente);

export default router;