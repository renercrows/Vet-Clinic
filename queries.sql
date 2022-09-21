/*Queries that provide answers to the questions from all projects.*/

/* Monday */

SELECT * FROM animal WHERE name LIKE '%mon';
SELECT name FROM animal WHERE date_of_birth BETWEEN '2016/01/01' AND '2019/12/31';
SELECT name FROM animal WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animal WHERE weight_kg > 10.5;
SELECT * FROM animal WHERE neutered = true;
SELECT * FROM animal WHERE name != 'Gabumon';
SELECT * FROM animal WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Tuesday */

BEGIN;
UPDATE animal
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animal
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animal
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
DELETE FROM animal;
ROLLBACK;

BEGIN;
DELETE FROM animal WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_animal;
SELECT * FROM animal; 
UPDATE animal
SET weight_kg = weight_kg * -1;
SELECT * FROM animal; 
ROLLBACK TO delete_animal;
UPDATE animal
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animal;
COMMIT;

SELECT COUNT(*) FROM animal;
SELECT COUNT(*) FROM animal WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animal;
SELECT neutered, AVG(escape_attempts) AS average_escapes FROM animal GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animal GROUP BY species;
SELECT AVG(escape_attempts) FROM animal WHERE date_of_birth BETWEEN 'January 1, 1990' AND ' December 31, 2000';

/* Wednesday */

SELECT name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT COUNT(*), species.name AS species FROM animals JOIN species ON species_id = species.id GROUP BY species.name;
SELECT animals.name AS digimons_name, owners.full_name AS owner_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.species_id = 2 AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT full_name, COUNT(full_name) AS owns FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY full_name ORDER BY owns DESC LIMIT 1;