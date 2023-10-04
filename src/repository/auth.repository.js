import { db } from "../database/db.connection.js";

export function createSessionDB(token, userId) {
  return db.query(`INSERT INTO sessions (token, "userId") VALUES ($1, $2);`, [
    token,
    userId,
  ]);
}

export function findSessionDB(token) {
  return db.query(`SELECT "userId" FROM sessions WHERE token = $1;`, [token]);
}
