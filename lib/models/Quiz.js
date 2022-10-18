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
    this.choice_one = row?.choice_one;
    this.choice_two = row?.choice_two;
    this.choice_three = row?.choice_three;
    this.choice_four = row?.choice_four;
  }

  static async getAllQuizzes(category) {
    const { rows } = await pool.query(
      `SELECT questions.*, choice_one, choice_two, choice_three, choice_four from question_choices
      LEFT JOIN questions ON question_choices.questions_id = questions.id
       WHERE category = $1`, 
      [category]
    );
    return rows.map((row) => new Quiz(row));
  }
};
  


