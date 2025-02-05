DROP TABLE IF EXISTS "review";
DROP TABLE IF EXISTS "figurine";

CREATE TABLE IF NOT EXISTS "figurine" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT,
  "description" TEXT,
  "size" REAL, -- REAL correspond à "nombre à virgule"
  "price" REAL NOT NULL,
  "category" TEXT
);

set client_encoding to utf8;

INSERT INTO "figurine"("id","name", "description", "size", "price", "category") VALUES
(1,'Aerith', 'Aerith Gainsborough est la dernière descendante des Cetras (ou Anciens), fille du professeur Gast et d''Ifalna',35,24.99,'Gentil'),
(2,'Barret', 'Barret Wallaceest le chef d''AVALANCHE, groupe écologiste de résistance à l''épuisement des ressources planétaires (l''énergie Mako) par la Shinra.',30,24.99,'Gentil'),
(3,'Cloud', 'Cloud Strife est le principal héros de Final Fantasy VII. Convaincu d''être un ancien SOLDAT, il est au début du jeu un mercenaire employé par AVALANCHE.',37,34.99,'Gentil'),
(4,'Nanaki', 'Rouge XIII, de son vrai nom Nanaki, est l''un des derniers survivants de sa tribu, composée de personnages proches des félidés (lion, tigre, jaguar, ...) par leur aspect physique, vivant à Cosmo Canyon.',25,24.99,'Animal'),
(5,'Sephiroth', 'Sephiroth est présenté au cours du jeu comme le fils de Hojo, un savant fou, et de Lucrécia, son assistante.',35,34.99,'Méchant'),
(6,'Tifa', 'Tifa Lockheart est une jeune femme originaire de Nibelheim, amie d''enfance de Cloud et membre du groupe AVALANCHE',35,24.99,'Gentil');


-- Review

CREATE TABLE IF NOT EXISTS "review" (
  "id" SERIAL PRIMARY KEY,
  "author" TEXT NOT NULL,
  "note" REAL NOT NULL,
  "title" TEXT,
  "message" TEXT,
  "figurine_id" INT,
  FOREIGN KEY("figurine_id") REFERENCES "figurine"("id")
);