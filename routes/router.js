import { Router } from "express";

// Import des méthodes de controlleurs
import * as mainController from "../routes/controllers/mainController.js";
import * as galerieController from "../routes/controllers/galerieController.js";

const router = Router();



router.get(`/`, mainController.renderHomePage);
router.get(`/galerie`, galerieController.renderGaleriePage);





// Exporter le router
export default router;