//Import required modules
const express = require('express');
const db = require('./db');

//Create an express application
const app = express();

// Define route handler for the root path
app.get('/', (req, res) => {
    // res.send('Hello World.');
    db.query('SELECT * FROM users where id =1')
        .then(result => {
            res.send(result.rows);
        })
        .catch(err => {
            res.send("Error: " + err);
        });
});

const PORT = process.env.PORT || 3000;

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
