DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  specialty TEXT
);

INSERT INTO doctors (first_name, last_name, specialty)
	VALUES ('Chad', 'Doktor', 'Doctoring');
 
CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  dob DATE NOT NULL
);

INSERT INTO patients (first_name, last_name, dob)
	VALUES ('Si', 'Cly', '2020-5-2');

CREATE TABLE diseases
(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	gestation_time INTEGER NOT NULL,
	type TEXT NOT NULL
);

INSERT INTO diseases (name, gestation_time, type)
	VALUES ('Rona', '4', 'deadly');

CREATE TABLE diagnoses 
(
  id SERIAL PRIMARY KEY,
  diagnose_date DATE NOT NULL,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO diagnoses (diagnose_date, patient_id, disease_id)
	VALUES ('2023-7-28', 1,1);

CREATE TABLE assignments 
(
  id SERIAL PRIMARY KEY,
  assignment_date DATE NOT NULL,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE
);

INSERT INTO assignments (assignment_date, patient_id, doctor_id)
	VALUES ('2000-7-28', 1,1);
	
DELETE FROM doctors WHERE id = 1;
SELECT * FROM doctors;
SELECT * FROM patients;
SELECT * FROM diseases;
SELECT * FROM diagnoses;
SELECT * FROM assignments;