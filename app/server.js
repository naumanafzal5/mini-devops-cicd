const express = require("express");

const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send("Hello from DevOps Project");
});

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.get("/version", (req, res) => {
  res.json({ version: "1.0.0" });
});

app.listen(port, () => {
  console.log("App running on port " + port);
});