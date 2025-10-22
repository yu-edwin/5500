import express from 'express';
import {
    getAllItems,
    createClothingItem,
    deleteClothingItem
} from "../controller/wardrobeController.js";

const router = express.Router();

router.get("/", getAllItems);
router.post("/", createClothingItem);
router.delete("/:id", deleteClothingItem);

export default router;
