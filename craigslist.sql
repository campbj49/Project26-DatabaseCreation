DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

--region with id and name
CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
INSERT INTO regions (name)
	VALUES ('San Fran');
--user with id, first_name last_name, and preffered_region
CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  preffered_region_id INTEGER REFERENCES regions ON DELETE CASCADE
);

INSERT INTO users (first_name, last_name, preffered_region_id)
	VALUES ('John', 'Johnson', 1);

--categories with id and name

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO categories (name)
	VALUES ('Housing');

--post with id, title, text, user_id, location, category_id, and region_id
CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  user_id INTEGER REFERENCES users ON DELETE CASCADE,
  location TEXT NOT NULL,
  category_id INTEGER REFERENCES categories on DELETE CASCADE,
  region_id INTEGER REFERENCES regions ON DELETE CASCADE
);

INSERT INTO posts (title, content, user_id, location, category_id, region_id)
	VALUES ('Square house', 'door in front', 1, 'across the street', 1, 1);
	
SELECT * FROM regions;	
SELECT * FROM users;	
SELECT * FROM categories;	
SELECT * FROM posts;