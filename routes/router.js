import { Router } from "express";

// Import des méthodes de controlleurs
import * as mainController from "../routes/controllers/mainController.js"

const router = Router();



router.get(`/`, mainController.renderHomePage);






// Exporter le router
export default router;