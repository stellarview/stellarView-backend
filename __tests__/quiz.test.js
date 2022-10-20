/* eslint-disable no-useless-escape */
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

  it('should return the list of html level 1 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/html/1');

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

  it('should return the list of html level 2 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/html/2');

    expect(res.body[0]).toEqual({
      id: '41',
      level: 2,
      category: 'html',
      choice_one: '<track>',
      choice_two: '<video>',
      choice_three: '<slider>',
      choice_four: '<source>',
      question: 'Which of the following is not an HTML5 tag?',
      correct_answer: '<slider>',
    });
  });

  it('should return the list of html level 3 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/html/3');

    expect(res.body[0]).toEqual({
      id: '76',
      level: 3,
      category: 'html',
      choice_one: 'type',
      choice_two: 'article',
      choice_three: 'id',
      choice_four: 'class',
      question: 'Which attribute specifies a unique alphanumeric identifier to be associated with an element?',
      correct_answer: 'id',
    });
  });

  // Change test per test category
  it('should return the list of javascript level 1 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/javascript/1');

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
  
  it('should return the list of javascript level 2 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/javascript/2');

    expect(res.body[0]).toEqual({
      id: '46',
      level: 2,
      category: 'javascript',
      choice_one: '?',
      choice_two: ';',
      choice_three: '-',
      choice_four: '+',
      question:
        'Which of the following is a ternary operator?',
      correct_answer: '?',
    });
  });

  it('should return the list of javascript level 3 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/javascript/3');
    
    expect(res.body[0]).toEqual({
      id: '81',
      level: 3,
      category: 'javascript',
      choice_one: 'they are the same',
      choice_two: 'uninitialized value; absence of value',
      choice_three: 'absence of value; uninitialized variable',
      choice_four: 'none of these',
      question:
        'What is the difference between null and undefined?',
      correct_answer: 'absence of value; uninitialized variable',
    });
  });

  // Change test per test category
  it('should return the list of css level 1 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/css/1');

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

  it('should return the list of css level 2 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/css/2');
    
    expect(res.body[0]).toEqual({
      id: '36',
      level: 2,
      category: 'css',
      choice_one: 'example',
      choice_two: '#example',
      choice_three: '.example',
      choice_four: 'class example',
      // The return from PostgresQL DB was inserting "\" around the literal quotes
      question: expect.any(String),
      correct_answer: '.example',
    });
  });
  
  it('should return the list of css level 3 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/css/3');
    
    expect(res.body[0]).toEqual({
      id: '71',
      level: 3,
      category: 'css',
      choice_one: 'all of these',
      choice_two: 'in-line',
      choice_three: 'import',
      choice_four: 'external style sheet',
      question: 'How can CSS be integrated?',
      correct_answer: 'all of these',
    });
  });

  // Change test per test category
  it('should return the list of react level 1 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/react/1');
    
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
  
  it('should return the list of react level 2 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/react/2');
    
    expect(res.body[0]).toEqual({
      id: '51',
      level: 2,
      category: 'react',
      choice_one: 'services & components',
      choice_two: 'state & props',
      choice_three: 'state & services',
      choice_four: 'state & component',
      question:
        'What are the two ways to handle data in React?',
      correct_answer: 'state & props',
    });
  });

  it('should return the list of react level 3 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/react/3');
    
    expect(res.body[0]).toEqual({
      id: '86',
      level: 3,
      category: 'react',
      choice_one: 'Link',
      choice_two: 'Route',
      choice_three: 'Switch',
      choice_four: 'Router',
      question:
        'In React Router v6, which of these is deprecated?',
      correct_answer: 'Switch',
    });
  });

  // Change test per test category
  it('should return the list of node level 1 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/node/1');
    
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
 
  it('should return the list of node level 2 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/node/2');
    
    expect(res.body[0]).toEqual({
      id: '61',
      level: 2,
      category: 'node',
      choice_one: 'JSON.js',
      choice_two: 'CORS.js',
      choice_three: 'Express.js',
      choice_four: 'Curl.js',
      question:
        'Which of the following frameworks is used majorly in Node.js?',
      correct_answer: 'Express.js',
    });
  });
 
  it('should return the list of node level 3 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/node/3');
    
    expect(res.body[0]).toEqual({
      id: '96',
      level: 3,
      category: 'node',
      choice_one: 'asynchronous',
      choice_two: 'unified programming language and data type',
      choice_three: 'generally fast',
      choice_four: 'all of these',
      question:
        '___is an advantage of using Node.js.',
      correct_answer: 'all of these',
    });
  });

  // Change test per test category
  it('should return the list of express level 1 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/express/1');
    
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
   
  it('should return the list of express level 2 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/express/2');
    
    expect(res.body[0]).toEqual({
      id: '56',
      level: 2,
      category: 'express',
      choice_one: 'error-handling middleware',
      choice_two: 'built-in middleware',
      choice_three: 'third-party middleware',
      choice_four: 'all of these',
      question: 'Which of the following is NOT a type of Middleware?',
      correct_answer: 'all of these',
    });
  });
   
  it('should return the list of express level 3 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/express/3');
    
    expect(res.body[0]).toEqual({
      id: '91',
      level: 3,
      category: 'express',
      choice_one: 'true',
      choice_two: 'false',
      choice_three: null,
      choice_four: null,
      question:
      'In ExpressJS there are two ways used for configuring the properties, with process.ENV and with require.js.',
      correct_answer: 'true',
    });
  });

  it('should return the list of dsna level 1 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/dsna/1');

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
   
  it('should return the list of dsna level 2 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/dsna/2');
    
    expect(res.body[0]).toEqual({
      id: '66',
      level: 2,
      category: 'dsna',
      choice_one: 'queue',
      choice_two: 'stack',
      choice_three: 'binary tree',
      choice_four: 'linked list',
      question:
      'Which data structure is mainly used for implementing the recursive algorithm?',
      correct_answer: 'stack',
    });
  });
   
  it('should return the list of dsna level 3 questions', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/quiz/dsna/3');
    
    expect(res.body[0]).toEqual({
      id: '101',
      level: 3,
      category: 'dsna',
      choice_one: '0',
      choice_two: '1',
      choice_three: '1st',
      choice_four: '-1',
      question: 'The first index position of an array is always',
      correct_answer: '0',
    });
  }); 
});
