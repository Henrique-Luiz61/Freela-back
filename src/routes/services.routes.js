import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { addServiceSchema } from "../schemas/services.schemas.js";
import {
  createService,
  getFreelancers,
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
serviceRouter.get("/home", getFreelancers);
serviceRouter.get("/services/:id", getServicesByUserId);

export default serviceRouter;
