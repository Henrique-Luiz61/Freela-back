import { db } from "../database/db.connection.js";

export async function createServiceDB(title, description, photo, userId) {
  return db.query(
    `INSERT INTO services (title, description, photo, "userId") VALUES ($1, $2, $3, $4);`,
    [title, description, photo, userId]
  );
}

export async function getFreelaNamePhotoDB() {
  return db.query(`SELECT users.id, users.name, contactinfo.photo FROM users 
  JOIN contactinfo ON users.id = contactinfo."userId";`);
}

export async function getServicesDB() {
  return db.query(
    `SELECT title, "userId" FROM services WHERE available = $1;`,
    [true]
  );
}

export async function getServicesByIdDB(userId) {
  return db.query(
    `SELECT id, title, description, photo, available FROM services WHERE "userId" = $1;`,
    [userId]
  );
}
