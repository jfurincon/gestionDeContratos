import express from 'express';
const router = express.Router();
import { getContratos, createContrato, updateContrato, deleteContrato } from '../controllers/contratoController.js';

router.get('/contratos', getContratos);
router.post('/contratos', createContrato);
router.put('/contratos/:idRUP', updateContrato);
router.delete('/contratos/:idRUP', deleteContrato);

export default router;