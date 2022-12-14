const pool = require('../utils/pool');

module.exports = class User {
  email;
  #passwordHash;
  username;
  completed_categories;
  total_points;

  constructor(row) {
    this.id = row.id;
    this.email = row.email;
    this.#passwordHash = row.password_hash;
    this.username = row.username;
    this.completed_categories = row.completed_categories;
    this.total_points = row.total_points;
  }

  static async insert({ username, email, passwordHash }) {
    const { rows } = await pool.query(
      `INSERT INTO users (username, email, password_hash)
      VALUES ($1, $2, $3)
      RETURNING *`,
      [username, email, passwordHash]
    );

    return new User(rows[0]);
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * FROM users');

    return rows.map((row) => new User(row));
  }

  static async getLogin({ email, username }) {
    const { rows } = await pool.query(
      `SELECT *
        FROM users
        WHERE email = $1 OR
        username = $2`,
      [email, username]
    );
    if (!rows) return null;

    return new User(rows[0]);
  }
  
  static async getById(id) {
    const { rows } = await pool.query(
      `SELECT * 
      FROM users
      WHERE id = $1`,
      [id]
    );
    if (rows.length === 0) return null;

    return new User(rows[0]);
  }

  static async updateUserPoints({ id, total_points, completed_categories }) {
    const { rows } = await pool.query(
      `UPDATE users
      set total_points = total_points + $2,
      completed_categories = ARRAY_APPEND(completed_categories, $3)
      WHERE id = $1
      RETURNING *`,
      [id,
        total_points,
        completed_categories]
    );
    return new User(rows[0]);
  }

  get passwordHash() {
    return this.#passwordHash;
  }
};
