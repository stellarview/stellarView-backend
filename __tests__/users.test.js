const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');
const UserService = require('../lib/services/UserService');

// Dummy user for testing
const mockUser = {
  username: 'User',
  email: 'test@example.com',
  password: '12345',
  completed_categories: ['html'],
  total_points: 0
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

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });

  it.skip('creates a new user', async () => {
    const res = await request(app).post('/api/v1/users').send(mockUser);
    const { username, email } = mockUser;

    expect(res.body).toEqual({
      id: expect.any(String),
      username,
      email,
      completed_categories: expect.any(Array), 
      total_points: expect.any(String)
    });
  });

  it.skip('get user by id, return all information about the user', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/users/1');
    expect(res.body).toEqual({
      id: expect.any(String),
      username: expect.any(String),
      email: expect.any(String),
      completed_categories: expect.any(Array),
      total_points: expect.any(String)
    });
  });

  it('should update a user', async () => {
    const updates = {
      completed_categories: 'css', 
      total_points: 10
    };

    const [agent] = await registerAndLogin();

    const res = await agent.patch('/api/v1/users/2').send(updates);
    expect(res.body.total_points).toEqual('10');
    expect(res.body.completed_categories).toEqual(['css']);

    const newUpdate = {
      completed_categories: 'react',
      total_points: 10
    };
    const secondUpdate = await agent.patch('/api/v1/users/2').send(newUpdate);

    expect(secondUpdate.body.total_points).toEqual('20');
    expect(secondUpdate.body.completed_categories).toEqual(['css', 'react']);

  });

  it('signs in an existing user with an email', async () => {
    await request(app).post('/api/v1/users').send(mockUser);
    const res = await request(app)
      .post('/api/v1/users/sessions')
      .send({ email: 'test@example.com', password: '12345' });
    expect(res.status).toEqual(200);
  });

  it.skip('signs in an existing user with a username', async () => {
    await request(app).post('/api/v1/users').send(mockUser);
    const res = await request(app)
      .post('/api/v1/users/sessions')
      .send({ username: 'User', password: '12345' });
    expect(res.status).toEqual(200);
  });

  it.skip('/protected should return a 401 if not authenticated', async () => {
    const res = await request(app).get('/api/v1/users/protected');
    expect(res.status).toEqual(401);
  });

  it.skip('/protected should return the current user if authenticated', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/users/protected');
    expect(res.status).toEqual(200);
  });

  it.skip('/users should return 401 if user not admin', async () => {
    const [agent] = await registerAndLogin();
    const res = await agent.get('/api/v1/users');
    expect(res.status).toEqual(403);
  });

  it.skip('/users should return 200 if user is admin', async () => {
    const agent = request.agent(app);

    // create a new user
    await agent.post('/api/v1/users').send({
      email: 'admin',
      password: '1234',
      username: 'admin',
      completed_categories: [],
      total_points: '0'
    });
    // sign in the user
    await agent
      .post('/api/v1/users/sessions')
      .send({ email: 'admin', password: '1234' });
    // const [agent] = await registerAndLogin({ email: 'admin' });
    const res = await agent.get('/api/v1/users');
    expect(res.status).toEqual(200);
  });

  it.skip('/users should return a 200 if user is admin', async () => {
    const [agent] = await registerAndLogin({ email: 'admin' });
    const res = await agent.get('/api/v1/users');
    expect(res.status).toEqual(200);
  });

  it.skip('DELETE /sessions deletes the user session', async () => {
    const [agent] = await registerAndLogin();
    const resp = await agent.delete('/api/v1/users/sessions');
    expect(resp.status).toBe(204);
  });
});
