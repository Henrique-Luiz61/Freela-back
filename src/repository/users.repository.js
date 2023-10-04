import { db } from "../database/db.connection.js";

export function getUserByEmailDB(email) {
  return db.query(`SELECT * FROM users WHERE email = $1;`, [email]);
}

export function createUserDB(name, email, password) {
  return db.query(
    `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
    [name, email, password]
  );
}

export function getIdUserDB(email) {
  return db.query(`SELECT id FROM users WHERE email = $1;`, [email]);
}

export function getUserByIdDB(userId) {
  return db.query(`SELECT * FROM users WHERE id = $1;`, [userId]);
}

export function createContactInfoDB(cpf, telephone, city, photo, userId) {
  return db.query(
    `INSERT INTO contactinfo (cpf, telephone, city, photo, "userId") VALUES ($1, $2, $3, $4, $5);`,
    [cpf, telephone, city, photo, userId]
  );
}
