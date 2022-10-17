const { Router } = require('express');
const Quiz = require('../models/Quiz');
const authenticate = require('../middleware/authenticate');

module.exports = Router()
  .get('/', authenticate, async (req, res, next) => {
    try {
      const quiz = await Quiz.getAllQuizzes();
      console.log('line 9', quiz);
      res.json(quiz); 
    } catch(e) {
      next(e);
    }
  });
