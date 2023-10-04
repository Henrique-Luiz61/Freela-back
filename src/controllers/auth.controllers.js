import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { createSessionDB } from "../repository/auth.repository.js";
import {
  getUserByEmailDB,
  createUserDB,
  getIdUserDB,
  createContactInfoDB,
} from "../repository/users.repository.js";

export async function signUp(req, res) {
  const {
    name,
    email,
    cpf,
    telephone,
    city,
    photo,
    password,
    confirmPassword,
  } = req.body;

  try {
    const user = await getUserByEmailDB(email);
    if (user.rowCount > 0)
      return res.status(409).send({ message: "Email já cadastrado!" });

    const hash = bcrypt.hashSync(password, 10);

    await createUserDB(name, email, hash);

    const userId = await getIdUserDB(email);

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
        .send({ message: "Email não cadastrado. Cadastre-se!" });

    const correctPassword = bcrypt.compareSync(password, user.rows[0].password);
    if (!correctPassword)
      return res.status(401).send({ message: "Senha incorreta!" });

    const token = uuid();

    await createSessionDB(token, user.rows[0].id);

    res.send({ token });
  } catch (err) {
    res.status(500).send(err.message);
  }
}
