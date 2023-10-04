import { getUserByIdDB } from "../repository/users.repository.js";
import {
  createServiceDB,
  getFreelaNamePhotoDB,
  getServicesDB,
  getServicesByIdDB,
} from "../repository/services.repository.js";

export async function createService(req, res) {
  const { title, description, photo, userId } = req.body;

  try {
    const user = await getUserByIdDB(userId);
    if (user.rowCount === 0)
      return res.status(404).send({ message: "Usuário não encontrado!" });

    await createServiceDB(title, description, photo, userId);

    res.sendStatus(201);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getFreelaServices(req, res) {
  try {
    const freelaServices = await getFreelaNamePhotoDB();

    const allServices = await getServicesDB();

    for (let i = 0; i < freelaServices.rows.length; i++) {
      freelaServices.rows[i].services = allServices.rows.filter((serv) => {
        if (freelaServices.rows[i].id == serv.userId) return serv;
      });
    }

    res.send(freelaServices.rows);
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
