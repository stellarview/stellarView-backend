const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

module.exports = class UserService {
  static async create({ username, email, password, completed_categories, total_points }) {
    const passwordHash = await bcrypt.hash(
      password,
      Number(process.env.SALT_ROUNDS)
    );

    const user = await User.insert({
      username,
      email,
      passwordHash,
      completed_categories,
      total_points
    });

    return user;
  }

  static async signIn({ username, email, password = '' }) {
    const userLogin = { username, email };


    try {
      const user = await User.getLogin(userLogin);
      if (!user) throw new Error('Invalid email or username');
      // use built in compareSync method
      if ((!!email && !!username) || (!email && !username)) {
        throw new Error('You must provide an email or username');
      } 

      if (!password) {
        throw new Error('Password is required');
      }

      if (!bcrypt.compareSync(password, user.passwordHash))
        throw new Error('Invalid password');

      // creates our JWT using built in function
      const token = jwt.sign({ ...user }, process.env.JWT_SECRET, {
        expiresIn: '1 day',
      });

      return token;
    } catch (error) {
      error.status = 401;
      throw error;
    }
  }
};
