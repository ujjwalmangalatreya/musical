// Import required modules
const express = require('express');
const registerRoute = require('./register');

// Create a router instance
const router = express.Router();

// Register route handlers
router.use('/register', registerRoute);

module.exports = router;
