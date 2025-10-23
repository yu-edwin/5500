import User from "../models/userSchema.js";

export const getUserInfo = async (req, res) => {
    try {
        console.log("Trying to fetch user")
        const hardCodedUserId = '68f922e8bddd7ff26ca28350';
        const user = await User.findById(hardCodedUserId);
        if (!user) {
            res.status(404).json({ message: `User not found by ID: ${hardCodedUserId}`});
        }
        console.log("Found user!");
        res.status(200).json({user});
    } catch (err) {
        console.error(`Cannot fetch user based on ID... Here is error: ${err}`);
        res.status(500).json({ message: "Server Error trying to get USER INFO BY ID"});
    }
};