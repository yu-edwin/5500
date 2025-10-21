import mongoose from "mongoose";
import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import connectToDB from "./config/mongoDBConnection.js";
import seedData from "./config/seedData.js";
import wardrobeRoutes from "./routes/wardrobeRoutes.js";

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json({ limit: '50mb' }));

connectToDB();
seedData();

app.use('/api/wardrobe', wardrobeRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
