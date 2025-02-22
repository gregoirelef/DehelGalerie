# DehelGalerie
développement de l'application Dehel Galerie

## instalation


- `npm init` : 
  - permet de créer le fichier `package.json`
  - les métadata du projet
  - à faire une seule fois à la création du projet

- `npm install` :
  - installer les dépendances listées dans le package.json
  - et les ajouter au dossier node_modules
  - à faire à chaque fois que le projet est clonez quand il contient un package.json avec des dépendances

- `npm install <package>`
  - ajouter la dépendance au package.json
  - l'installer dans les node_modules
  - à faire une seule fois à l'ajout de la dépendance au projet


- `npm install express`

- `npm install ejs`

- `npm install --save-dev eslint`
  - note : `--save-dev` permet de sauvegarder la dépendance comme "dépendance de développement", ie. qui ne sert que lorsque l'on code et non pas en production.
  - Créer un fichier de configuration ESLint `touch eslint.config.js`
  - Y ajouter une config par défaut :

```js
import js from "@eslint/js";
import globals from "globals";

export default [
  js.configs.recommended,
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node
      },
      
    },
    rules: {
      "semi": "error",
      "indent": ["error", 2],
    }
  }
];
```




- `npm install pg`

- `npm install dotenv`
- `npm install bulma`
- `npm install sass`
- `npm install concurrently --save-dev`
- `npm install npm-run-all --save-dev`
- `npm install tailwindcss @tailwindcss/cli`









 `module a installer`
  - ✅ node
  - ✅ express
  - ✅ ejs
  - ✅ esLint
  - ✅postgreSQL
  - ✅dotenv
  - taillwind
  - dev all



# parramettrage

```
- ✅gitignore
- ✅cmd run dev
- ✅.env
- ✅.env.config
- ✅eslint.config.js
- taillwind






```
# to do list
- `to do liste`
```
-  mettre la procedure de connection a taillwind dans le read-me.
-  factorisé les cards





```







- ✅
- ❌