import "dotenv/config";

import express from "express";
import path from "node:path";
import router from "./routes/router.js";



const app = express();

app.set("view engine", "ejs"); 
app.set("views", path.join(import.meta.dirname, "views"));

app.use(express.static(path.join(import.meta.dirname, "public")));


app.use(router);

const port = process.env.PORT; // Fallback (valeur par défaut) au cas où le .env ne serait pas défini
app.listen(port, () => {
  console.log(`Server started at http://localhost:${port}`);
});