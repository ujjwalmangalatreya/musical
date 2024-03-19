const { Sequelize } = require("sequelize");
const { sequelize } = require("../db/db_connection.js");
const { ApiResponse } = require("../utils/ApiResponse.js");
const { ApiError } = require("../utils/ApiError.js");
const Users = require("../models/users.models.js")(sequelize);
const Profile = require("../models/profile.models")(sequelize);

module.exports = {
     list: async (req, res) => {
          try {
               const profiles = Profile.findAll() 
               return ApiResponse(200,[profiles])
          }catch(error){
               console.log(error)
               return ApiResponse(400, error)
          }
          
         
     },

          
}