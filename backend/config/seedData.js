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
          name: "Blue Zara Shirt",
          category: "tops",
          price: 5.99,
          color: "Blue",
          size: "m",
          material: "Cotton",
          brand: "Zara",
          image_url: "placeholder.png",
          item_url: "madeuplink.com",
        });
        
        console.log(`Created clothing item 1 for ${user.name}`);
        
        const clothingItem2 = await Wardrobeitem.create({
            userId: user._id,
            name: "Black AE Pants",
            category: "bottoms",
            price: 10.99,
            color: "Black",
            size: "l",
            material: "Fiber",
            brand: "American Eagle",
            image_url: "placeholder.png",
            item_url: "madeuplink.com",
        });
        
        console.log(`Created clothing item 2 for ${user.name}`);
        console.log("Seeding complete!");
    } else {
      console.log(`Using existing user: ${user.name}`);
    }
  } catch (err) {
    console.error("Failed to seed:", err);
  }
};

export default seedData;
