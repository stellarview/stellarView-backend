const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

jest.mock('../lib/utils/github');

const agent = request.agent(app);

describe('backend-express-template routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  afterAll(() => {
    pool.end();
  });
  it('#GET should redirect user to the verification route', async () => {
    const response = await agent
      .get('/api/v1/github/callback?code=42')
      .redirects(1);
    // console.log('redirect', redirect);
    console.log(response.body);
    // expect(response.status).toBe(200);
    expect(response.body).toEqual({
      id: expect.any(String),
      username: 'fake_github_user',
      email: 'test@example.com',
      exp: expect.any(Number),
      iat: expect.any(Number)
    });
  });
});
