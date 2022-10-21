# stellarView

stellarView is a ....


- [Live Deploy](https://stellarview.netlify.app/welcome)
- [Frontend Repository](https://github.com/stellarview/stellarView-frontend)
- [Miro Board](https://miro.com/app/board/uXjVPO8zL6Q=/?share_link_id=58126108903)  

## Team Members

| **Project Team**              | **GitHub**                                | **LinkedIn**                                                   |
| ----------------------------- | ------------------------------------------| ---------------------------------------------------------------|
| Aaron Enyetu (he/him)         | [Github](https://github.com/aaronEnyetu)  | [LinkedIn](https://www.linkedin.com/in/aaron-enyetu/)          |
| Austin Han (he/him)           | [Github](https://github.com/austinbhan)   | [LinkedIn](https://www.linkedin.com/in/austin-han-740a69157/)  |
| Jenna Graham (she/her)        | [Github](https://github.com/jenna-graham) | [LinkedIn](https://www.linkedin.com/in/jenna-lee-graham)       |
| Kashi Tamang (they/them)      | [Github](https://github.com/kashitamang)  | [LinkedIn](https://www.linkedin.com/in/kashitamang)            |
| Brien Thomas (he/him)         | [Github](https://github.com/briensthomas) | [LinkedIn](https://www.linkedin.com/in/brien-thomas)           |
| Kat Zaro (she/her)            | [GitHub](https://github.com/kathrynzaro)  | [LinkedIn](https://www.linkedin.com/in/katzaro)                |

## Backend API

#### User Routes

- `POST /api/v1/users/`
- `POST /api/v1/users/session`
- `GET /api/v1/users/me`
- `DELETE /api/v1/users/session`

#### Quiz Routes

- `GET /api/v1/quiz/:category/:level`
- `GET /api/v1/quiz`

### Creating a new database

| command                                                   | description                                                                         |
| ----------------------                                    | ----------------------------------------------------------------------------------- |
| `cd ~`                                                    | Navigate to root directory |
| `cd ../..`                                                |           
| **Windows**                                               | Commands for Windows
| `cd C:\Program Files\PostgreSQL\14\bin\`                  | 
| `./createdb -U postgres YOUR_DB_NAME`                     |  
| **Mac**                                                   | Commands for Mac
| `cd /Applications/Postgres.app/Contents/Versions/14/bin`    
| `./createdb -U postgres YOUR_DB_NAME`                     
| `createdb -U postgres stellarView`                        
