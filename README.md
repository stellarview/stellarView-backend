# Template for Backend Express

The Golden Rule:
🦸 🦸‍♂️ Stop starting and start finishing. 🏁

If you work on more than one feature at a time, you are guaranteed to multiply your bugs and your anxiety.

## Scripts

| command                            | description                                                                         |
| ----------------------             | ----------------------------------------------------------------------------------- |
| `npm start`                        | starts the app - should only be used in production as changes will not get reloaded |
| `npm run start:watch`              | runs the app using `nodemon` which watches for changes and reloads the app          |
| `npm test`                         | runs the tests once                                                                 |
| `npm run test:watch`               | continually watches and runs the tests when files are updated                       |
| `npm run setup-db`                 | sets up the database locally                                                        |
| `npm run setup-heroku`             | sets up the database on heroku                                                      |
| `createdb -U postgres stellarView` | creates the new database for the stellarView tables                                 |

## User Routes

## Controllers
    controller questions file
    controller for question_choices
    double check user model/controller for our expectations of the project

## Models

# Users:
- insert new user
- get all Users (admin)
- getByEmail
- getByUsername
- getPasswordHash

# Questions:
- getAll
- getByLevel
- getById(?)
- getCorrectHash

- Insert
- Update
- Delete

Question_Choices:
- 