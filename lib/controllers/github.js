const { Router } = require('express');
const jwt = require('jsonwebtoken');
const { exchangeCodeForToken, getGithubProfile } = require('../utils/github');
const { GithubUser } = require('../models/GithubUser');
const authenticate = require('../middleware/authenticate');
const ONE_DAY_IN_MS = 1000 * 60 * 60 * 24;

module.exports = Router()
  .get('/', async (req, res) => {
    res.redirect(
      `https://github.com/login/oauth/authorize?client_id=${process.env.GH_CLIENT_ID}&scope=user&redirect_uri=${process.env.GH_REDIRECT_URI}`
    );
  })
  .get('/callback', async (req, res, next) => {
    try {
      const { code } = req.query;

      const token = await exchangeCodeForToken(code);
      const githubProfile = await getGithubProfile(token);

      let user = await GithubUser.findByUserName(githubProfile.login);
      if (!user) {
        user = await GithubUser.insert({
          username: githubProfile.login,
          email: githubProfile.email,
        });
      }
      const payload = jwt.sign(user.toJSON(), process.env.JWT_SECRET, {
        expiresIn: '1 day',
      });
      res
        .cookie(process.env.COOKIE_NAME, payload, {
          httpOnly: true,
          maxAge: ONE_DAY_IN_MS,
        })
        .redirect('/api/v1/github/dashboard');
    } catch (error) {
      next(error);
    }
  })

  .get('/dashboard', authenticate, async (req, res) => {
    res.json(req.user);
  })

  .delete('/sessions', async (req, res) => {
    res
      .clearCookie(process.env.COOKIE_NAME)
      .json({ success: true, message: 'Signed out successfully!' });
  });
