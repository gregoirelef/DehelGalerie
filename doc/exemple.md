# S07E01 - Trombinoclock - Gestion de projet & Architecture

## Menu du jour

```
### Matin - Gestion de projet

- Clarification du besoin
- User stories
- Maquettage (Zoning -> Wireframes -> Mockup)
- Kanban

### Après-midi - Architecture

- Express
- ECMAScript Modules (ESM)
- ESLint
- Variables d'environnement
- Moteur de rendu EJS (view engine)
- Ressources statiques
- Router & contrôleurs

```


## Mail de Nicole 

```
Bonjour, nous sommes une école qu'elle est bien !
Nous voulons un outil pour faciliter les contacts entre étudiants.

Nous aimerions donc pouvoir lister les promotions ainsi que les 
étudiants qui les composent, mais aussi accéder aux détails d'un
étudiant, photo de profil comprise.

L'accès aux profils serait libre et gratuit.

Dans un second temps, l'outil pourrait servir à éditer les profils et promotions.

En espérant que vous pourrez répondre favorablement à notre
demande,

Cordialement,
Nicole.
```

## Métier de développeur 

Plus de 50% de gestion de projet, clarification du besoin, alignement entre les attentes et le logiciel délivré.

Vos soft skills sont aussi (voire plus !) importantes que vos hard skills. 

## Au charbon 

- 1. hiérarchiser les tâches
- 2. outils de gestion de projet
- 3. sélection des technologies
- 4. lister le besoin / clarifier le besoin / comprendre le besoin / cahier des charges
- 5. feedback des collègues
- 6. planning 
- 7. rdv client 


Que ce soit en freelance
ou en entreprise 

-> on passe beaucoup de temps sur de la gestion de projet 

Montrer quelques outils pour savoir quelle approche adopter

## Clarification du besoin ? 

- échanges avec le commanditaire
- maquettage
- étude de marché 
  - soft déjà existants
  - CMS (Wordpress / Shopify / ...)
- décrire les attentes utilisateurs => user stories
- "personas" => savoir à qui on s'adresse (les profils-type)



## Séance de question réponse

Besoin de Nicole : 
- outil de gestion qui liste les étudiants et les promotions.
- avec possibilité d'ajouter et retirer des étudiants et promotions
- utilisé en interne par l'école


- Q. Est-ce que les étudiants doivent eux-mêmes s'inscrire sur le site ?
  - R. Non. Une personne administrateur capable de rajouter des étudiants et des promos sur la plateforme. Donc une page dédiée et accessible uniquement à cette utilisatrice admin
- Q. Ou est-ce qu'on a accès à une DB remplie des info ?
  - R. Oui ! Pour l'instant, j'ai un export de données de mon ancien système
- Q. oui , quels sont les chose a mettre dans les profils ?
  - R. nom / prénom / github username / profile picture url / numero de promo
- Q. Quid du RGPD. droit à l'image ?
  - R. les images sont celles mise à dispositions par les étudiants eux même (profile picture de github).
  - R. Conservation des données => l'école qui gère
- Q. Est-ce que les étudiants peuvent modifier eux-mêmes leur profil?
  - R. Non, seul l'admin peut modifier.
  - R. On n'aura pas le temps de coder la partie "modifier une fiche étudiante"
- Q. nombre de promo 1, 100, 1000, nombre d'étudiants / consultations potentielles du sites?
  - R. Promo fournie dans la fiche (1000 environ)
  - R. N'importe quel utilisateur avec accès à l'URL pourra accéder aux données  ==> Pas très RGPD
  - R. Mais bonne nouvelle, le projet ne sera pas déployé (reste en local sur le VPN Oclock), sur l'intranet
- Q. As-tu déjà un type d'interface en tête?
  - R. Non => help !
- Q. en terme de SEO, il y aura t-il besoin d'une appli ? lien avec les réseaux sociaux
  - R. C'est sur l'intranet, donc pas besoin du SEO. En revanche, comme toujours, on fera attention à l'accessibilité et la sémantique HTML
- Q. design et chartre graphique déjà dispo ou à faire?
  - R. Non. Help !
- Q. Service de messagerie entre les users ? est ce que les étudiants doivent pouvoir interagir entre eux ? 
  - R. Non. 
- Q. Langue principale du site ? Visée future à l'internationnal ?
  - R. Francais
- Q. comment la navigation doit ce faire ? ( les étudiant peuvent il consulté les fiches des autre etudiant/promotion?
  - R. Oui, a priori s'ils ont accès au VPN
- Q. accès via autre que mobile/tablette ? portabilité vers les différents support ? RWD
  - R. Oui, on veillera à ce que le rendu des vues soit responsive !
- Q. techno désirées?
  - R. Le choix est laissé à la promo Sushi 
  - R. Node.js + Express (serveur HTTP) + EJS (view engine) + DATA (JSON + Postgres)
- Q. Droits et responsabilités des admins sur la plateforme ? 
  - R. Nicole peut ajouter de nouveaux étudiants
- Q. un rédacteur prévu ou texte à rédiger par nous ?
  - R. Pas de texte particulier sur la plateforme, c'est surtout un affichage de données, libre pour les textes !
- Q. Budget ? 
  - R. Zéro ! 
- Q. Deadline ?
  - R. Fin de semaine 
- Q. Déploiement ? Hébergeur ?
  - R. Seulement si on a un peu de temps (un cours dédié au déploiement en S17, ce qui ne vous empêche pas d'explorer en autonomie entre temps !)
- Q. Autres intervenants sur le projet ? 
  - R. Non, 37 cerveaux sur un même projet devrait suffire
- Q. Version payante ? 
  - R. Non, pour l'intranet
- Q. Maintenance du projet ? 
  - R. Le projet est bien entendu un pretexte pour apprendre des nouveautés 


## User stories 

**User story** = 
- 🇫🇷 récit utilisateur
- une action (un scénari) possible par l'utilisateur sur la plateforme.

**Objectifs** : 
- clarifier le besoin
  - éviter les incompréhensions
  - éviter les oublis
- fournir un **scénari de test** pour valider que le produit fini répond bien à la demande initiale

**Formalisme** :
- 🇫🇷 `En tant que [ROLE], je veux pouvoir [ACTION] (( dans le but de [OBJECTIF] ))`
- 🇺🇸 `En tant que [ROLE], I want to [ACTION] (( in order to [GOAL] ))`

**Titre pro** :
- attention, les jurés veulent voir quelques users stories lors du passage du TP, donc attention au formalisme. 

**Atomicité** : 
- une user story doit-être le plus atomique possibles c'est à dire que l'action décrite doit être le plus unitaire et correspondre à l'action qui va réellement être jouée par l'utilisateur.
  - ex : en tant qu'admin, je souhaite pouvoir ajouter des nouveaux étudiants dans la plateforme
    - sous entend qu'on développe une feature de type "batch import", par exemple, import de plusieurs étudiants via un fichier Excel lu par le système
  - ex : en tant qu'admin, je souhaite pouvoir ajouter un nouvel étudiant dans la plateforme
    - sous entend qu'on développe une feature de type "page d'ajout d'un étudiant"

**Exemples** : 
- En tant que utilisateur, je veux pouvoir accéder à la liste des promotions dans le but de connaitre les différentes promotions de l'école
- En tant que administratrice, je veux pouvoir ajouter un nouvel étudiant sur la plateforme


<details><summary>
Brouillon
</summary>

```
- ✅ En tant que utilisateur, je veux pouvoir accéder à la liste des promotions dans le but de connaitre les différentes promotions de l'école

- ✅ En tant que administratrice, je veux pouvoir ajouter un nouvel étudiant sur la plateforme

- ❌ En tant que administratrice, je veux pouvoir modérer un profil, afin de modifier ses informations personnels

- ❌ En tant que administratrice, je veux pouvoir envoyer une infolettre à la totalité des membres

- 🚧 En tant que administratrice, je ne veux pas avoir à m'inquiéter en permanence de la sécurité du site

- ❌ En tant qu'utilisateur, je veux pouvoir filtrer par dates (années ?) de créations les promos. 

- 🚧 En tant qu'administratrice je veux pouvoir afficher les liens vers les promos dans la page centrale afin d'éviter de la surcharger avec les presque 1000 promos.
  - l'idée : ne pas surcharger la page qui liste toutes les promotions, mais n'afficher que les 50 premières
  - ce genre de raffinement de spécification doit être précisé dans le "cahier des charges" de la fonctionnalités => **Spécifications**

- ❌ En tant qu'utilisateur, je veux pouvoir modifier mon image de profil
  - l'utilisateur modifiera son profil github

- ❌ En tant qu'utilisateur, je veux pouvoir retrouver quelqu'un par sys.recherche nom/prénom/promo même avec infos incomplètes

- ❌ En tant qu'utilisatrice, je veux pouvoir me désinscrire de la plateforme et retirer mes données perso

- ✅ En tant qu'utilisateur, je veux pouvoir accéder aux anciennes promo

- ❌ En tant qu'administrateur, je veux pouvoir trier les promotions par type de diplôme

- 🚧 En tant qu'administrateur je veux pouvoir intervenir en tant que modérateur
  - manque de précision

- ❌ En tant que administratrice, je veux pouvoir supprimer un étudiant sur la plateforme

- ✅ En tant qu'administrateur je veux pouvoir ajouter une nouvelle promotion

- ✅ En tant que utilisateur/administrateur, je veux pouvoir consulter le nombre total des étudiants/promotions.

- ✅ En tant qu'utilisateur, je veux pouvoir accéder aux profils d'un.e étudiant.e dans le but de voir ses infos personnelles

- ❌ En tant qu'administrateur je souhaite pouvoir ajouter ou retirer des propriétés/catégories sur les fiches des étudiants

- ❌ En tant qu'utilisateur, je souhaite pouvoir accéder à une liste d'anciens étudiants/alumnis pour pouvoir les contacter pour des opportunités professionnelles

- ✅ En tant qu'utilisateur je souhaite pouvoir accéder à toutes les promos

- ❌ En tant qu'utilisateur, je veux pouvoir rechercher une promotion par mot-clé afin de trouver rapidement l'information désirée

- ❌ En tant qu'utilisateur, je veux pouvoir modifier mes informations personnelles afin de maintenir mon profil à jour

- 🚧 En tant qu'utilisateur.trice et/ou admin je veux pouvoir faire une recherche de promo ou d'étudiant en utilisant divers filtres (nom d'étudiant, nom de promo, année de promo ...) et visualiser les résultats de la recherche

- 🚧 En tant qu'utilisateur.trice et/ou admin je veux pouvoir, trier les données (ordre alphabétique croissant, décroissant etc)
 
- ❌ En tant qu'utilisateur, je veux pouvoir envoyer des messages privés aux autres utilisateurs, individuellement ou en groupe

- ❌ En tant qu'admin, je veux pouvoir modifier le contenu d'une promo afin de changer le nom / profil utilisateur / supprimer des profils / supprimer une promo

- ❌ En tant qu'administrateur/utilisateur, je veux pouvoir effectuer une recherche pour cibler un étudiant/promo dans le but d'accéder à sa fiche.

- ✅ En tant qu'utilisateur, je veux pouvoir connaître le nombre d'étudiants dans ma promo

```

</details>


KISS = Keep it simple stupid = quand on a le choix entre deux fonctionnalités, on fait la plus simple (et on en parle, on le fait pas en douce !)
- moins de temps => moins d'argent, surtout si le besoin n'est pas réel.


### User stories pour la saison 


| En tant que    | Je souhaite                                                         | Afin de                                           | V   |
| -------------- | ------------------------------------------------------------------- | ------------------------------------------------- | --- |
| Visiteur       | accèder aux différentes rubriques du site                           | choisir facilement ce que je vais consulter       | V0  |
| Visiteur       | consulter la liste de tous les étudiants                            |                                                   | V0  |
| Visiteur       | consulter la liste de toutes les promotions                         |                                                   | V0  |
| Visiteur       | consulter les détails d'une promotion, dont les élèves la composant |                                                   | V1  |
| Visiteur       | consulter les détail d'un étudiant                                  |                                                   | V1  |
| Visiteur       | rechercher un étudiant par son nom                                  |                                                   | V2  |
| Visiteur       | trier les promotions par année de démarrage                         |                                                   | V2  |
| Administrateur | ajouter une promotion                                               |                                                   | V3  |
| Administrateur | supprimer les informations d'un élève                               |                                                   | V3  |
| Administrateur | éditer les informations d'un  élève                                 | afin de les maintenir à jour                      | V3  |
| Administrateur | ajouter un élève à une promotion                                    |                                                   | V3  |
| Administrateur | retirer un élève à une promotion                                    |                                                   | V3  |
| Administrateur | archiver les données d'un étudiant                                  | pour conserver les données d'un étudiant supprimé | V4  |
| Administrateur | faire des imports de listes d'étudiants                             | faciliter l'insertion de données en masse         | V5  |


- `Prototype` = "maquette fonctionnelle", parfois sans avoir coder une seule ligne (avec des outils dédiés, comme Figma)
- `V0` = Version 0 = **MVP = Minimum Viable Product** = le produit minimal que l'on peut fournir au client pour un premier retour utilisateur

## Maquettage

Pas necessairement le rôle du developpeur, mais dans la mesure où : 
- ça clarifie le besoin
- parfois, on est seul sur un projet 

Ca peut valoir le coup de maquetter un projet à l'aide de différents outils et différentes étapes. 

### Étapes clés

- 1. **Zoning**
  - découper les grandes zones d'une page
- 2. **Wireframe**
  - comprendre comment l'utilisateur va intéragir avec la page
- 3. **Mockup**
  - design final d'une application

| Zoning | Wireframes | Mockup
| -- | -- | -- |
| ![](../screens/zoning.webp) | ![](../screens/wireframe.png) | ![](../screens/mockup.png) | 

### Titre Pro 

Compétence attendue : maquettage

Conseil : prévoir quelques slides pour présenter votre demarche `Zoning -> Wireframe -> Mockup`, pour une ou deux pages maximum (pas besoin de montrer les wireframes de toute l'app'). Idem pour le dosier pro. 

### Outils pour Wireframes 

Les armes de poing
- Papier/crayon
- Whimsical
- Wireframe.cc
- Paint
- **Excalidraw**
- **TLDraw**
- Google Draw

Les armes lourdes (plutôt pour le mockup)
- Indesign
- **Figma**
- Canva
- Gimp

### Conseils Wireframes

- Objectif : clarifier le besoin et comprendre comment l'utilisateur va intéragir avec l'interface
- Conseils : 
  - penser à décliner le wireframe en plusieurs versions si beson
    - ex : la vue mobile
    - ex : la vue desktop
    - ex : la vue administrateur

- Attentions : 
  - **PAS DE COULEUR** sur les wireframes
    - sauf à la limite pour les annotations 
    - idée : est-ce que l'app est comprehensible sans pour autant qu'il y ai de couleur
    - idée : le style n'a pas son importance dans l'étape wireframe
  - **PAS D'IMAGE**
    - rectangles barrés à la place


![](../screens/home-desktop.png)

![](../screens/home-mobile.png)

## Méthodes agiles 

![](../screens/agile.jpg)

Notion phare : **itérations**
- on avance petit à petit sur un projet, et on y incorpore de nouvelles fonctionnalités au fur et à mesure
- l'avantage c'est qu'on peut livrer en continue, prendre les retours utilisateurs regulièrement

S'oppose aux méthodologies "waterfall"
- plannifier l'intégralité du projet, puis réalisation, puis maintenance.

Méthode agile = un **ensemble d'outils et de pratiques méthodologiques**

Méthodes agiles, il en existe pleins : 
- **SCRUM**
- Extrame Programming
- chaque entreprise adapte son fonctionnement sur l'une de ces méthodes

Les méthodes agiles sont particulièrement adaptés à la création de logiciel

Contruire une maison ou un pont, marche pas bien en agile 

### Exemples d'outils et de vocabulaire associés aux méthodes agiles 

- **Product Manager** : interface entre le client et le reste de l'équipe (designer, dev..)
- **Product Owner** : définie les spécifications exactes de l'application interface entre product manager et dev 
- **Developer** : implémente les fonctionnalités
- **Backlog** : l'ensemble des tâches à implémenter, mais non encore plannifié
- **Scrum master** : organise la réalisation des tâches
- **Sprint** : une durée fixes entre deux versions du logiciel
- **Stand-up meeting** : 10 min tous les matins pour se tenir au courant
- **Kanban** : board de gestion de projet

### Outils pour les Kanban 

- Trello
- Jira
- Figma
- Clickup
- **Github Project**

## Commandes NPM

- `npm init` : 
  - permet de créer le fichier `package.json`
  - les métadata du projet
  - à faire une seule fois à la création du projet

- `npm install` : 
  - installer les dépendances listées dans le `package.json`
  - et les ajouter au dossier `node_modules`
  - à faire à chaque fois que vous clonez un projet qui contient un `package.json` avec des dépendances

- `npm install <package>`
  - ajouter la dépendance au `package.json`
  - l'installer dans les `node_modules`
  - à faire une seule fois à l'ajout de la dépendance au projet

## Conventionnal commit

Bonne pratique lorsqu'on commit, est de préfixer la description du commit par un mot clé qui caractérise le type de commit : 
- `feat`: écriture d'une fonctionnalité
- `chore`/`config` : ajustement de config
- `fix` : correction d'un bug
- `docs` : écriture de documentation
- `test` : ajout de test
- `refactor` : modification du code (le rendre plus propre) sans modifier les fonctionnalités sous-jacentes

[Documentation](https://www.conventionalcommits.org/en/v1.0.0/)


## ESLint

C'est le linter le plus utilisé dans l'ecosystème JavaScript.

Il est actuellement en version 8, avec une modification de la configuration de base plutôt récente. Vous trouverez assez facilement en ce moment de la doc deprecated. 


### Pré-requis 

Vérifier que l'extension VSCode `ESLint` est bien installé, sinon l'installer une fois pour toute

### Pour chaque nouveau projet

**Installer ESLint** : 
- `npm install --save-dev eslint`
  - note : `--save-dev` permet de sauvegarder la dépendance comme "dépendance de développement", ie. qui ne sert que lorsque l'on code et non pas en production.

**Créer un fichier de configuration ESLint** : 
- `touch eslint.config.js`

**Y ajouter une config par défaut** : 

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

**Troubleshooting** : 
- en cas de problème, fermer et réouvrir le fichier, voire fermer et réouvrir VSCode directement.


Note : 
- en JS, l'indentation la plus courante est de **2 espaces** (sinon Shaaaame !)


## Version de Node.js

Vérifier votre version de node : 
- `node -v` >= 22

Sinon, voici [une solution](https://gist.github.com/enzoclock/4699778e26a7a0990ef00e42c8a3f87b) pour mettre à jour Node.

## L'histoire du chemin absolue vers le dossier `views` et `public`

```js
import.meta.dirname;              // dossier courant à partir du FICHIER où est écrit le code en ESM (Node >= 22)
__dirname;                        // dossier courant à partir du FICHIER où est écrit le code en CJS (Toutes version de Node)
process.cwd();                    // dossier depuis lequel on LANCE le process NODE en ESM et CJS

import.meta.dirname + "/views";          // ajouter le nom du dossier au bout du chemin
path.join(import.meta.dirname, "views"); // même chose mais "proprement"
```

## Extension EJS (sans quoi la vie est bien triste)

`EJS language support` par `DigitalBrainstem` à installer

Depuis n'importe quel fichier `.ejs`, vous pouvez utiliser les raccourci suivants : 

- `ejsout` ==> `<%= %>`
- `ejseach` ==> `<% array.forEach(element => { %> ... <% }) %>`
- `ejsif`
- `...`


## Architecture

Retenez qu'il n'existe pas d'architecture "parfaite".

Mix de bonnes pratiques, d'habitude, de conventions, des choix techniques, qui s'imposent selon le projet sur lequel on travail. 

Question responsabilité (SoC) : 

- **index.js** : paramétrer l'application et lancer le serveur HTTP
- **router.js** : sert d'aiguillage des différentes routes (ie `telle URL` ==> `tel méthode` de controlleur)
- **controllers.js** : analyser la requête et répondre à l'utilisateur

## Import ESM

```js
// Version 1 (import nommé)
// importer uniquement la fonction qui m'interesse du module Express
import { Router } from "express";
const router = Router();

// Version 2 (import par défaut)
// importer tout express et se servir du module Router
import express from "express"
const router = express.Router();

// Fiches pratique sur ESM
// https://gist.github.com/enzoclock/fc46aca692b914deef529b9852b257cf
```
