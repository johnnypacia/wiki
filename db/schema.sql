DROP TABLE if exists categories;
DROP TABLE if exists edits;
DROP TABLE if exists users;
DROP TABLE if exists songs;

CREATE TABLE categories (
	id INTEGER PRIMARY KEY,
	name VARCHAR
);

CREATE TABLE edits (
	id INTEGER PRIMARY KEY,
	user_id INTEGER REFERENCES users(id),
	edit_content TEXT,
	song_id INTEGER REFERENCES songs(id),
	date_edited DATETIME
); 

CREATE TABLE users (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	email VARCHAR
);


CREATE TABLE songs (
	id INTEGER PRIMARY KEY,
	title VARCHAR,  
	date_created VARCHAR,
	user_id INTEGER REFERENCES users(id),
	edit_id INTEGER REFERENCES edits(id), 
	category_id INTEGER REFERENCES categories(id),
	content text
);