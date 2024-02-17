//Import required modules
const express = require('express');
const db = require('./db');
const bodyParser = require('body-parser')
const registerRoute = require('./routes/register.js')


//Create an express application
const app = express();

app.use(bodyParser.json())

app.use('/api/v1/register',registerRoute)

const PORT = process.env.PORT || 3000;

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
