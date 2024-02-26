const {sequelize} = require("../db/db_connection.js")
const Users = require("../models/users.js")(sequelize)

module.exports = {
  add: async (req, res) => {
    try {
      const user = await Users.create({
        //validateUserName()
        //validatePasswor()
        username: req.body.username,
        password: req.body.password
      });
      res.status(201).send(user.toJSON());
    } catch (error) {
      res.status(400).send(error);
    }
  }
};
