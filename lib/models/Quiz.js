const pool = require('../utils/pool');

module.exports = class Quiz {
  id;
  category;
  level;
  question;
  #correctHash;   

  constructor(row) {
    this.id = row.id;
    this.category = row.category;
    this.level = row.level;
    this.question = row.question;
    this.#correctHash = row.correct_hash;
  }

  static async getAllQuizzes() {
    const { rows } = await pool.query(
      `
        SELECT * from questions
            `
    );
    return rows.map((row) => new Quiz(row));
  }
};

