import Wardrobeitem from "../models/clothingSchema.js";

export const getAllItems = async (req, res) => {
  try {
    console.log("Root route is hit");
    const items = await Wardrobeitem.find();
    res.json(items);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
