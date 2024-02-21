

const { Pool }  = require("pg")
const { constants } = require("../constants.js")




const pool = new Pool({
    user: '',
    password: 'ujjwal',
    host: 'localhost',
    database: constants.DB_NAME,
    port: process.env.DB_PORT,
})

const connectDB = async options => {
    try {
        await pool.connect(options);
        console.log(`:::::Database Connected Successfully in Port ${process.env.DB_PORT}:::::`)
    } catch (err) {
        console.log(":::::Database connection FAILED:::::", err);
        throw err;
    }
}


module.exports = { connectDB }