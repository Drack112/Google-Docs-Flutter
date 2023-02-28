import express from "express";
import cors from "cors";

import "express-async-errors";
import "dotenv/config";

import "./database/connection"

import authRouter from "./routes/AuthRoutes";

const app = express();

app.use(cors());
app.use(express.json());

app.use(authRouter);

const PORT = process.env.APP_PORT;

app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`)
})
