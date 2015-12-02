DROP TABLE if exists users;
DROP TABLE if exists editors;
DROP TABLE if exists authors;
DROP TABLE if exists articles;
DROP TABLE if exists categories;

CREATE TABLE categories (
	id INTEGER PRIMARY KEY,
	name VARCHAR
); 

CREATE TABLE users (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	email VARCHAR
);

CREATE TABLE authors (
	user_id INTEGER REFERENCES users(id),
	user_email VARCHAR REFERENCES users(email)
);

CREATE TABLE editors (
	user_id INTEGER REFERENCES users(id),
);

CREATE TABLE articles (
	title VARCHAR, 
	content text, 
	date_created VARCHAR,
	latest_modify_date VARCHAR, 
	category_id INTEGER REFERENCES categories(id),
	author_id INTEGER REFERENCES authors(id),
	editor_id INTEGER REFERENCES editors(id),
):