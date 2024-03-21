-- Crée la base de données si elle n'existe pas déjà
CREATE DATABASE IF NOT EXISTS produitsco;
USE gestionMaterielsScolaires;

-- Crée la table 'materiels'
CREATE TABLE IF NOT EXISTS materiels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(10, 2) NOT NULL COMMENT 'Prix du matériel en euros',
    description TEXT,
    categorie VARCHAR(255) COMMENT 'Catégorie du matériel',
    stock INT NOT NULL COMMENT 'Quantité en stock',
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création de l’enregistrement',
    dateMiseAJour TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date de la dernière mise à jour de l’enregistrement'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crée la table 'clients'
CREATE TABLE IF NOT EXISTS clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    adresse TEXT,
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création du client',
    dateMiseAJour TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date de la dernière mise à jour du client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crée la table 'eleves'
CREATE TABLE IF NOT EXISTS eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    classe VARCHAR(50),
    ecole VARCHAR(255),
    idClient INT,
    dateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création de l’élève',
    dateMiseAJour TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date de la dernière mise à jour de l’élève',
    FOREIGN KEY (idClient) REFERENCES clients(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertion de données de démonstration dans 'clients'
INSERT INTO clients (nom, prenom, email, telephone, adresse) VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', '0123456789', '123 rue de Paris, 75001 Paris'),
('Martin', 'Alice', 'alice.martin@email.com', '9876543210', '456 avenue de la République, 75011 Paris');

-- Insertion de données de démonstration dans 'eleves'
INSERT INTO eleves (nom, prenom, classe, ecole, idClient) VALUES
('Dupont', 'Lucas', 'CM1', 'École Primaire de Paris', 1),
('Martin', 'Emma', 'CE2', 'École Primaire de Paris', 2);


INSERT INTO materiels (nom, prix, description, categorie, stock) VALUES
('Cahier A4', 2.99, 'Cahier grand format A4, 96 pages quadrillées', 'Papeterie', 150),
('Stylo à bille bleu', 0.50, 'Stylo à bille bleu avec grip confort', 'Écriture', 300),
('Compas', 5.95, 'Compas en métal avec pointe de sécurité', 'Matériel géométrique', 80),
('Sac à dos', 24.99, 'Sac à dos ergonomique pour enfants', 'Accessoires', 50),
('Calculatrice scientifique', 29.99, 'Calculatrice scientifique 240 fonctions', 'Électronique', 75);