CREATE TABLE Données_Sportives (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(50) NOT NULL,
    Genre INT,
    Date_mesure DATE,
    Date_naissance DATE,
    Age INT,
    Club VARCHAR(50),
    Discipline VARCHAR(50),
    Catégorie VARCHAR(50),
    CONSTRAINT CHK_Genre CHECK (Genre IN(1, 2)),
    CONSTRAINT CHK_Catégorie CHECK (Catégorie IN('Minime','Espoir','Cadette','Benjamine','Senior'))
);

-- Crear el TRIGGER para calcular la edad
DELIMITER $$
CREATE TRIGGER calcul_age BEFORE INSERT ON Données_Sportives
FOR EACH ROW
BEGIN
    SET NEW.Age = YEAR(CURDATE()) - YEAR(NEW.Date_naissance) -
               (RIGHT(CURDATE(), 5) < RIGHT(NEW.Date_naissance, 5));
END;
$$
DELIMITER ;

-- Crear la tabla Mesures_anthropométriques
CREATE TABLE Mesures_anthropométriques (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Athlete INT,
    Taille_cm REAL,
    Poids_kg REAL,
    Envergure_cm REAL,
    Longueur_pieds_cm REAL,
    Longueur_jambes_cm REAL,
    Hauteur_assise_cm REAL,
    Age_du_PHV REAL,
    Maturity_offset REAL,
    Biceps_mm REAL,
    Triceps_mm REAL,
    Subscap_mm REAL,
    Iliac_mm REAL,
    FAT_pourcentage REAL,
    FFM_pourcentage REAL,
    FAT_kg REAL,
    FFM_kg REAL,
    BMR_Cal REAL,
    Graisse_viscérale_Echl REAL,
    FOREIGN KEY (ID_Athlete) REFERENCES Données_Sportives(ID)
);

-- Crear la tabla Qualités_physiques
CREATE TABLE Qualités_physiques (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Athlete INT,
    Détente_verticale VARCHAR(50),
    premier_Temps_de_vol REAL,
    première_Hauteur_cm REAL,
    deuxième_Temps_de_vol REAL,
    deuxième_Hauteur_cm REAL,
    Moy_Temps_de_vol REAL,
    Moy_Hauteur REAL,
    Drop_jump VARCHAR(50),
    Hauteur_foulée_pour_CMJ_Plio REAL,
    CMJ_pliométrie VARCHAR(50),
    Max_Hauteur_Rght REAL,
    Min_Hauteur_Rght REAL,
    Moy_Hauteur_cm_Rght REAL,
    Moy_Tps_de_contact_s_Rght REAL,
    Moy_Tvol_s_Rght REAL,
    Max_Hauteur_Lft REAL,
    Min_Hauteur_Lft REAL,
    Moy_Hauteur_cm_Lft REAL,
    Moy_Tps_de_contact_s_Lft REAL,
    Moy_Tvol_s_Lft REAL,
    Stiffness_classic REAL,
    fifteens_STIFFNESS_RIGHT_FOOT REAL,
    Moy_Tps_de_contact_s_Rgt REAL,
    Moy_Hauteur_cm_Rgt REAL,
    Moy_T_Cont_s_Rgt REAL,
    fifteens_STIFFNESS_LEFT_FOOT REAL,
    Moy_Tps_de_contact_s_Lft_ REAL,
    Moy_Hauteur_cm_Lft_ REAL,
    Moy_T_Cont_s_Lft_ REAL,
    fifteens_CLASSIC_STIFFNESS REAL,
    Moy_tps_de_contact_s REAL,
    Moy_hauteur_cm REAL,
    Distance REAL,
    Temps_envol REAL,
    Temps_contact_sol REAL,
    Série_1 VARCHAR(100),
    Série_2 VARCHAR(100),
    Série_3 VARCHAR(100),
    Série_4 VARCHAR(100),
    Série_5 VARCHAR(100),
    FOREIGN KEY (ID_Athlete) REFERENCES Données_Sportives(ID)
);
