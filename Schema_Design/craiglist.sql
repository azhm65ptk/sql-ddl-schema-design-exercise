-- in terminal
-- please  type '  psql < craiglist.sql '
--then 'psql'
--then ' \c craigslist'

DROP DATABASE IF EXISTS craiglist;
CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE Regions(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);


CREATE TABLE Users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(25)  NOT NULL,
    preferred_region_id INTEGER REFERENCES Regions ON DELETE CASCADE
);


CREATE TABLE Posts(
    id SERIAL PRIMARY KEY, 
    title TEXT(200)  NOT NULL, 
    description TEXT NOT NULL,
    location VARCHAR(50),
    user_id INTEGER REFERENCES Users ON DELETE CASCADE,
    region_id INTEGER REFERENCES Regions ON DELETE CASCADE,
    category_id INTEGER REFERENCES Categories ON DELETE CASCADE
);