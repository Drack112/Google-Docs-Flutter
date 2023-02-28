import isAuthenticated from "../middlewares/isAuthenticated";

import { Request, Response, Router } from "express";
import Document from "../schemas/document";
import AppError from "../errors/AppError";

const documentRouter = Router()

documentRouter.post('/doc/create', isAuthenticated, async (request: Request, response: Response) => {
  try {
    const { createdAt } = request.body;

    let document = new Document({
      uid: request.user._id,
      title: "Untitled Document",
      createdAt,
    });

    document = await document.save();

    response.status(201).json(document);
  } catch (err) {
    throw new AppError(err.message, 500)
  }
})

export default documentRouter;
