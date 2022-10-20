const { Router } = require('express');
const Quiz = require('../models/Quiz');
const authenticate = require('../middleware/authenticate');

module.exports = Router()
  .get('/:category/:level', authenticate, async (req, res, next) => {
    try {
      const quiz = await Quiz
        .getQuizByCategoryLevel(req.params.category, 
          req.params.level);
      res.json(quiz); 
    } catch(e) {
      next(e);
    }
    
  })
;
