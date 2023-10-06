import { db } from "../database/db.connection.js";

export async function createServiceDB(title, description, photo, userId) {
  return db.query(
    `INSERT INTO services (title, description, photo, "userId") VALUES ($1, $2, $3, $4);`,
    [title, description, photo, userId]
  );
}

export async function findFreelancersDB() {
  return db.query(`
    SELECT users.name, users.email, professions.title AS profession,
            "contactInfo".telephone, "contactInfo".city, "contactInfo".photo
	  FROM users
	  JOIN professions ON professions."userId" = users.id
	  JOIN "contactInfo" ON "contactInfo"."userId" = users.id
    ORDER BY users.id DESC;
  `);
}

export async function findServicesByUserIdDB(id) {
  return db.query(
    `SELECT id, title, description, photo, available FROM services WHERE "userId" = $1;`,
    [id]
  );
}
