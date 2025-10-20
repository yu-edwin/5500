import mongoose from "mongoose";
import User from "../models/userSchema.js";
import Wardrobeitem from "../models/clothingSchema.js";

const seedData = async () => {
  try {
    let user = await User.findOne({ email: "coco@gmail.com" });

    if (!user) {
      user = await User.create({
        name: "Coco",
        email: "coco@gmail.com",
        password: "password",
      });
      console.log(`Created new test user: ${user.name}`);
      
      const clothingItem1 = await Wardrobeitem.create({
          userId: user._id,
          category: "Shirt",
          price: 5.99,
          color: "Blue",
          material: "Cotton",
          brand: "Zara",
          image_url: "placeholder.png",
          arObject: "placeholder",
          item_url: "madeuplink.com",
        });
        
        console.log(`Created clothing item 1 for ${user.name}`);
        
        const clothingItem2 = await Wardrobeitem.create({
            userId: user._id,
            category: "Pants",
            price: 10.99,
            color: "Black",
            material: "Fiber",
            brand: "American Eagle",
            image_url: "placeholder.png",
            arObject: "placeholder",
            item_url: "madeuplink.com",
        });
        
        console.log(`Created clothing item 2 for ${user.name}`);
        console.log("Seeding complete!");
    } else {
      console.log(`Using existing user: ${user.name}`);
    }
  } catch (err) {
    console.error("Failed to compile:", err);
  }
};

export default seedData;
