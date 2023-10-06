import { db } from "../database/db.connection.js";

export async function getUserByEmailDB(email) {
  return db.query(`SELECT * FROM users WHERE email = $1;`, [email]);
}

export async function createUserDB(name, email, password) {
  return db.query(
    `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
    [name, email, password]
  );
}

export async function getUserByIdDB(userId) {
  return db.query(`SELECT * FROM users WHERE id = $1;`, [userId]);
}

export async function createContactInfoDB(cpf, telephone, city, photo, userId) {
  return db.query(
    `INSERT INTO "contactInfo" (cpf, telephone, city, photo, "userId") VALUES ($1, $2, $3, $4, $5);`,
    [cpf, telephone, city, photo, Number(userId)]
  );
}

export async function createProfessionDB(profession, userId) {
  return db.query(
    `INSERT INTO professions (title, "userId") VALUES ($1, $2);`,
    [profession, userId]
  );
}
