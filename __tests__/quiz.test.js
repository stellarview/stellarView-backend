const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');
const UserService = require('../lib/services/UserService');

const mockUser = {
  username: 'User',
  email: 'test@example.com',
  password: '12345',
  completed_categories: [''],
  total_points: '0',
};

const registerAndLogin = async (userProps = {}) => {
  const password = userProps.password ?? mockUser.password;

  // Create an "agent" that gives us the ability
  // to store cookies between requests in a test
  const agent = request.agent(app);

  // Create a user to sign in with
  const user = await UserService.create({ ...mockUser, ...userProps });

  // ...then sign in
  const { email } = user;
  await agent.post('/api/v1/users/sessions').send({ email, password });
  return [agent, user];
};

describe('quiz-routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });

  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/html');

    expect(res.body[0]).toEqual({
      category: 'html',
      choice_one: '<ol>',
      choice_two: '<ul>',
      choice_three: '<nl>',
      choice_four: '<li>',
      id: '6',
      level: 1,
      question: 'Which HTML tag is used for a numbered list?',
    });
  });
  // Change test per test category
  it.only('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/javascript');
    expect(res.body[0]).toEqual({
      category: 'javascript',
      level: 1,
      question:
        'Which method is used to take the last element off of a given array?',
      id: '11',
      choice_one: 'pop()',
      choice_two: 'shift()',
      choice_three: 'peek()',
      choice_four: 'reduce()',
    });
  });
  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/html');
    const expected = [
      { id: '1', category: 'Node.js', level: 1, question: 'What is a jwt?' }, // Change as needed
    ];
    expect(res.body).toEqual(expected);
  });
  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/css');
    const expected = [
      { id: '1', category: 'Node.js', level: 1, question: 'What is a jwt?' }, // Change as needed
    ];
    expect(res.body).toEqual(expected);
  });
  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/react');
    const expected = [
      { id: '1', category: 'Node.js', level: 1, question: 'What is a jwt?' }, // Change as needed
    ];
    expect(res.body).toEqual(expected);
  });
  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/node');
    const expected = [
      { id: '1', category: 'Node.js', level: 1, question: 'What is a jwt?' }, // Change as needed
    ];
    expect(res.body).toEqual(expected);
  });
  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/express');
    const expected = [
      { id: '1', category: 'Node.js', level: 1, question: 'What is a jwt?' }, // Change as needed
    ];
    expect(res.body).toEqual(expected);
  });
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/dsa');
    const expected = [
      { id: '1', category: 'Node.js', level: 1, question: 'What is a jwt?' }, // Change as needed
    ];
    expect(res.body).toEqual(expected);
  });
});