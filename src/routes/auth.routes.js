import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { signinSchema, signupSchema } from "../schemas/auth.schemas.js";
import { signUp, signIn } from "../controllers/auth.controllers.js";

const authRouter = Router();

authRouter.post("/signup", validateSchema(signupSchema), signUp);
authRouter.post("/signin", validateSchema(signinSchema), signIn);

export default authRouter;
