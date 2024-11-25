import express from 'express';

const router = express.Router();
import { getAnexos, createAnexo, updateAnexo, deleteAnexo } from '../controllers/anexoController.js';

router.get('/anexos', getAnexos);
router.post('/anexos', createAnexo);
router.put('/anexos/:idRUP', updateAnexo);
router.delete('/anexos/:idRUP', deleteAnexo);

export default router;
