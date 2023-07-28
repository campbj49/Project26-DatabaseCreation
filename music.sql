-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

--producers with id and names
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
INSERT INTO producers (name)
	VALUES ('Dust Brothers'), ('Stephen Lironi');


--artists with id and names
CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
INSERT INTO artists (name)
	VALUES ('Hanson');
	
--albums with id and titles
CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);
INSERT INTO albums(title)
	VALUES ('Middle of Nowhere');
	
--songs with id, title, duration, album, and  release date
CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums ON DELETE CASCADE
);
INSERT INTO songs (title, duration_in_seconds, release_date, album_id)
	VALUES ('MMMBop', 238, '04-15-1997',1);

--performances with id, song and artists
CREATE TABLE performances
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs on DELETE CASCADE,
  artist_id INTEGER REFERENCES artists on DELETE CASCADE
);
INSERT INTO performances (song_id, artist_id)
	VALUES (1, 1);
  
--productions with id, song_id and producer_id
CREATE TABLE productions
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs on DELETE CASCADE,
  producer_id INTEGER REFERENCES producers on DELETE CASCADE
);
INSERT INTO productions (song_id, producer_id)
	VALUES (1, 1), (1,2);

SELECT * from songs;
SELECT * from artists;
SELECT * from producers;
SELECT * from albums;

/*INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ( '{""}', '', '{"", ""}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
*/