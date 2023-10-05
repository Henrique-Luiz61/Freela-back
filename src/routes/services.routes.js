import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { addServiceSchema } from "../schemas/services.schemas.js";
import {
  createService,
  getFreelaServices,
  getServicesByUserId,
} from "../controllers/services.controllers.js";

const serviceRouter = Router();

serviceRouter.post(
  "/addServices",
  validateAuth,
  validateSchema(addServiceSchema),
  createService
);
serviceRouter.get("/myServices");
serviceRouter.get("/home", getFreelaServices);
serviceRouter.get("/services/:userId", getServicesByUserId);

export default serviceRouter;
