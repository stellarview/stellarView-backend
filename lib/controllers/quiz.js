const { Router } = require('express');
const Quiz = require('../models/Quiz');
const authenticate = require('../middleware/authenticate');

module.exports = Router()
  .get('/:category', authenticate, async (req, res, next) => {
    try {
      const quiz = await Quiz.getQuizByCategory(req.params.category);
      res.json(quiz); 
    } catch(e) {
      next(e);
    }
    
  })
;
