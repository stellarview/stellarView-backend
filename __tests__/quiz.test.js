const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');
const UserService = require('../lib/services/UserService');

const mockUser = {
  username: 'User',
  email: 'test@example.com',
  password: '12345'
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
      id: '6',
      level: 1,
      category: 'html',
      choice_one: '<ol>',
      choice_two: '<ul>',
      choice_three: '<nl>',
      choice_four: '<li>',
      question: 'Which HTML tag is used for a numbered list?',
      correct_answer: '<ol>',
    });
  });

  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/javascript');
    expect(res.body[0]).toEqual({
      id: '11',
      level: 1,
      category: 'javascript',
      choice_one: 'pop()',
      choice_two: 'shift()',
      choice_three: 'peek()',
      choice_four: 'reduce()',
      question:
        'Which method is used to take the last element off of a given array?',
      correct_answer: 'pop()',
    });
  });

  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/css');
    expect(res.body[0]).toEqual({
      id: '1',
      level: 1,
      category: 'css',
      choice_one: 'content, padding, border, margin',
      choice_two: 'border, content, margin, padding',
      choice_three: 'outside, inside, body, border',
      choice_four: 'body, border, inside, outside',
      question: 'What are the properties of the box model, in order?',
      correct_answer: 'content, padding, border, margin',
    });
  });

  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/react');
    expect(res.body[0]).toEqual({
      id: '16',
      level: 1,
      category: 'react',
      choice_one: 'props',
      choice_two: 'genes',
      choice_three: 'state',
      choice_four: 'child',
      question:
        'Which of the following is used to pass data from a parent component to its children?',
      correct_answer: 'props',
    });
  });

  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/node');
    expect(res.body[0]).toEqual({
      id: '26',
      level: 1,
      category: 'node',
      choice_one: '$ npm install express',
      choice_two: '$ node install express',
      choice_three: '$ install express',
      choice_four: 'none of these',
      question:
        'Which of the following command is used to install the Node.js express module?',
      correct_answer: '$ npm install express',
    });
  });

  // Change test per test category
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/express');
    expect(res.body[0]).toEqual({
      id: '21',
      level: 1,
      category: 'express',
      choice_one: 'cookie',
      choice_two: 'cookies',
      choice_three: 'cookie-parser',
      choice_four: 'none of these',
      question:
        'Which of the following is a middleware that parses cookies attached to the client request object?',
      correct_answer: 'cookie-parser',
    });
  });
  
  it('should return the list of quiz questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/dsna');
    expect(res.body[0]).toEqual({
      id: '31',
      level: 1,
      category: 'dsna',
      choice_one: 'int arr;',
      choice_two: 'int arr[10];',
      choice_three: 'arr{10};',
      choice_four: 'none of these',
      question:
        'For declaring an array, which of the following ways is correct?',
      correct_answer: 'int arr[10];',
    });
  });
});
