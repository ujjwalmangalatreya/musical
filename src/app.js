//Import required modules
const express  = require('express')

//Create a express application
const app = express()

// define route handler for the root path

app.get('/',(req,res)=>{
    res.send('Hello World.');
})

const PORT = process.env.PORT || 3000;

//Start the server
app.listen(PORT,()=>{
    console.log(`Server is running on http://localhost:${PORT}`)
})


