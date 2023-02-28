import express, { NextFunction, Request, Response } from "express";
import cors from "cors";

import "express-async-errors";
import "dotenv/config";

import "./database/connection"

import authRouter from "./routes/AuthRoutes";
import documentRouter from "./routes/DocumentRoutes";
import AppError from "./errors/AppError";

const app = express();

app.use(cors());
app.use(express.json());

app.use(authRouter);
app.use(documentRouter);

app.use(
  (error: Error, request: Request, response: Response, next: NextFunction) => {
    if (error instanceof AppError) {
      return response.status(error.statusCode).json({
        status: "error",
        message: error.message,
      });
    }

    console.log(error);

    return response.status(500).json({
      status: "error",
      message: "Internal server error",
    });
  },
);

const PORT = process.env.APP_PORT;

app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`)
})
