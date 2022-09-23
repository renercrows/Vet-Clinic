/* Database schema to keep the structure of entire database. */

/* Monday */

CREATE TABLE animal (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

/* Tuesday */

ALTER TABLE animal ADD species VARCHAR(100); -- ALTER TABLE (species column added);

/* Wednesday */

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE animal ADD PRIMARY KEY(id);
ALTER TABLE animal DROP COLUMN species;
ALTER TABLE animal ADD species_id INT;
ALTER TABLE animal ADD CONSTRAINT fk_species_id FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animal ADD owner_id INT;
ALTER TABLE animal ADD CONSTRAINT fk_owner_id FOREIGN KEY(owner_id) REFERENCES owners(id);

/* Thursday */

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    vet_id INT NOT NULL,
    species_id INT NOT NULL,
    PRIMARY KEY (vet_id, species_id),
    CONSTRAINT FK_vets FOREIGN KEY (vet_id) REFERENCES vets (id),
    CONSTRAINT FK_species FOREIGN KEY (species_id) REFERENCES species (id)
);

CREATE TABLE visits (
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    visit_date DATE NOT NULL,
    CONSTRAINT fk_animal_id FOREIGN KEY(animal_id) REFERENCES animal(id),
    CONSTRAINT fk_vets_id FOREIGN KEY(vet_id) REFERENCES vets(id)
);