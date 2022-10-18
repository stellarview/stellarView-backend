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
INSERT INTO users 
(username, email, password_hash, completed_categories, total_points)
VALUES
('TestUser', 'testuser23@example.com', '$2b$10$eY3Akf8nRv0dQHO4o8.8FubY2O7ArGhQ/fjj50T2QuX.wyyeC7w0e', array['html_one'], 5);

-- Inserts for questions


INSERT INTO questions
(category, level, question, correct_hash)
VALUES 
('css', 1, 'What are the properties of the box model, in order?', 'hashed: content, padding, border, margin'),
('css', 1, 'Which is the univeral selector?', '*'),
('css', 1, '#container would select any element with an id of "container"', 'TRUE'),
('css', 1, 'How would you target a <p> that`s within a <div>?', 'div p'),
('css', 1, 'How would you select an element with a class of container?', '.container'),
('html', 1, 'Which HTML tag is used for a numbered list?', '<ol>'),
('html', 1, 'HTML tags and elements are the same thing', 'FALSE'),
('html', 1, 'Which of the following is an inline element?', '<span>'),
('html', 1, 'Which of the following is used to insert a line break?', '<br>'),
('html', 1, 'Which target attribute is used to specify that a link will open in a new window or tab?', '_blank'),
('javascript', 1, 'Which method is used to take the last element off of a given array?', 'pop()'),
('javascript', 1, 'Which statement is used to specify that a block of code will only be executed if a specified condition is true?', 'if'),
('javascript', 1, 'What are the different types of falsey in JavaScript?', 'All of these'),
('javascript', 1, 'What is JSON?', 'JavaScript Object Notation'),
('javascript', 1, 'Which boolean operator can be used in JavaScript?', 'All of these'),
('react', 1, 'Which of the following is used to pass data from a parent component to its children?', 'props'),
('react', 1, 'Which of the following is NOT an advantage of React?', 'It is a complete framework'),
('react', 1, 'Who was React developed by?', 'Facebook'),
('react', 1, 'What is JSX?', 'JavaScript XML'),
('react', 1, 'What is a higher-order component?', 'an advanced technique for reusing component logic');

-- Inserts for question choices

INSERT INTO question_choices 
(questions_id, choice_one, choice_two, choice_three, choice_four)
VALUES 
(1, 'content, padding, border, margin', 'margin, border, padding, content', 'outside, inside, body, border', 'body, border, inside, outside'),
(2, '*', 'all', 'universal', '#'),
(3, 'TRUE', 'FALSE', '', ''),
(4, 'div p', 'div, p', '#p', 'p div'),
(5, '.container', '#container', '*container', 'container.'),
(6, '<ol>', '<ul>', '<nl>', '<li>'),
(7, 'FALSE', 'TRUE', '', ''),
(8, '<span>', '<body>', '<div>', '<p>'),
(9, '<br>', '<break>', '<b>', '<lb>'),
(10, '_blank', '_self', '_parent', '_top'),
(11, 'pop()', 'shift()', 'peek()', 'reduce()'),
(12, 'if', 'else', 'select', 'while'),
(13, 'All of these', 'Null, false, NaN', '0, -0, ''''''', 'undefined'),
(14, 'JavaScript Object Notation', 'JavaScript Server-Oriented Notation', 'Java Simplex Optimized Notation', 'Joint Server Object Notation'),
(15, 'All of these', '||', '!', '&&'),
(16, 'props', 'genes', 'state', 'child'),
(17, 'It is a complete framework', 'It allows reusable components', 'It utilizes the Virtual DOM', 'It increases performance'),
(18, 'Facebook', 'Google', 'Amazon', 'JavaScript'),
(19, 'JavaScript XML', 'JSON X', 'Java Server Xperience', 'JSON.stringify(express)'),
(20, 'an advanced technique for reusing component logic', 'a component that exists above another component', 'a component that passes data from parent to child', 'a component that reuses code');
