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
  correct_answer VARCHAR NOT NULL
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
('TestUser', 'testuser@example.com', '123456', array['html_one'], 5);

-- Inserts for questions


INSERT INTO questions
(category, level, question, correct_answer)
VALUES 
('css', 1, 'What are the properties of the box model, in order?', 'content, padding, border, margin'),
('css', 1, 'Which is the universal selector?', '*'),
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
('react', 1, 'What is a higher-order component?', 'an advanced technique for reusing component logic'),
('express', 1, 'Which of the following is a middleware that parses cookies attached to the client request object?', 'cookie-parser'),
('express', 1, 'Which of the following command is used to check the current version of NPM?', 'npm --version'),
('express', 1, 'Which of the following method requests that the server accept the data enclosed in the request to modify an existing object identified by the URI?', 'PUT'),
('express', 1, 'Where are the captured values populated regarding the route parameters?', 'req.params'),
('express', 1, 'Everything in react is:', 'component'),
('node', 1, 'Which of the following command is used to install the Node.js express module?', '$ npm install express'),
('node', 1, 'The Node.js modules can be exposed using:', 'exports'),
('node', 1, 'Which of the following types of applications can be built using Node.js?', 'All of these'),
('node', 1, 'Which of the following keyword is used to make properties and methods available outside the module file?', 'exports'),
('node', 1, 'What does NPM stand for?', 'Node Package Manager'),
('dsna', 1, 'For declaring an array, which of the following ways is correct?', 'int arr[10];'),
('dsna', 1, 'How can we describe an array in the best possible way?', 'Container that stores the elements of similar types'),
('dsna', 1, 'Which one of the following is the process of inserting an element in the stack?', 'Push'),
('dsna', 1, 'If the elements 1, 2, 3 and 4 are added in a stack, so what would be the order for the removal?', '4321'),
('dsna', 1, 'Which of the following data structure is linear type?', 'All of these'),
('css', 2, 'How to select the elements with the class name "example"?', '.example'),
('css', 2, 'The CSS property used to specify the transparency of an element is:', 'opacity'),
('css', 2, 'Which of the following is the correct syntax to link an external style sheet in the HTML file?', '<link rel=”stylesheet” href=”style.css” />'),
('css', 2, 'Which of the following CSS property defines the space between cells in a table?', 'border-spacing'),
('css', 2, 'Which of the following CSS Property controls how an element is positioned?', 'position'),
('html', 2, 'Which of the following is not a HTML5 tag?', ' <slider>'),
('html', 2, ' How do we write comments in HTML?', '<!......>'),
('html', 2, 'Which of the following is not the element associated with the HTML table layout?', 'color'),
('html', 2, 'Which tag is used to create a dropdown in HTML Form?', ' <select>'),
('html', 2, 'The <title> tag belongs where in your HTML ?', 'head'),
('javascript', 2, ' Which one of the following is a ternary operator:', '?'),
('javascript', 2, 'Which of the following is a javascript data types?', 'All of these'),
('javascript', 2, 'What is the difference between == and ===?', '== compares just values, === compares values and data types'),
('javascript', 2, 'Which of the following is the property that is triggered in response to JS errors?', 'onerror'),
('javascript', 2, 'Which of the following is not a valid JavaScript variable name?', '2names'),
('react', 2, 'What are the two ways to handle data in React?', 'State & Props'),
('react', 2, 'Everything in react is __________', 'component'),
('react', 2, 'Webpack command act as a _____________', '.module bundler'),
('react', 2, 'In ReactJS, props can be used to transmit ________', 'Both A and B are true.'),
('react', 2, 'Which port is the default port where the webpack-dev-server will run?', '8080'),
('express', 2, 'Which of the following is NOT a type of Middleware?', 'All of these'),
('express', 2, 'Which of the following is NOT a third-party middleware:', 'Json'),
('express', 2, 'What are the steps used for Error Handling in Express.js?', 'Both A and B'),
('express', 2, 'What functions are arguments available to Express JS?:', 'All of these'),
('express', 2, 'Express JS is written only in', ' JavaScript'),
('node', 2, 'Which of the following frameworks is used majorly in Node.js?', 'Express.js'),
('node', 2, 'Which of the following is the correct syntax to initiate the Node.js File?', 'node filename.js'),
('node', 2, 'What are the advantages of using promises instead of callbacks?', 'All of these'),
('node', 2, 'Where can Node.js be used?', 'All of these'),
('node', 2, 'Which of the following is a Node.js web application architecture?', 'All of these'),
('dsna', 2, 'Which data structure is mainly used for implementing the recursive algorithm?', 'Stack'),
('dsna', 2, 'The minimum number of stacks required to implement a stack is __', '2'),
('dsna', 2, 'What is the maximum number of children that a node can have in a binary tree?', '2'),
('dsna', 2, 'A linear data structure in which insertion and deletion operations can be performed from both the ends is___', 'Deque'),
('dsna', 2, 'The time complexity of enqueue operation in Queue is __', 'O(1)');
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
(20, 'an advanced technique for reusing component logic', 'a component that exists above another component', 'a component that passes data from parent to child', 'a component that reuses code'),
(21, 'cookie', 'cookies', 'cookie-parser', 'None of these'),
(22, 'nmp --ver', 'npm --version', 'npm help', 'None of these'),
(23, 'GET', 'DELETE', 'PUT', 'POST'),
(24, 'req.data', 'app.locals', 'req.params', 'All of these'),
(25, 'module', 'component', 'package', 'class'),
(26, '$ npm install express', '$ node install express', '$ install express', 'None of these'),
(27, 'expose', 'module', 'exports', 'All of these'),
(28, 'Web Application', 'Chat Application', 'RESTful Service', 'All of these'),
(29, 'import', 'module', 'exports', 'require'),
(30, 'Node Package Manager', 'Node Packet Modifier', 'Node Parser Manager', 'None of these'),
(31, 'int arr;', 'int arr[10];', 'arr{10};', 'None of these'),
(32, 'The Array shows a hierarchical structure', 'Arrays are immutable', 'Container that stores the elements of similar types', 'The Array is not a data structure'),
(33, 'Insert', 'Add', 'Push', 'None of these'),
(34, '1234', '2134', '4321', 'None of these'),
(35, 'Strings', 'lists', 'Queues', 'All of these'),

(36, 'example', '#example', '.example', 'class example'),
(37, 'hover', 'opacity', 'clearfix', 'overlay'),
(38, '<link rel=”stylesheet” href=”style.css” />', '<link rel=”stylesheet” src=”style.css” />', '<style rel=”stylesheet” src=”style.css” />', '<style rel=”stylesheet” link=”style.css” />'),
(39, 'border-spacing', 'border-style', 'border', 'None of these'),
(40, 'static', 'position', 'fix', 'set'),
(41, ' <track>', '<video>', '<slider>', '<source>'),
(42, '</.......>', '<!......>', '</....../>', '<.......!>'),
(43, 'alignment', ' color', 'size', 'spanning'),
(44, '<input>', '<select>', '<text>', '<textarea>'),
(45, 'head', 'arm', 'body', 'title'),
(46, '?', ';', '-', '+'),
(47, 'Null type', 'Undefined type', 'Number type', 'All of these'),
(48, 'They both mean equals, there is no difference', '== compares data types and values, === compares just values', ' == compares just values, === compares values and data types', '== assigns values, === compares values'),
(49, 'onclick', ' onerror', 'onmessage', ' onexception'),
(50, '2names', '  first_last_names', 'firstAndLast', ' None of these'),
(51, 'Services & Components', 'State & Props', 'State & Services', 'State & Component'),
(52, 'class', 'package', 'component', 'module'),
(53, 'module bundler', 'transpiler to transpile all javascript into 1 file', 'runs local dev server', 'None of these'),
(54, 'component properties', 'component event handlers', 'both A and B are true', ' None of these'),
(55, '3000', '8080', '3306', '8000'),
(56, ' Error-handling Middleware', 'Built-in Middleware', 'Third-party Middleware', 'All of these'),
(57, 'Json', 'Cookie-parser', 'Sequelize', 'Cors'),
(58, 'Create a Middleware', 'Install Error Handler Middleware', 'Both A and B', 'None of these'),
(59, ' Req', 'Res', ' Next', 'All of these'),
(60, 'JavaScript', ' C programming', ' C++', 'All of these'),
(61, 'Json.js', 'CORS.js', 'Express.js', 'Curl.js'),
(62, 'filename.js', 'java script filename.js', 'node filename.js', 'node filename'),
(63, 'The control flow of asynchronous logic is more specified and structured', 'The coupling is low', 'Built-in error handling', 'All of the above'),
(64, 'Network application', 'Server–Client applications', 'Responsive web apps', 'All of these'),
(65, 'Client Layer', ' Server Layer', 'Data Layer', 'All of these'),
(66, 'Queue', 'Stack', 'Binary tree', 'Linked list'),
(67, '1', '2', '3', '4'),
(68, '3', '1', '4', '2'),
(69, 'Queue', 'Deque', 'Priority queue', 'Circular queue'),
(70, 'O(1)', 'O(n)', 'O(logn)', 'O(nlogn)');
