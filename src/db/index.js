import { DB_NAME } from "../constants.js";

const connectDB = async() => {
    try {
        
    } catch (err) {
        console.log("Database connection FAILED ::", err);
        throw err;
    }
}


export {connectDB}