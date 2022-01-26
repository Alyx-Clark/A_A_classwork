PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS questions_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL, 
    parent_id INTEGER,
    user_id INTEGER NOT NULL, 
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (parent_id) REFERENCES replies(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE questions_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (user_id) REFERENCES users(id)


);

INSERT INTO
    users(fname, lname)
VALUES
    ("yao", "xu"),
    ("alex", "clark");



INSERT INTO
    questions(title, body, author_id)
VALUES
    ("question_1", "body_1", (SELECT id FROM users WHERE fname = "yao" AND lname = "xu")),
    ("question_2", "body_2", (SELECT id FROM users WHERE fname = "alex" AND lname = "clark"));



INSERT INTO
    question_follows(users_id, questions_id)
VALUES
    (
        (SELECT id FROM users WHERE fname = "yao" AND lname = "xu"),
        (SELECT id FROM questions WHERE title = "question_1")
    ),
    (
        (SELECT id FROM users WHERE fname = "alex" AND lname = "clark"),
        (SELECT id FROM questions WHERE title = "question_2")
    );



INSERT INTO
    replies(question_id, parent_id, user_id, body)
VALUES
    (
        (SELECT id FROM questions WHERE title = "question_1"),
        (SELECT id FROM replies WHERE body = "body_1"),
        (SELECT id FROM users WHERE fname = "yao" AND lname = "xu"),
        ("body_1")
    ),
    (
        (SELECT id FROM questions WHERE title = "question_2"),
        (SELECT id FROM replies WHERE body = "body_2"),
        (SELECT id FROM users WHERE fname = "alex" AND lname = "clark"),
        ("body_2")
    );



INSERT INTO 
    questions_likes(question_id, user_id)
VALUES
    (
        (SELECT id FROM questions WHERE title = "question_1"),
        (SELECT id from users WHERE fname = "yao" AND lname = "xu")
    ),
    (
        (SELECT id FROM questions WHERE title = "question_2"),
        (SELECT id from users WHERE fname = "alex" AND lname = "clark")
    );