const pool = require('../utils/pool');

module.exports = class Quiz {
  id;
  category;
  level;
  question;
  correct_answer;   

  constructor(row) {
    this.id = row.id;
    this.category = row.category;
    this.level = row.level;
    this.question = row.question;
    this.correct_answer = row.correct_answer;
    this.choice_one = row?.choice_one;
    this.choice_two = row?.choice_two;
    this.choice_three = row?.choice_three;
    this.choice_four = row?.choice_four;
  }

  static async getQuizByCategoryLevel(category, level) {
    const { rows } = await pool.query(
      `SELECT questions.*, choice_one, choice_two, choice_three, choice_four from question_choices
      LEFT JOIN questions ON question_choices.questions_id = questions.id
      WHERE category = $1 AND level = $2`, 
      [category, level]
    );
    return rows.map((row) => new Quiz(row));
  }
};
  


