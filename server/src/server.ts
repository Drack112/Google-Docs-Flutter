import express, { NextFunction, Request, Response } from "express";
import cors from "cors";
import http from "http";

import "express-async-errors";
import "dotenv/config";

import "./database/connection"

import authRouter from "./routes/AuthRoutes";
import documentRouter from "./routes/DocumentRoutes";
import AppError from "./errors/AppError";
import { Socket } from "socket.io";
import Document from "./schemas/document";

const app = express();

// WebSocket
const server = http.createServer(app);
const io = require("socket.io")(server);

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

io.on("connection", (socket: Socket) => {
  socket.on("join", (documentId: string) => {
    socket.join(documentId);
    console.log(socket.id, " joined")
  })

  socket.on("typing", (data: any) => {
    socket.broadcast.to(data.room).emit('changes', data);
  })

  socket.on("save", (data: any) => {
    saveData(data);
  })
})

const saveData = async (data: any) => {
  let document = await Document.findById(data.room);
  document?.content = data.delta;
  document = await document.save;
}

server.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`)
})
