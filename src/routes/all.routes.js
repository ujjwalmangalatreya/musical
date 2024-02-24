const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController.js")


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


router.get('/api/user', userController.add);




