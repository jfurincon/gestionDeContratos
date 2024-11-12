import { connectDatabase } from "./config/database.js";
import express from "express";
import dotenv from "dotenv";
import userRoutes from "./routes/userRoutes.js";
import productRoutes from "./routes/productRoutes.js";

dotenv.config();
const app = express();
const PORT = process.env.PORT || 3000;

connectDatabase();

// rute for testing
app.get('/', (req, res) => {
    res.send('Hello World');
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

app.use(express.json());

//app.use(userRoutes);
app.use(productRoutes);