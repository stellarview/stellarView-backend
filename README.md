# stellarView

stellarView is a ....


- [Deploy Site (Netlify)](#)
- [Deploy Site (Heroku)](https://stellar-view.herokuapp.com/)
- [Miro Board](https://miro.com/app/board/uXjVPO8zL6Q=/?share_link_id=58126108903)  

## Creating a new database

| command                                                   | description                                                                         |
| ----------------------                                    | ----------------------------------------------------------------------------------- |
| `cd ~`                                                    | starts the app - should only be used in production as changes will not get reloaded |
| `cd ../..`                                                | runs the app using `nodemon` which watches for changes and reloads the app          |
| `cd C:\Program Files\PostgreSQL\14\bin\`                  | rough file path to access the postgres bin file on **Windows**                      |  
| `./createdb -U postgres YOUR_DB_NAME`                     | runs the createdb file to create a new local DB wih Postgres                        |  
| `cd /Applications/Postgres.app/Contents/Versions/14/bin`  | rough file path to access the postgres bin file on **Mac**                          |  
| `./createdb -U postgres YOUR_DB_NAME`                     | runs the createdb file to create a new local DB wih Postgres                        |
| `createdb -U postgres stellarView`                        | creates the new database for the stellarView tables                                 |

## Team Members

| **Contributing Team Members** | **LinkedIn**                                                    | **GitHub**                                 |
| ----------------------------- | --------------------------------------------------------------- | -------------------------------------------|
| Aaron Enyetu (he/him)         | [LinkedIn](https://www.linkedin.com/in/aaron-enyetu/)           | [Github](https://github.com/aaronEnyetu)   |
| Austin Han (he/him)           | [LinkedIn](https://www.linkedin.com/in/austin-han-740a69157/)   | [Github](https://github.com/austinbhan)    |
| Jenna Graham (she/her)        | [LinkedIn](https://www.linkedin.com/in/jenna-lee-graham)        | [Github](https://github.com/jenna-graham)  |
| Kashi Tamang (they/them)      | [LinkedIn](https://www.linkedin.com/in/kashitamang)             | [Github](https://github.com/kashitamang)   |
| Brien Thomas (he/him)         | [LinkedIn](https://www.linkedin.com/in/brien-thomas)            | [Github](https://github.com/briensthomas)  |
| Kat Zaro (she/her)            | [LinkedIn]('https://www.linkedin.com/in/katzaro')               | [GitHub]('https://github.com/kathrynzaro') |

## Backend API

This app runs on a PostgreSQL database using Node.js/Express.

- [Main Deployment](https://tealab.herokuapp.com)
- [Staging Deployment](https://staged-tealab.herokuapp.com)

#### User Routes

- `POST /api/v1/users/`
- `POST /api/v1/users/session`
- `GET /api/v1/users/me`
- `DELETE /api/v1/users/session`

#### Question(?) Routes

- `POST /api/v1/`
- `GET /api/v1/`
- `GET /api/v1//:id`
- `PUT /api/v1//:id`
- `DELETE /api/v1//:id`

#### Do we need a third? Routes

- `GET /api/v1/`
- `GET /api/v1/`
- `GET /api/v1/`
- `GET /api/v1`
- `POST /api/v1/`
- `PATCH /api/v1//:id`
- `DELETE /api/v1//:id`

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