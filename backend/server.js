import mongoose from "mongoose";
import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import connectToDB from "./config/mongoDBConnection.js";
import seedData from "./config/seedData.js";

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

connectToDB();

seedData();

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log(`Able to run on Port: ${PORT}`));