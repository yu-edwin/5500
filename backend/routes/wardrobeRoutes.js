import express from "express";

import { getAllItems } from "../controller/wardrobeController.js";

const router = express.Router();

router.get("/", getAllItems);

export default router;