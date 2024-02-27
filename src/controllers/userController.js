const {sequelize} = require("../db/db_connection.js")
const { checkUserNameEmpty, checkPasswordEmpty } = require("../services/user.service");
const Users = require("../models/users.js")(sequelize)

module.exports = {
  add: async (req, res) => {
    try {
      const usernameValue = checkUserNameEmpty(req.body.username)
      const passwordValue = checkUserNameEmpty(req.body.password)
      if(!checkUserNameEmpty(req.body.username) ||
        !checkPasswordEmpty(req.body.password)){
            return res.status(400).send({
              success :"0",
              message :"Enter username and password"
            });
      }else {
        const user = await Users.create({

          //validateUserName()
          //validatePasswor()
          username: req.body.username,
          password: req.body.password
        });
        res.status(201).send(user.toJSON());
      }
    } catch (error) {
      res.status(400).send(error.toString());
    }
  }
};
