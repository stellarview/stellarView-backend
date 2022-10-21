DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS question_choices CASCADE;

CREATE TABLE users (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  username VARCHAR UNIQUE,
  email VARCHAR UNIQUE,
  password_hash VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  completed_categories VARCHAR[] DEFAULT ARRAY[]::VARCHAR[],
  total_points INT DEFAULT 0
);

CREATE TABLE questions (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  category VARCHAR,
  level INT,
  question VARCHAR,
  correct_answer VARCHAR NOT NULL
);

CREATE TABLE question_choices (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  questions_id BIGINT,
  choice_one VARCHAR NOT NULL,
  choice_two VARCHAR NOT NULL,
  choice_three VARCHAR,
  choice_four VARCHAR,
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO users 
(username, email, password_hash, completed_categories, total_points)
VALUES
('TestUser', 'testuser23@example.com', '$2b$10$eY3Akf8nRv0dQHO4o8.8FubY2O7ArGhQ/fjj50T2QuX.wyyeC7w0e', array['html_one'], 5);

INSERT INTO questions
(category, level, question, correct_answer)
VALUES 
('css', 1, 'What are the properties of the box model, in order?', 'content, padding, border, margin'),
('css', 1, 'Which is the universal selector?', '*'),
('css', 1, '#container would select any element with an id of "container"', 'true'),
('css', 1, 'How would you target a <p> that`s within a <div>?', 'div p'),
('css', 1, 'How would you select an element with a class of container?', '.container'),

('html', 1, 'Which HTML tag is used for a numbered list?', '<ol>'),
('html', 1, 'HTML tags and elements are the same thing', 'false'),
('html', 1, 'Which of the following is an inline element?', '<span>'),
('html', 1, 'Which of the following is used to insert a line break?', '<br>'),
('html', 1, 'Which target attribute is used to specify that a link will open in a new window or tab?', '_blank'),

('javascript', 1, 'Which method is used to take the last element off of a given array?', 'pop()'),
('javascript', 1, 'Which statement is used to specify that a block of code will only be executed if a specified condition is true?', 'if'),
('javascript', 1, 'What are the different types of falsey in JavaScript?', 'all of these'),
('javascript', 1, 'What is JSON?', 'JavaScript Object Notation'),
('javascript', 1, 'Which boolean operator can be used in JavaScript?', 'all of these'),

('react', 1, 'Which of the following is used to pass data from a parent component to its children?', 'props'),
('react', 1, 'Which of the following is NOT an advantage of React?', 'it is a complete framework'),
('react', 1, 'Who was React developed by?', 'Facebook'),
('react', 1, 'What is JSX?', 'JavaScript XML'),
('react', 1, 'What is a higher-order component?', 'an advanced technique for reusing component logic'),

('express', 1, 'Which of the following is a middleware that parses cookies attached to the client request object?', 'cookie-parser'),
('express', 1, 'Which of the following command is used to check the current version of NPM?', 'npm --version'),
('express', 1, 'Which of the following method requests that the server accept the data enclosed in the request to modify an existing object identified by the URI?', 'PUT'),
('express', 1, 'Where are the captured values populated regarding the route parameters?', 'req.params'),
('express', 1, 'Express is a fast minimalist web _________ for node.', 'framework'),

('node', 1, 'Which of the following command is used to install the Node.js express module?', '$ npm install express'),
('node', 1, 'The Node.js modules can be exposed using:', 'exports'),
('node', 1, 'Which of the following types of applications can be built using Node.js?', 'all of these'),
('node', 1, 'Which of the following keyword is used to make properties and methods available outside the module file?', 'exports'),
('node', 1, 'What does NPM stand for?', 'Node Package Manager'),

('dsna', 1, 'For declaring an array, which of the following ways is correct?', 'int arr[10];'),
('dsna', 1, 'How can we describe an array in the best possible way?', 'container that stores the elements of similar types'),
('dsna', 1, 'Which one of the following is the process of inserting an element in the stack?', 'push'),
('dsna', 1, 'If the elements 1, 2, 3 and 4 are added in a stack, so what would be the order for the removal?', '4321'),
('dsna', 1, 'Which of the following data structure is linear type?', 'all of these'),

('css', 2, 'How to select the elements with the class name "example"?', '.example'),
('css', 2, 'The CSS property used to specify the transparency of an element is:', 'opacity'),
('css', 2, 'Which of the following is the correct syntax to link an external style sheet in the HTML file?', '<link rel=”stylesheet” href=”style.css” />'),
('css', 2, 'Which of the following CSS property defines the space between cells in a table?', 'border-spacing'),
('css', 2, 'Which of the following CSS Property controls how an element is positioned?', 'position'),

('html', 2, 'Which of the following is not an HTML5 tag?', '<slider>'),
('html', 2, 'How do we write comments in HTML?', '<!......>'),
('html', 2, 'Which of the following is not the element associated with the HTML table layout?', 'color'),
('html', 2, 'Which tag is used to create a dropdown in HTML Form?', '<select>'),
('html', 2, 'The <title> tag belongs where in your HTML ?', 'head'),

('javascript', 2, 'Which of the following is a ternary operator?', '?'),
('javascript', 2, 'Which of the following is a javascript data types?', 'all of these'),
('javascript', 2, 'What is the difference between == and ===?', '== compares values, === compares values and data types'),
('javascript', 2, 'Which of the following is the property that is triggered in response to JS errors?', 'onerror'),
('javascript', 2, 'Which of the following is not a valid JavaScript variable name?', '2names'),

('react', 2, 'What are the two ways to handle data in React?', 'state & props'),
('react', 2, 'React is a _____-based JavaScript framework', 'component'),
('react', 2, 'Webpack is a _____________', 'module bundler'),
('react', 2, 'In ReactJS, props can be used to transmit ________', 'all answers are correct'),
('react', 2, 'Which port is the default port where the webpack-dev-server will run?', '8080'),

('express', 2, 'Which of the following is NOT a type of Middleware?', 'all of these'),
('express', 2, 'Which of the following is NOT a third-party middleware:', 'Json'),
('express', 2, 'What are the steps used for Error Handling in Express.js?', 'all answers are correct'),
('express', 2, 'What functions are arguments available to Express JS?:', 'all of these'),
('express', 2, 'Express JS is written only in', ' JavaScript'),

('node', 2, 'Which of the following frameworks is used majorly in Node.js?', 'Express.js'),
('node', 2, 'Which of the following is the correct syntax to initiate the Node.js File?', 'node filename.js'),
('node', 2, 'What are the advantages of using promises instead of callbacks?', 'all of these'),
('node', 2, 'Where can Node.js be used?', 'all of these'),
('node', 2, 'Which of the following is a Node.js web application architecture?', 'all of these'),

('dsna', 2, 'Which data structure is mainly used for implementing the recursive algorithm?', 'stack'),
('dsna', 2, 'The minimum number of stacks required to implement a stack is __', '2'),
('dsna', 2, 'What is the maximum number of children that a node can have in a binary tree?', '2'),
('dsna', 2, 'A linear data structure in which insertion and deletion operations can be performed from both the ends is___', 'deque'),
('dsna', 2, 'The time complexity of enqueue operation in Queue is __', 'O(1)'),


('css', 3, 'How can CSS be integrated?', 'all of these'),
('css', 3, 'CSS classes can be applied to multiple elements, whereas ids can be applied to only one element.', 'true'),
('css', 3, 'How would you target all h2 and h3 elements in CSS?', 'h2 h3'),
('css', 3, 'Which of the following are types of selectors in CSS?', 'all of these'),
('css', 3, 'vh/vw is a CSS unit used to measure the height and width in percentage with respect to the viewport.', 'true'),

('html', 3, 'Which attribute specifies a unique alphanumeric identifier to be associated with an element?', 'id'),
('html', 3, 'What is the use of <hr/> tag in HTML?', 'to create horizontal rule between sections'),
('html', 3, 'How to create a checkbox in HTML Form?', '<input type=”checkbox”>'),
('html', 3, 'What is DOM in HTML?', 'convention for representing and interacting with objects in html documents'),
('html', 3, 'The <!DOCTYPE html> tag is considered an HTML tag.', 'false'),

('javascript', 3, 'What is the difference between null and undefined?', 'absence of value; uninitialized variable'),
('javascript', 3, 'A promise is an object that represents eventual completion (or failure) of an asynchronous operation.', 'true'),
('javascript', 3, 'What are the variable naming conventions in javaScript?', 'all of these'),
('javascript', 3, 'An operator is a plain JS function passed to some method as an argument or option.', 'false'),
('javascript', 3, 'How can you create an Array in JS?', 'var x = [];'),

('react', 3, 'In React Router v6, which of these is deprecated?', 'Switch'),
('react', 3, 'What syntax is used in React to create a `portal`?', '{}'),
('react', 3, 'How would you update the state of a component?', 'setState()'),
('react', 3, 'What is an arrow function and how is it used?', 'a shortened way of writing a function'),
('react', 3, 'Redux forms can:', 'all of these'),

('express', 3, 'In ExpressJS there are two ways used for configuring the properties, with process.ENV and with require.js.', 'true'),
('express', 3, 'What is the use of Next in ExpressJS?', 'it passes management to a consecutive matching route'),
('express', 3, 'Why do we use ExpressJS?', 'all of these'),
('express', 3, 'WHat does REST stand for?', 'REpresentational State Transfer'),
('express', 3, 'CRUD route methods are a combination of these:', 'GET, POST, PUT, DELETE'), 

('node', 3, '___is an advantage of using Node.js.', 'all of these'),
('node', 3, 'Front-end refers to the server-side of an application, where back-end refers to the client-side of an application.', 'false'),
('node', 3, 'Which of the following development technologies are for the back-end?', 'all of these'),
('node', 3, 'Modules are like JavaScript libraries that can be used in a Node.js application to include a set of functions.', 'true'),
('node', 3, 'What are the most commonly used libraries in Node.js?', 'Express and Mongoose'),

('dsna', 3, 'The first index position of an array is always', '0'),
('dsna', 3, 'const newArray = array.splice() will return', 'newArray with spliced values'),
('dsna', 3, 'Concatenation can', 'merge arrays, strings and objects'),
('dsna', 3, 'In arrays, every() does what?', 'checks if all array values pass a test'),
('dsna', 3, 'Array.toString(["Banana", "Pineapple", "Drew Carey"]) returns', '"Banana,Pineapple,Drew Carey"');

INSERT INTO question_choices 
(questions_id, choice_one, choice_two, choice_three, choice_four)
VALUES 
(1, 'content, padding, border, margin', 'border, content, margin, padding', 'outside, inside, body, border', 'body, border, inside, outside'),
(2, '*', 'all', 'universal', '#'),
(3, 'true', 'false', '', ''),
(4, 'div p', 'div, p', '#p', 'p div'),
(5, '.container', '#container', '*container', 'container.'),

(6, '<ol>', '<ul>', '<nl>', '<li>'),
(7, 'false', 'true', '', ''),
(8, '<span>', '<body>', '<div>', '<p>'),
(9, '<br>', '<break>', '<b>', '<lb>'),
(10, '_blank', '_self', '_parent', '_top'),

(11, 'pop()', 'shift()', 'peek()', 'reduce()'),
(12, 'if', 'else', 'select', 'while'),
(13, 'all of these', 'null, false, NaN', '0, -0, ''''''', 'undefined'),
(14, 'JavaScript Object Notation', 'JavaScript Server-Oriented Notation', 'Java Simplex Optimized Notation', 'Joint Server Object Notation'),
(15, 'all of these', '||', '!', '&&'),

(16, 'props', 'genes', 'state', 'child'),
(17, 'it is a complete framework', 'it allows reusable components', 'it utilizes the virtual DOM', 'it increases performance'),
(18, 'Facebook', 'Google', 'Amazon', 'JavaScript'),
(19, 'JavaScript XML', 'JSON X', 'Java Server Xperience', 'JSON.stringify(express)'),
(20, 'an advanced technique for reusing component logic', 'a component that exists above another component', 'a component that passes data from parent to child', 'a component that reuses code'),

(21, 'cookie', 'cookies', 'cookie-parser', 'none of these'),
(22, 'nmp --ver', 'npm --version', 'npm help', 'none of these'),
(23, 'GET', 'DELETE', 'PUT', 'POST'),
(24, 'req.data', 'app.locals', 'req.params', 'all of these'),
(25, 'framework', 'library', 'database', 'function'),

(26, '$ npm install express', '$ node install express', '$ install express', 'none of these'),
(27, 'expose', 'module', 'exports', 'all of these'),
(28, 'web application', 'chat application', 'RESTful service', 'all of these'),
(29, 'import', 'module', 'exports', 'require'),
(30, 'Node Package Manager', 'Node Packet Modifier', 'Node Parser Manager', 'none of these'),

(31, 'int arr;', 'int arr[10];', 'arr{10};', 'none of these'),
(32, 'the array shows a hierarchical structure', 'arrays are immutable', 'container that stores the elements of similar types', 'the array is not a data structure'),
(33, 'insert', 'add', 'push', 'none of these'),
(34, '1234', '2134', '4321', 'none of these'),
(35, 'strings', 'lists', 'queues', 'all of these'),

(36, 'example', '#example', '.example', 'class example'),
(37, 'hover', 'opacity', 'clearfix', 'overlay'),
(38, '<link rel=”stylesheet” href=”style.css” />', '<link rel=”stylesheet” src=”style.css” />', '<style rel=”stylesheet” src=”style.css” />', '<style rel=”stylesheet” link=”style.css” />'),
(39, 'border-spacing', 'border-style', 'border', 'none of these'),
(40, 'a function with arrows', 'a shortened way of writing a function', 'a short function', 'a pointy function'),

(41, '<track>', '<video>', '<slider>', '<source>'),
(42, '</.......>', '<!......>', '</....../>', '<.......!>'),
(43, 'alignment', 'color', 'size', 'spanning'),
(44, '<input>', '<select>', '<text>', '<textarea>'),
(45, 'head', 'arm', 'body', 'none of these'),

(46, '?', ';', '-', '+'),
(47, 'null', 'undefined', 'number', 'all of these'),
(48, 'there is no difference', '== compares data types and values, === compares values', '== compares values, === compares values and data types', '== assigns values, === compares just values'),
(49, 'onclick', 'onerror', 'onmessage', 'onexception'),
(50, '2names', 'first_last_names', 'firstAndLast', ' none of these'),

(51, 'services & components', 'state & props', 'state & services', 'state & component'),
(52, 'class', 'package', 'component', 'module'),
(53, 'module bundler', 'transpiler to transpile all javascript into 1 file', 'runs local dev server', 'none of these'),
(54, 'component properties', 'component event handlers', 'all answers are correct', 'no answers are correct'),
(55, '3000', '8080', '3306', '8000'),

(56, 'error-handling middleware', 'built-in middleware', 'third-party middleware', 'all of these'),
(57, 'json', 'cookie-parser', 'sequelize', 'cors'),
(58, 'create a middleware', 'install error handler middleware', 'all answers are correct', 'no answers are correct'),
(59, 'req', 'res', 'next', 'all of these'),
(60, 'JavaScript', 'C programming', 'C++', 'all of these'),

(61, 'JSON.js', 'CORS.js', 'Express.js', 'Curl.js'),
(62, 'filename.js', 'java script filename.js', 'node filename.js', 'node filename'),
(63, 'the control flow of asynchronous logic is more specified and structured', 'the coupling is low', 'built-in error handling', 'all of the above'),
(64, 'network application', 'server–client applications', 'responsive web apps', 'all of these'),
(65, 'client layer', 'server layer', 'data layer', 'all of these'),

(66, 'queue', 'stack', 'binary tree', 'linked list'),
(67, '1', '2', '3', '4'),
(68, '3', '1', '4', '2'),
(69, 'queue', 'deque', 'priority queue', 'circular queue'),
(70, 'O(1)', 'O(n)', 'O(logn)', 'O(nlogn)'),

(71, 'all of these', 'in-line', 'import', 'external style sheet'),
(72, 'true', 'false', '', ''),
(73, 'H2, h3', 'h2 + h3', 'h2 h3', 'h3, h2'),
(74, 'element type selector', 'class selector', 'universal selector', 'all of these'),
(75, 'true', 'false', '', ''),

(76, 'type', 'article', 'id', 'class'),
(77, 'for making content appearance italics', 'to create vertical rule between sections', 'to create a line break', 'to create horizontal rule between sections'),
(78, '<input type=”text”>', '<input type=”textarea”>', '<input type=”checkbox”>', '<input type=”button”>'),
(79, 'language dependent application programming', 'hierarchy of objects in ASP.NET', 'all of these', 'convention for representing and interacting with objects in html documents'),
(80, 'true', 'false', '', ''),

(81, 'they are the same', 'uninitialized value; absence of value', 'absence of value; uninitialized variable', 'none of these'),
(82, 'true', 'false', '', ''),
(83, 'you should not use the JavaScript reserved keywords as a variable name (ie:boolean)', 'variable names should not start with a numeral(0-9), they must begin with a letter or underscore.', 'all of these', 'variable names are case sensitive.'),
(84, 'true', 'false', '', ''),
(85, 'var x = [];', 'var x = ''array'';', 'var x = {};', 'none of these'),

(86, 'Link', 'Route', 'Switch', 'Router'),
(87, '{}', '[]', '??', '()'),
(88, 'setProps()', 'setState()', 'updateState()', 'handleState()'),
(89, 'static', 'alwaysSet()', 'mutable', 'doNotChange'),
(90, 'field value persistence via Redux store', 'validate (sync/async) and submit', 'format, pare, and normalize field values', 'all of these'),

(91, 'true', 'false', '', ''),
(92, 'it passes management to a consecutive matching route', 'it represents the request and the response objects', 'it handles errors', 'none of these'),
(93, 'creates faster and smarter web applications', 'simple and minimal', 'flexible and scalable', 'all of these'),
(94, 'REpresentational State Transfer', 'REsource Server Timeout', 'REpresentational Server Testing', 'REpresentational Sorting Technique'),
(95, 'GET, POST,  PUT, DELETE', 'PUSH, PUT, PULL, DELETE', 'GET, PUSH, PUT, DELETE', 'all of these'),

(96, 'asynchronous', 'unified programming language and data type', 'generally fast', 'all of these'),
(97, 'true', 'false', '', ''),
(98, 'Java', 'Python', 'Node.js', 'all of these'),
(99, 'true', 'false', '', ''),
(100, 'Express and Mongoose', 'Express and React', ' Mongoose and Angular', 'Java and Express'),

(101, '0', '1', '1st', '-1'),
(102, 'newArray without spliced items', 'newArray with spliced values', 'newArray with no values', 'newArray with parsed values'),
(103, 'merge two unrelated arrays', 'merge arrays, strings and objects', 'seperate one array into multiple arrays', 'turn multi-property objects to strings'),
(104, 'is an iterator object that contains value pairs for every array value', 'creates an array with sub-array elements concatenated', 'checks if all array values pass a test', 'is used in place of loops when iterating through each array value'),
(105, '"Banana,Pineapple,Drew Carey"', '"Banana, Pineapple, Drew Carey"', '{ "Banana", "Pineapple", "Drew Carey" }', '{"Banana, Pineapple, Drew Carey"}');
