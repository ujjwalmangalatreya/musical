const UserDetails = require("../models/user.models.js")

module.exports = {
  add(req, res) {
    if (!req.body.email || !req.body.password) {
      res.status(400).send({ msg: "Please pass email and password." });
    } else {
      return UserDetails.add({
        email: req.body.email,
        password: req.body.password,
        // Assuming user_type is a field in your model
        user_type: req.body.user_type,
      })
        .then((user) => res.status(201).send(user.toJSON()))
        .catch((error) => res.status(400).send(error));
    }
  },
};
