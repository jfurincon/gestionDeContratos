import express from 'express';
const router = express.Router();
import { getByS, createByS, updateByS, deleteByS, getBySByKeyword } from '../controllers/BySController.js';
import e from 'express';

router.get('/ByS', getByS);
router.post('/ByS', createByS);
router.put('/ByS/:codigoByS', updateByS);
router.delete('/ByS/:codigoByS', deleteByS);
router.get('/ByS/busqueda/:keyword', getBySByKeyword);

export default router;