import express from 'express';
import mongoose from 'mongoose';
import Wardrobeitem from '../models/clothingSchema.js';

const router = express.Router();

router.get('/', async (req, res) => {
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
        
        res.json({ success: true, data: items });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ success: false, error: error.message });
    }
});

router.post('/', async (req, res) => {
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
});

router.delete('/:id', async (req, res) => {
    try {
        await Wardrobeitem.findByIdAndDelete(req.params.id);
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

export default router;
