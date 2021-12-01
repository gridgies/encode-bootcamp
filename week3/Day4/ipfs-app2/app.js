const express = require("express");
const app = express();
const path = require("path");
const router = express.Router();

app.set("view engine", "pug");
app.set("views", path.join(__dirname, "views"));

// router.get("/", (req, res) => {
//   res.render("index");
// });

app.get('/', (req, res) => {
  res.status(200).sendFile(__dirname + '/index.html');
});


app.use("/", router);
app.listen(process.env.port || 3000);

console.log("Running at Port 3000");
