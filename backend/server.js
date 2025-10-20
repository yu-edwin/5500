import mongoose from "mongoose";
import express from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

const mongoDb_URI = process.env.MONGODB_URI;

mongoose.connect(mongoDb_URI)
    .then(() => console.log("You are able to connect to MongoDB Atlas"))
    .catch(() => console.error("You are unable to connect to Mongo. Check MONGODB_URI"));

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log(`Able to run on Port: ${PORT}`));