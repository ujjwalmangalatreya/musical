
import pg from "pg";
import { constants } from "../constants.js";

const {Pool} = pg;


const pool = new Pool({
    user: '',
    password: 'ujjwal',
    host: 'localhost',
    database: constants.DB_NAME,
    port: process.env.PORT,
})

const connectDB = async () => {
    try {
        await pool.connect();
        console.log(`Database Connected Sucessfully in Port ${process.env.PORT}`)
    } catch (err) {
        console.log("Database connection FAILED ::", err);
        throw err;
    }
}


export { connectDB }