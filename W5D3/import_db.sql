
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;



CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)   
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Candice', 'Sener'), 
    ('Jason', 'Park');

INSERT INTO
    questions (title, body, author_id)
VALUES  
    ('favorite city', 'What''s your favorite city?', 
    ( SELECT id FROM users WHERE fname = 'Jason' AND lname = 'Park'
    ) ), 
    ('favorite food', 'What''s your favorite food?',
    ( SELECT id FROM users WHERE fname = 'Candice' AND lname = 'Sener'
    ));
 
INSERT INTO 
    question_follows (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE questions.title = 'favorite city'),
    (SELECT id FROM users WHERE users.fname = 'Jason' AND users.lname = 'Park')
    ),
    ((SELECT id FROM questions WHERE questions.title = 'favorite food'),
    (SELECT id FROM users WHERE users.fname = 'Candice' AND 
    users.lname = 'Sener')
    );

INSERT INTO
    replies (question_id, parent_reply_id, author_id, body)
VALUES
    ((SELECT id FROM questions WHERE questions.title = 'favorite city'),
    NULL,
    (SELECT id FROM users WHERE users.fname = 'Jason' AND users.lname = 'Park'),
    'My favorite city in the world is Tokyo.'),
    ((SELECT id FROM questions WHERE questions.title = 'favorite food'),
    NULL,
    (SELECT id FROM users WHERE users.fname = 'Candice' AND users.lname = 'Sener'),
    'My favorite food is Pizza.'
    );


INSERT INTO
    question_likes (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE users.fname = 'Jason' AND users.lname = 'Park'),
    (SELECT id FROM questions WHERE questions.title = 'favorite city')
    );