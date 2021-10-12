import express from "express";

const app = express();

app.use(express.json())

app.get('/', (req, res) => {
  res.json({message:  "Your application works, you lucky bastard."});
});

app.listen(8080, () => {
  console.log("Server listening on http://localhost:8080");
});