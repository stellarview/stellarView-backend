const pool = require('../utils/pool');

module.exports = class GithubUser {
  id;
  username;
  email;
  #password_hash;

  constructor(row) {
    this.id = row.id;
    this.username = row.username;
    this.email = row.email;
    this.#password_hash = row.password_hash;
  }

  static async insert({ username, email, password }) {
    if (!username) throw new Error('Username required');
    const { rows } = await pool.query(
      `INSERT INTO users
      (username, email, password_hash)
      VALUES($1, $2, $3)
      RETURNING * `,
      [username, email, password]
    );
    console.log('line 23', rows[0]);
    return new GithubUser(rows[0]);
  }

  static async findByUserName(username) {
    const { rows } = await pool.query(
      `SELECT *
            FROM users
            WHERE username=$1`,
      [username]
    );
    if (!rows[0]) return null;
    return new GithubUser(rows[0]);
  }

  toJSON() {
    return { ...this };
  }
};
