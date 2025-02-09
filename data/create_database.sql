
DROP TABLE IF EXISTS "dessins";
DROP TABLE IF EXISTS "artiste";

CREATE TABLE IF NOT EXISTS "artiste" (
  "id" SERIAL PRIMARY KEY,
  "nom" TEXT NOT NULL,
  "prenom" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "dessins" (
  "id" SERIAL PRIMARY KEY,
  "titre" TEXT NOT NULL,
  "reference" TEXT,
  "date_realisation" DATE,
  "format" TEXT NOT NULL,
  "signature" BOOLEAN NOT NULL,
  "img_url" TEXT,
  "artiste_id" INTEGER,
  FOREIGN KEY("artiste_id") REFERENCES "artiste"("id")
);

SET client_encoding TO 'UTF8';

INSERT INTO "artiste" ("nom", "prenom") 
VALUES 
('daniel', 'lefebvre');



INSERT INTO "dessins" ("titre", "reference", "date_realisation", "format", "signature", "img_url", "artiste_id") 
VALUES 
('Micket et yoda', NULL, NULL, '24x32', TRUE, 'public/img/Micket et yoda.jpg', 1);
('Journée de la gentillesse', 'Attentats Paris 13 Nov 2015', '2015-11-14', '24x32', TRUE, 'public/img/Journée de la gentillesse.jpg', 1);
('Républic', `etat d'urgence +cop21`, '2015-12-01', '21x29', TRUE, 'public/img/Républic.jpg', 1);
('Goodyear', 'procès goodyears avec condamnations 01/2016', '2016-01-22', '24x32', TRUE, 'public/img/Journée de la gentillesse.jpg', 1);
(`C'est le prinptemps`, 'élections départementales 2015', '2015-03-20', '24x32', TRUE, 'public/img/Journée de la gentillesse.jpg', 1);
('Fashion week', 'fashion week + cop21', '2015-12-12', '24x32', TRUE, 'public/img/Journée de la gentillesse.jpg', 1);
('Tourisme shebab', 'attaque Kenia 147 mort', '2015-04-02', '24x32', TRUE, 'public/img/Journée de la gentillesse.jpg', 1);
(`L'air du temps`, `Réforme de l'orthographe`, '2016-03-20', '24x32', TRUE, 'public/img/Journée de la gentillesse.jpg', 1);
('Le Carillon', 'Attentat de Paris', '2015-11-23', '21x29', TRUE, 'public/img/Journée de la gentillesse.jpg', 1);
('Germanwings', 'accident German airwings', NULL, '24x32', TRUE, 'public/img/Journée de la gentillesse.jpg', 1);