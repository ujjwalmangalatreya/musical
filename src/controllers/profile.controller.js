const { Sequelize } = require("sequelize");
const { sequelize } = require("../db/db_connection.js");
const { ApiResponse } = require("../utils/ApiResponse.js");
const Profile = require("../models/profile.models")(sequelize);


module.exports = {


     profileLists: async (req, res) => {
          try {
               // Fetch all profiles from the database
               const profiles = await Profile.findAll();

               // Send the profiles as a JSON response
               return res.status(200).json(profiles);
          } catch (error) {
               console.log(error);
               // Handle errors and send an appropriate response
               return res.status(500).json({ error: 'Internal Server Error' });
          }
     }



}