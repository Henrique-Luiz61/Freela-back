import joi from "joi";

export const addServiceSchema = joi.object({
  title: joi.string().min(4).required(),
  description: joi.string().min(8).required(),
  photo: joi.string().required(),
  userId: joi.number().required(),
});
