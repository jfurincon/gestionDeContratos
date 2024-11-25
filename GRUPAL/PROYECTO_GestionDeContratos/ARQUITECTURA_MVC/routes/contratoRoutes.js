import express from 'express';
const router = express.Router();
import { getContratos, createContrato, updateContrato, deleteContrato, getContratosActivos, getContratosValor, getContratoReciente} from '../controllers/contratoController.js';

router.get('/contratos', getContratos);
router.post('/contratos', createContrato);
router.put('/contratos/:idRUP', updateContrato);
router.delete('/contratos/:idRUP', deleteContrato);
router.get('/contratos/activos', getContratosActivos);
router.get('/contratos/valor', getContratosValor);
router.get('/contratos/reciente', getContratoReciente);

export default router;