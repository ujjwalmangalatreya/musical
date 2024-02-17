// Import required modules
const express = require('express');
const db = require('../db');

// Create a router instance
const router = express.Router();

// Define route handler for the /api/v1/register endpoint
router.post('/', (req, res) => {
    // Extract data from the request body
    const { username, email } = req.body;

    // Validate input data (optional)
    if (!username || !email) {
        return res.status(400).json({ error: 'Username and email are required'+username,email });
    }

    // Execute SQL query to insert data into the database
    db.query('INSERT INTO users (username, email) VALUES ($1, $2)', [username, email])
        .then(() => {
            res.status(201).json({ message: 'User registered successfully' });
        })
        .catch(err => {
            console.error('Error inserting user:', err);
            res.status(500).json({ error: 'An error occurred while registering user' });
        });
});

module.exports = router;
