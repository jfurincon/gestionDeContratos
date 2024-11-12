import express from "express";
import {createProduct, getProduct, getProductDesc, getProduct100, updateProduct, deleteProduct, updateProductStockf,
    updateProductStock, deleteProduct50, avgPrice, maxAvgPrice} from "../controller/productController.js";
const router = express.Router();

router.post('/products', createProduct);
router.get('/products', getProduct);
router.get('/products100', getProduct100); // route to get products with price over 100
router.get('/productsDesc', getProductDesc); // route to get products ordered by price desc
router.put('/products/id/:id', updateProduct); // update product by id
router.put('/productsStockf', updateProductStockf); // route to add false to stock field over 8000 in price
router.put('/productsStock', updateProductStock); // route to add true to stock field
router.delete('/products/id/:id', deleteProduct); // delete product by id
router.delete('/products50', deleteProduct50); // route to delete products with price less than 10000

router.get('/products/average', avgPrice); // route to get average price grouped by category
router.get('/products/maxaverage', maxAvgPrice); // route to get max average price between categories

export default router;