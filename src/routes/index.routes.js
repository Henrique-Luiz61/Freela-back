import { Router } from "express";
import authRouter from "./auth.routes.js";
import serviceRouter from "./services.routes.js";

const router = Router();

router.use(authRouter);
router.use(serviceRouter);

export default router;
