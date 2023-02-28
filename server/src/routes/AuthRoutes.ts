import User from "../schemas/user";
import { Request, Response, Router } from "express";
import { sign } from "jsonwebtoken";

import authConfig from "../config/auth";
import isAuthenticated from "../middlewares/isAuthenticated";
import AppError from "../errors/AppError";

const authRouter = Router();


authRouter.post("/api/signup", async (req: Request, res: Response) => {
  try {
    const { name, email, profilePic } = req.body;

    let user = await User.findOne({ email });

    if (!user) {

      const newUser = new User({
        name,
        email,
        profilePic
      })

      user = await newUser.save()
    }

    const token = sign({}, authConfig.jwt.secret, {
      subject: user.id,
      expiresIn: authConfig.jwt.expiresIn,
    });

    res.status(201).json({ user: user, token });
  } catch (err) {
    throw new AppError(err.message, 500)
  }
})

authRouter.get("/", isAuthenticated, async (req: Request, res: Response) => {
  const user = await User.findById(req.user)

  if (!user) {
    throw new AppError("User does not exist", 400);
  }

  const authHeader = req.headers.authorization;
  const [, token] = authHeader.split(" ");

  res.status(200).json({ user, token })
})

export default authRouter;
