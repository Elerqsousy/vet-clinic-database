/* Populate database with sample data. */

INSERT INTO animals 
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
('Agumon', '20200203', 0, true, 10.23);

INSERT INTO animals 
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES
('Gabumon', '20181115', 2, true, 8),
('Pikachu', '20210107', 1, false, 15.04),
('Devimon', '20170512', 5, true, 11);


INSERT INTO animals
(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
('Charmander', '20200208', -11, false, 0),
('Plantmon', '20211115', -5.7, true, 2),
('Squirtle', '19930402', -12.13, false, 3),
('Angemon', '20050612', -45, true, 1),
('Boarmon', '20050607', 20.4, true, 7),
('Blossom', '19981013', 17, true, 3),
('Ditto', '20220514', 22, true, 4);

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

-- as I didn't notice that I have to put some weights as negative in the begining 
-- I inserted it first to the selected animals 
BEGIN;
UPDATE animals
SET weight_kg = weight_kg*-1
WHERE name IN ('Charmander', 'Plantmon', 'Squirtle', 'Angemon');
COMMIT;
-- then removed the negative here as instructed in the activiity
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '20220101';
SAVEPOINT sp1;
UPDATE animals
SET weight_kg = weight_kg*-1;
ROLLBACK TO sp1;
UPDATE animals
SET weight_kg = weight_kg*-1
WHERE weight_kg < 0;
COMMIT;
