const pool = require('../utils/pool');

module.exports = class Questions {
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

  //   async function for get category questions, which includes getAllCategoryLevel
  // a level parameter

  // async function to call question_choices getAllQuestions
  // by first calling the category function

  // insert into Questions table for admin updateQuestions
  // update Questions for admin

};
