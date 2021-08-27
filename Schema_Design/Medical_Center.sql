-- in terminal
-- please  type '  psql < Medical_Center.sql '
--then 'psql'
--then ' \c med_center'

DROP DATABASE IF EXISTS med_center;
CREATE DATABASE med_center;

\c med_center;

CREATE TABLE Doctors(
    d_id SERIAL PRIMARY KEY,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL
);


CREATE TABLE Patients(
    id SERIAL PRIMARY KEY,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    DOB DATE NOT NULL
);

CREATE TABLE Diseases(
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE Visit(
    id SERIAL PRIMARY KEY,
    doc_id INTEGER REFERENCES Doctors ON DELETE CASCADE,
    p_id INTEGER REFERENCES Patients ON DELETE CASCADE,
    visit_date DATE NOT NULL
);

CREATE TABLE Diaganosis(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES Visit ON DELETE CASCADE,
    disease_id INTEGER REFERENCES Diseases ON DELETE CASCADE,
    description TEXT NOT NULL
);

