const { sequelize } = require("../src/db/db_connection.js")
const { loginUser } = require("../src/controllers/user.controller.js")
const jwt = require("jsonwebtoken")
const bcrypt = require("bcrypt")
const { describe, beforeEach } = require("@jest/globals")
const Users = require("../src/models/users.models.js")

// const { sequelize } = require("../src/db/db_connection.js")
// const Users = require("../src/models/users.models.js")(sequelize)

//Mock usermode
jest.mock("../src/models/users.models.js", () => {
     Users: {
          findOne: jest.fn()
     }
})
//mock bcrypt
jest.mock('bcrypt', () => ({
     compare: jest.fn(),
}));

// mock jwt
jest.mock('jsonwebtoken', () => ({
     sign: jest.fn(),
}));

describe("::LOGIN TEST::", () => {
     beforeEach(() => {
          jest.clearAllMocks();
     })
     it("Should return 200 when user enters valid username passwrod", async () => {
          const mockUser = { id: 1, username: "XXXX", password: "XXXX" }
          Users.findOne.mockResolvedValue(mockUser);
          bcrypt.compare.mockResolvedValue(true);
          jwt.sign.mockReturnValue('mockToken');

          const req = { body: { username: 'testuser', password: 'password' } };
          const res = { status: jest.fn().mockReturnThis(), send: jest.fn() };

          await loginUser(req, res);

          expect(res.status).toHaveBeenCalledWith(200);
          expect(res.send).toHaveBeenCalledWith(expect.objectContaining({ token: 'mockToken' }));

     });
     it("Should retutn 400 when user enters invalid username password", () => {

     })
})