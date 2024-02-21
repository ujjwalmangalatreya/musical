const dotenv = require("dotenv");
const { app } = require("./app.js"); // Assuming app is exported from app.js
const { connectDB } = require("./db/db_connection.js");

dotenv.config({
    path: './.env'
});

connectDB()
  .then(() => {
      const port = process.env.SERVER_PORT || 8000; // Define port
      app.listen(port, () => {
          console.log(`⚙️ Server is running at port ${port}`);
      });
  })
  .catch((err) => {
      console.error(":::::Database Connection FAILED:::::", err);
  });
