DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

--teams table with id, wins, losses, and name
CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  wins INTEGER NOT NULL,
  losses INTEGER NOT NULL
);
INSERT INTO teams (name, wins, losses)
	VALUES ('Clinton Clobereres', 0, 200);
	
--player table with id, first_name, last_name and team_id
CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

INSERT INTO players (first_name, last_name, team_id)
	VALUES ('Leif', 'Erikson', 1);
	
--referee table with id, first_name and last_name
CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);
INSERT INTO referees (first_name, last_name)
	VALUES ('Erik', 'Leifson');
	
--match table with id, date, home_team_id and away_team_id
CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  home_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
  away_team_id INTEGER REFERENCES teams  ON DELETE CASCADE
);
INSERT INTO matches (date, home_team_id, away_team_id)
	VALUES ('2020-2-2', 1, 1);
  
--goal table with id, match_id and player_id
CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  match_id INTEGER REFERENCES matches on DELETE CASCADE,
  player_id INTEGER REFERENCES players on DELETE CASCADE
);
INSERT INTO goals (match_id, player_id)
	VALUES (1,1);

--match_referee table with id, ref_id and match_id
CREATE TABLE match_referees
(
	id SERIAL PRIMARY KEY,
	ref_id INTEGER REFERENCES referees on DELETE CASCADE,
	match_id INTEGER REFERENCES matches ON DELETE CASCADE
);
INSERT INTO match_referees (ref_id, match_id)
	VALUES (1,1);
	
--season table with id, start_date and end_date
CREATE TABLE seasons
(
	id SERIAL PRIMARY KEY,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL
);
INSERT INTO seasons (start_date, end_date)
	VALUES ('2000-8-8', '2001-8-8');
	
SELECT * FROM teams;
SELECT * FROM players;
SELECT * FROM matches;
SELECT * FROM referees;
SELECT * FROM goals;
SELECT * FROM seasons;