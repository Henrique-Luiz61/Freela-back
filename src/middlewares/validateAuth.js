import { findSessionDB } from "../repository/auth.repository.js";

export async function validateAuth(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");
  if (!token) return res.sendStatus(401);

  try {
    const session = await findSessionDB(token);

    if (session.rowCount === 0)
      return res
        .status(401)
        .send({ message: "You need to be logged in to add a service!" });

    res.locals.userId = session.rows[0].userId;

    next();
  } catch (err) {
    res.status(500).send(err);
  }
}
