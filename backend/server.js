import dotenv from "dotenv";
dotenv.config();

import mongoose from "mongoose";
import express from "express";
import cors from "cors";
import connectToDB from "./config/mongoDBConnection.js";
import seedData from "./config/seedData.js";
import wardrobeRoutes from "./routes/wardrobeRoutes.js";
import userRoutes from "./routes/userRoutes.js";
import outfitRoutes from "./routes/outfitRoutes.js";

const app = express();
app.use(cors());
app.use(express.json({ limit: '50mb' }));

// Log all requests
app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});

const startServer = async () => {
    await connectToDB();
    await seedData();

    app.use('/api/outfit', outfitRoutes);
    app.use('/api/user', userRoutes);
    app.use('/api/wardrobe', wardrobeRoutes);
    console.log("Routes are supported")

    // Test route
    app.get('/api/test', (req, res) => {
        res.json({ message: 'API is working!' });
    });
}

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

startServer();