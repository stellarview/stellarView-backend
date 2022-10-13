DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS question_choices CASCADE;
-- connect own DB

CREATE TABLE users (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  username VARCHAR,
  email VARCHAR,
  password_hash VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  completed_categories VARCHAR [],
  total_points BIGINT
);

-- table for questions

CREATE TABLE questions (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  category VARCHAR,
  level INT,
  question VARCHAR,
  correct_hash VARCHAR NOT NULL
);

-- table for question_choices

CREATE TABLE question_choices (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  questions_id BIGINT,
  choice_one VARCHAR NOT NULL,
  choice_two VARCHAR NOT NULL,
  choice_three VARCHAR DEFAULT NULL,
  choice_four VARCHAR DEFAULT NULL,
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

--  Inserts for Users
INSERT INTO users (username, email, password_hash, completed_categories, 
total_points)
  VALUES ('TestUser', 'testuser@example.com', '123456', array['html_one'], 5);

-- Inserts for questions


INSERT INTO questions(category, level, question, correct_hash)
VALUES ('Node.js', 1, 'What is a jwt?', 'JSON Web Token');


-- Inserts for question choices

INSERT INTO question_choices(questions_id, choice_one, choice_two, 
choice_three, choice_four)

VALUES (1, 'JSON Web Token', 'Jason Derulo', 'Julius Web Token',
 'James Webb Telescope');