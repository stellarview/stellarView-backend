const express = require('express');
const cookieParser = require('cookie-parser');
const app = express();
const cors = require('cors');

// Built in middleware
app.use(express.json());
app.use(cookieParser());

//cors origin credentials
app.use(
  cors({
    origin: [
      //port for frontend
      'http://localhost:7891',
      'http://127.0.0.1:7891',
      //deployed front-end goes here
      'https://stellarview.netlify.app',
    ],
    credentials: true,
  })
);

// App routes
app.use('/api/v1/users', require('./controllers/users'));

// Error handling & 404 middleware for when
// a request doesn't match any app routes
app.use(require('./middleware/not-found'));
app.use(require('./middleware/error'));

module.exports = app;
