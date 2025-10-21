import express from 'express';
import Wardrobeitem from '../models/clothingSchema.js';

const router = express.Router();

// GET all items
router.get('/', async (req, res) => {
    try {
        const { userId, category } = req.query;
        let query = {};
        if (userId) query.userId = userId;
        if (category) query.category = category;
        
        const items = await Wardrobeitem.find(query).sort({ createdAt: -1 });
        res.json({ success: true, data: items });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// POST new item (with image support)
router.post('/', async (req, res) => {
    try {
        const newItem = await Wardrobeitem.create(req.body);
        res.status(201).json({ success: true, data: newItem });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// DELETE item
router.delete('/:id', async (req, res) => {
    try {
        await Wardrobeitem.findByIdAndDelete(req.params.id);
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

export default router;
