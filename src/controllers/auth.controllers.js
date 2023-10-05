import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { createSessionDB } from "../repository/auth.repository.js";
import {
  getUserByEmailDB,
  createUserDB,
  createContactInfoDB,
} from "../repository/users.repository.js";

export async function signUp(req, res) {
  const { name, email, cpf, telephone, city, photo, password } = req.body;

  try {
    const user = await getUserByEmailDB(email);

    if (user.rowCount > 0)
      return res.status(409).send({ message: "Email already registered!" });

    const hash = bcrypt.hashSync(password, 10);

    await createUserDB(name, email, hash);

    const userId = await getUserByEmailDB(email);

    await createContactInfoDB(cpf, telephone, city, photo, userId.rows[0].id);

    res.sendStatus(201);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function signIn(req, res) {
  const { email, password } = req.body;

  try {
    const user = await getUserByEmailDB(email);

    if (user.rowCount === 0)
      return res
        .status(401)
        .send({ message: "Email not registered. sign-up!" });

    const correctPassword = bcrypt.compareSync(password, user.rows[0].password);
    if (!correctPassword)
      return res.status(401).send({ message: "Incorrect Password!" });

    const token = uuid();

    await createSessionDB(token, user.rows[0].id);

    res.send({ token: token, userId: user.rows[0].id });
  } catch (err) {
    res.status(500).send(err.message);
  }
}
