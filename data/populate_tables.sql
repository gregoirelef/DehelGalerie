BEGIN;

SET client_encoding TO 'UTF8';

TRUNCATE TABLE "user", "role", "category_oeuvre", "oeuvre"; RESTART IDENTITY;
-- TRUNCATE supprime TOUS les enregistrements de la table, sans pour autant supprimer les tables elles-même.


INSERT INTO "role" ("id", "name") 
VALUES 
( 1, 'administrateur');
( 2, 'artiste');
( 3, 'Utilisateur');


INSERT INTO "user" ("id", "firstname", "lastname", "email", "role_id") 
VALUES 
( 1, 'lefebvre','Daniel', 'gregoirelefebvredelanghe@yahoo.fr', 2);
( 2, 'lefebvre','Gregoire', 'gregoirelefebvredelanghe@yahoo.fr', 1);
( 3, 'smith','jhon', 'lefebvredelanghegregoire@yahoo.fr', 2);


INSERT INTO "category" ("id","name") 
VALUES 
( 1, 'dessin');
( 2, 'planche de dessin');
( 3, 'BD');
( 4, 'tableaux');
( 5, 'sculpture');


INSERT INTO "subcategory" ("name") 
VALUES 
( 1, 'feutre');
( 2, 'pastele');
( 3, 'crayon');
( 4,'huile');
( 5,'acrylique');
( 6,'bronze');
( 7, 'alluminiume');
( 8,'argile');
( 9,'résine');
( 10,'bois');


INSERT INTO "category_has_subcategory"
  ("category_id", "subcategory_id")
VALUES
  (1, 1), -- dessin - feutre
  (1, 2), -- dessin - pastele
  (1, 3), -- dessin - crayon
  (2, 1), -- planche de dessin - feutre
  (2, 2), -- planche de dessin - pastele
  (2, 3), -- planche de dessin - crayon
  (4, 4), -- tableaux - huile
  (4, 5), --tableaux - acrylique
  (5, 6), -- sculpture - bronze
  (5, 7), -- sculpture - alluminiume
  (5, 8), -- sculpture - argile
  (5, 9), -- sculpture - résine
  (5, 10), -- sculpture - bois



INSERT INTO "oeuvre" ( "id", "title", "id_number", "subject", "realise_at", "size", "signed", "url_picture", "category_id", "subcategory_id", "author_id") 
VALUES 
(1, 'Micket et yoda', NULL, NULL, NULL, '24x32', TRUE, '/uploads/img/Micket et yoda.jpg',1,3, 1)
(2, 'Journée de la gentillesse', NULL, 'Attentats Paris 13 Nov 2015', '2015-11-14', '24x32', TRUE, '/uploads/img/Journée de la gentillesse.jpg',1,3,1);
(3, 'Républic', NULL, `etat d'urgence +cop21`, '2015-12-01', '21x29', TRUE, '/uploads/img/Républic.jpg',1,3, 1);
(4, 'Goodyear', NULL, 'procès goodyears avec condamnations 01/2016', '2016-01-22', '24x32', TRUE, '/uploads/img/Journée de la gentillesse.jpg',1,3, 1);
(5, `C'est le prinptemps`, NULL, 'élections départementales 2015', '2015-03-20', '24x32', TRUE, '/uploads/img/Journée de la gentillesse.jpg',1,3, 1);
(6, 'Fashion week', NULL, 'fashion week + cop21', '2015-12-12', '24x32', TRUE, '/uploads/img/Journée de la gentillesse.jpg',1,3, 1);
(7, 'Tourisme shebab', NULL, 'attaque Kenia 147 mort', '2015-04-02', '24x32', TRUE, '/uploads/img/Journée de la gentillesse.jpg',1,3, 1);
(8, `L'air du temps`, NULL, `Réforme de l'orthographe`, '2016-03-20', '24x32', TRUE, '/uploads/img/Journée de la gentillesse.jpg',1,3, 1);
(9, 'Le Carillon', NULL, 'Attentat de Paris', '2015-11-23', '21x29', TRUE, '/uploads/img/Journée de la gentillesse.jpg',1,3, 1);
(10, 'Germanwings', NULL, 'accident German airwings', NULL, '24x32', TRUE, '/uploads/img/Journée de la gentillesse.jpg',1,3, 1);
(11, 'banlieu Boogie 1', NULL, 'bande-dessiner sur la vie de cartier des loubards', NULL, '30x42', FALSE, 'avoir.jpg',2,1, 1);
(12, 'banlieu Boogie 2', NULL, 'bande-dessiner sur la vie de cartier des loubards 2', NULL, '30x42', FALSE, 'avoir.jpg',2,1, 1);
(13, ' vestige 1', NULL, 'bande-dessiner humoristique sur la lune et les humains', NULL, '24x32', FALSE, 'avoir.jpg',2,1, 1);
(14, ' vestige 2', NULL, 'bande-dessiner humoristique sur la lune et les humains 2', NULL, '24x32', FALSE, 'avoir.jpg',2,1, 1);
(15, 'sans titre 1', NULL, NULL, NULL, '60x80', FALSE, 'avoir.jpg',4,4, 1);
(16, 'sans titre 2', NULL, NULL, NULL, '60x80', TRUE, 'avoir.jpg',4,4, 1);
(17, 'sans titre 3', NULL, NULL, NULL, '60x80', FALSE, 'avoir.jpg',4,5, 1);
(18, 'sans titre 4', NULL, NULL, NULL, '60x80', TRUE, 'avoir.jpg',4,5, 1);
(19, 'sans titre 5', NULL, NULL, NULL, '60x80', FALSE, 'avoir.jpg',4,5, 1);
(20, 'sans titre 6', NULL, NULL, NULL, '60x80', TRUE, 'avoir.jpg',4,4, 1);





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



















COMMIT; 