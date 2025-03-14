import { Router } from "express";

// Import des méthodes de controlleurs
import * as mainController from "./controllers/mainController.js";
import * as galerieController from "./controllers/galerieController.js";
import * as contactController from "./controllers/contactController.js";

const router = Router();


// routes acceuil et a propos
router.get(`/`, mainController.renderHomePage);
router.get(`/infos`, mainController.renderAproposPage);

// routes pour la galerie
router.get(`/galerie`, galerieController.renderGaleriePage);


// routes contact
router.get(`/contact`, contactController.renderContactPage);






// Exporter le router
export default router;