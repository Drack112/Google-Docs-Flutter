import express from "express";
import cors from "cors";

import "express-async-errors";
import "dotenv/config";

import "./database/connection"

const app = express();

app.use(cors());
app.use(express.json());

const PORT = process.env.APP_PORT;

app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`)
})
