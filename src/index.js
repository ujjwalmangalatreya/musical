
// require('dotenv').config({path: './env'})
import dotenv from "dotenv"
import { app } from "./app.js";
import { connectDB } from "./db/db_connection.js";
dotenv.config({
    path: './.env'
})


connectDB()
.then(() => {
    app.listen(process.env.PORT || 8000, () => {
        console.log(process.env.PORT);
        console.log(`⚙️:::::Server is running at port:::::${process.env.PORT}`);
    })
})
.catch((err) => {
    console.log(":::::Database Conncetion FAILED:::::", err);
})

