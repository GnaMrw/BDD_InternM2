-- Création de la base de données
CREATE DATABASE testingSB_database;
-- Utilisation de la base de données créée
USE testingSB_database;

-- Création des tables
-- Création de la table principale Données_Sportives
CREATE TABLE Données_Sportives (
    ID_Athlete INT PRIMARY KEY AUTO_INCREMENT,
    Prenom_Nom VARCHAR(100) NOT NULL,
    Genre ENUM('M', 'F') NOT NULL,
    Date_mesure DATE,
    dd_mm_yy DATE,
    Age INT,
    Club VARCHAR(100),
    Region VARCHAR(100),
    Discipline VARCHAR(100),
    Specialite VARCHAR(100),
    Statut_SHN VARCHAR(50),
    Structure_SHN VARCHAR(50),
    Entraineur VARCHAR(100),
    Categorie VARCHAR(50),
    CONSTRAINT CHK_Genre CHECK (Genre IN('M', 'F')),
    CONSTRAINT CHK_Categorie CHECK (Categorie IN('Minime', 'Espoir', 'Cadette', 'Benjamine', 'Senior', 'Autre'))
);
-- Création de TRIGGER pour calculer la date 
DELIMITER $$
CREATE TRIGGER calcul_age BEFORE INSERT ON Données_Sportives
FOR EACH ROW
BEGIN
    SET NEW.Age = YEAR(CURDATE()) - YEAR(NEW.Date_naissance) -
               (RIGHT(CURDATE(), 5) < RIGHT(NEW.Date_naissance, 5));
END;
$$
DELIMITER ;

-- Création de la table Mesures_anthropométriques
CREATE TABLE Mesures_anthropométriques (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Athlete INT,
    Taille_cm FLOAT NOT NULL,
    Poids_kg FLOAT NOT NULL,
    Envergure_cm FLOAT,
    Longueur_Pieds_cm FLOAT,
    Longueur_Jambes_cm FLOAT NOT NULL,
    Hauteur_Assise_cm FLOAT NOT NULL,
    Age_PHV FLOAT,
    Maturity_Offset FLOAT NOT NULL,
    Biceps_mm INT,
    Triceps_mm INT,
    Subscap_mm INT,
    Iliac_mm INT,
    FAT_percent FLOAT,
    FFM_percent FLOAT,
    FAT_kg FLOAT,
    FFM_kg FLOAT,
    BMR_Cal INT,
    Graisse_viscerale_Echl INT,
    FOREIGN KEY (ID_Athlete) REFERENCES Données_Sportives(ID_Athlete)
);
-- Création de la table Qualités_physiques
CREATE TABLE Qualités_physiques (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Athlete INT,
    CMJ_Tps_Vol1_s FLOAT,
    CMJ_Hauteur1_cm FLOAT,
    CMJ_Tps_Vol2_s FLOAT,
    CMJ_Hauteur2_cm FLOAT,
    CMJ_Moy_Tps_Vol_s FLOAT,
    CMJ_Moy_Hauteur_cm FLOAT,
    Drop_Jump VARCHAR(100),
    Hauteur_Foulee_CMJ_Plio FLOAT,
    CMJ_Pliometrie VARCHAR(100),
    Sauts_Max_Hauteur_Droit_cm FLOAT,
    Sauts_Min_Hauteur_Droit_cm FLOAT,
    Sauts_Moy_Hauteur_Droit_cm FLOAT,
    Sauts_Moy_Tps_Contact_Droit_s FLOAT,
    Sauts_Moy_Tvol_Droit_s FLOAT,
    Sauts_Max_Hauteur_Gauche_cm FLOAT,
    Sauts_Min_Hauteur_Gauche_cm FLOAT,
    Sauts_Moy_Hauteur_Gauche_cm FLOAT,
    Sauts_Moy_Tps_Contact_Gauche_s FLOAT,
    Sauts_Moy_Tvol_Gauche_s FLOAT,
    Sauts_Max_Hauteur_cm_Classic FLOAT,
    Sauts_Min_Hauteur_cm_Classic FLOAT,
    Sauts_Moy_Hauteur_cm_Classic FLOAT,
    Sauts_Moy_Tps_Contact_s_Classic FLOAT,
    Sauts_Moy_Tvol_s_Classic FLOAT,
    Nmb_15s_Sauts_Pied_Droit INT,
    Sauts_15s_Tps_Cont_s_Droit FLOAT,
    Sauts_15s_Moy_Hauteur_cm_Droit FLOAT,
    Nmb_15s_Sauts_Pied_Gauche INT,
    Sauts_15s_Moy_Tps_Cont_s_Gauche FLOAT,
    Sauts_15s_Moy_Hauteur_cm_Gauche FLOAT,
    Nmb_15s_Sauts_Classic INT,
    Sauts_15s_Moy_Tps_Cont_s_Classic FLOAT,
    Sauts_15s_Moy_Hauteur_cm_Classic FLOAT,
    Nb_Appuis_Serie1_Opto_0m_5m_Cell INT,
    Vitesse_5m_Opto1_m_s FLOAT,
    Tps_Vol_5m_Opto1_s FLOAT,
    Tps_Cont_sol_5m_Opto1_s FLOAT,
    Nb_Appuis_Serie2_Opto_25m_30m_Cell INT,
    Vitesse_5m_Opto2_m_s FLOAT,
    Tps_Vol_5m_Opto2_s FLOAT,
    Moy_Tps_Cont_sol_5m_Opto2_s FLOAT,
    Nb_Appuis_Serie3_Opto_45m_50m_Cell INT,
    Vitesse_5m_Opto3_m_s FLOAT,
    Tps_Vol_5m_Opto3_s FLOAT,
    Tps_Cont_sol_5m_Opto3_s FLOAT,
    FOREIGN KEY (ID_Athlete) REFERENCES Données_Sportives(ID_Athlete)
);

