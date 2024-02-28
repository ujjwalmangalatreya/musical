const {sequelize} = require("../db/db_connection.js")
const { checkUserNameEmpty, checkPasswordEmpty,checkPasswordValidations } = require("../services/user.service.js");
const { ApiResponse } = require("../utils/ApiResponse.js");
const { ApiError } = require("../utils/ApiError.js");
const Users = require("../models/users.models.js")(sequelize)

module.exports = {
  add: async (req, res) => {
    try {
      //Check if username and password empty and null
      if (!checkUserNameEmpty(req.body.username) ||
        !checkPasswordEmpty(req.body.password)) {
        return res.status(400).send(new ApiError(
          400,
          "Username and Password should not be empty",
        ));
      } else {
        // add username and password to database Users table
        const validatePassword = await checkPasswordValidations(req.body.password);
        
        if (validatePassword) {
          const user = await Users.create({
            username: req.body.username,
            password: req.body.password
          });
        
          // Send status code and json response
          res.status(201).send(new ApiResponse(201, [
            { username: req.body.username }],
            "Username Password registered successfully",));
        } else {
          res.send("username password not validated.")
        }
      }
    } catch (error) {
      // send if error message
      res.status(500).send(new ApiError(
        500,
        "Internal Server Error",
        ""+error.toString()
      ));
    }
  }

  
  
  
};
