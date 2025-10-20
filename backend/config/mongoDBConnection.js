import mongoose from "mongoose";

const connectToDB = async () => {
    try {
        const connect = await mongoose.connect(process.env.MONGODB_URI);
        console.log("You are able to connect to MongoDB Atlas");
    } catch (error) {
        console.error("UNABLE TO CONNECT TO MONGO!!!!!! CHECK MONGODB_URI ENVIRONMENT VARIABLE");
        process.exit(1);
    }
};

export default connectToDB;