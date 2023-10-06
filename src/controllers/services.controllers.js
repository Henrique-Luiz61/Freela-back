import { getUserByIdDB } from "../repository/users.repository.js";
import {
  createServiceDB,
  findFreelancersDB,
} from "../repository/services.repository.js";

export async function createService(req, res) {
  const { title, description, photo, userId } = req.body;

  try {
    const user = await getUserByIdDB(userId);

    if (user.rowCount === 0)
      return res.status(404).send({ message: "User not found!" });

    await createServiceDB(title, description, photo, userId);

    res.sendStatus(201);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getFreelancers(req, res) {
  try {
    const freelas = await findFreelancersDB();

    if (freelas.rowCount === 0)
      return res
        .status(404)
        .send({ message: "No freelancers registered yet!" });

    res.status(200).send(freelas.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getServicesByUserId(req, res) {
  const { userId } = req.params;

  try {
    const services = await getServicesByIdDB(Number(userId));

    res.send(services.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
