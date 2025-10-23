import { GoogleGenAI } from "@google/genai";

// Initialize Gemini API
const genAI = new GoogleGenAI({ apiKey: process.env.GOOGLE_API_KEY });

/**
 * Analyzes clothing item image using Gemini Vision API
 * @param {string} base64ImageData - Base64 encoded image data (with or without data URI prefix)
 * @returns {Promise<string>} Description of the clothing item
 */
export const analyzeClothingImage = async (base64ImageData) => {
    try {
        const model = genAI.getGenerativeModel({ model: "gemini-2.0-flash" });

        const response = await model.generateContent([
            {
                inlineData: {
                    data: base64ImageData,
                    mimeType: "image/jpeg",
                },
            },
            "Provide a brief description of this clothing item.",
        ]);

        const description = response.response.text();

        return description;
    } catch (error) {
        console.error("Gemini API Error:", error);
        throw new Error(`Failed to analyze clothing image: ${error.message}`);
    }
};
