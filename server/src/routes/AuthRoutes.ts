import User from "../schemas/user";
import { Request, Response, Router } from "express";

const authRouter = Router();


authRouter.post("/api/signup", async (req: Request, res: Response) => {
  try {
    const { name, email, profilePic } = req.body;

    const user = await User.findOne({ email })

    if (user) {
      return res.status(400).json({ message: "User already exists" })
    }

    const newUser = await User.create({
      name,
      email,
      profilePic,
    })

    return res.status(201).json(newUser)
  } catch (err) {
    return res.status(500).json({ error: err })
  }
})

export default authRouter;
