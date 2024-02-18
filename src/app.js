import express from 'express'
import cors from 'cors'
import cookieParser from 'cookie-parser';

//Create an express application
const app = express();
app.use(cors({
    origin: process.env.CORS_ORIGIN,
    credentials: true
}))

app.use(express.json({ limit: "16kb" }))
app.use(express.urlencoded({ extended: true, limit: "16kb" }))
app.use(express.static("public"))
app.use(cookieParser())

const PORT = process.env.PORT || 3000;

export { app }


