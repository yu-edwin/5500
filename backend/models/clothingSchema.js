import mongoose from "mongoose";

const { Schema } = mongoose;

const clothingItem = new Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true,
    },
    category: {
        type: String,
        trim: true,
    },
    price: {
        type: Number,
        default: 0,
    },
    color: {
        type: String,
        lowercase: true,
        trim: true
    },
    material: String,
    brand: String,
    image_url: String,
    arObject: String,
    item_url: String,
    createdAt: {
        type: Date,
        default: () => Date.now(),
    }
});

export default mongoose.model("Wardrobeitem", clothingItem);