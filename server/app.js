import express from "express"
import dotenv from "dotenv"
import cors from "cors"

// Initialisation
const app = express()

// Load env variable
dotenv.config()
const PORT = process.env.PORT

// Middleware
app.use(express.json())
app.use(cors({
    origin: ['http://localhost:5173'],
    methods: ['GET', 'POST', 'PATCH', 'PUT', 'DELETE'],
    credentials: true
}))

// PORT listening
app.listen(PORT, () => {
    console.log('Server is running');
    
})