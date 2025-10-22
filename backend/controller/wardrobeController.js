import Wardrobeitem from "../models/clothingSchema.js";
import mongoose from "mongoose";

// GET request: Get all items in wardrobe
export const getAllItems = async (req, res) => {
    console.log('GET /api/wardrobe called');
    try {
        const { userId, category } = req.query;
        console.log('Query params:', { userId, category });
        
        let query = {};
        if (userId) query.userId = userId;
        if (category) query.category = category;
        
        const items = await Wardrobeitem.find(query).sort({ createdAt: -1 });
        console.log('Found items:', items.length);
        console.log('Items:', items);
        
        res.json({ data: items });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ success: false, error: error.message });
    }
};

// POST request: Insert new clothing item in wardrobe
export const createClothingItem = async (req,res) => {
    console.log('POST /api/wardrobe called with:', req.body);
    try {
        if (req.body.userId && !mongoose.Types.ObjectId.isValid(req.body.userId)) {
            req.body.userId = new mongoose.Types.ObjectId();
        }
        
        const newItem = await Wardrobeitem.create(req.body);
        console.log('Created item:', newItem._id);
        res.status(201).json({ success: true, data: newItem });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ success: false, error: error.message });
    }
};

// DELETE request: Deletes an item in wardrobe based on ID
export const deleteClothingItem = async (req,res) => {
    try {
        await Wardrobeitem.findByIdAndDelete(req.params.id);
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

export const updateClothingItem = async (req,res) => {
    try {
        const { id } = req.params;
        const updates = req.body;
        if (!mongoose.Types.ObjectId.isValid(id)) {
            return res.status(400).json({ message: "You have provided an invalid clothing ID (Not real or not mongoose object ID. Try again"});
        }

        const updatedItem = await Wardrobeitem.findByIdAndUpdate(
            id,
            { $set: updates },
            { new: true }
        )

        res.status(200).json({ 
            message: `You have updated clothing item id: ${id}`,
            data: updatedItem
        });
    } catch (err) {
        res.status(500).json({ message: `Failed to update clothing item... HERE IS ERROR: ${err}`})
    }
}
