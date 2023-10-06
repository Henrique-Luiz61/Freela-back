import joi from "joi";

export const signinSchema = joi.object({
  email: joi.string().email().required(),
  password: joi.string().min(3).required(),
});

export const signupSchema = joi.object({
  name: joi.string().required(),
  email: joi.string().email().required(),
  cpf: joi.string().pattern(/^\d+$/).length(11).required(),
  telephone: joi.string().pattern(/^\d+$/).min(10).max(15).required(),
  city: joi.string().min(3).required(),
  photo: joi.string().required(),
  profession: joi.string().min(3).required(),
  password: joi.string().min(3).required(),
  confirmPassword: joi.string().min(3).required().valid(joi.ref("password")),
});
