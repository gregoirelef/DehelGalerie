BEGIN;


-- Pour aider les Windows Users ;-) 
SET client_encoding TO 'UTF8';

DROP TABLE IF EXISTS "dessins", "artiste", "user", "role", "category", "oeuvre", "subcategory", "category_has_subcategory";

CREATE TABLE "user" (
  "id" INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "firstname" VARCHAR(100) NOT NULL,
  "lastname" VARCHAR(100) NOT NULL,
  "email" VARCHAR(100) NOT NULL,
  "password" TEXT UNIQUE,
  "role_id" integer NOT NULL REFERENCES "role"("id"),
  "created_at" TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "role" (
  "id" INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "name" VARCHAR(100) NOT NULL,
  "created_at" TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "category" (
  "id" INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "name" VARCHAR(100) NOT NULL,
  "created_at" TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "subcategory" (
  "id" INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "name" VARCHAR(100) NOT NULL,
  "created_at" TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "oeuvre" (
  "id" INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "title" VARCHAR(100) NOT NULL UNIQUE,
  "id_number" INTEGER UNIQUE,
  "subject" TEXT,
  "realise_at" TIMESTAMPTZ,
  "size" TEXT NOT NULL,
  "signed" BOOLEAN NOT NULL,
  "url_picture" TEXT NOT NULL UNIQUE,
  "category_id" integer NOT NULL REFERENCES "category"("id"),
  "subcategory_id" integer NOT NULL REFERENCES "subcategory"("id"),
  "author_id" integer NOT NULL REFERENCES "user"("id"),
  "created_at" TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "category_has_subcategory" (
  "Category_id" INTEGER NOT NULL REFERENCES "category"("id") ON DELETE CASCADE,
  "subcategory_id" INTEGER NOT NULL REFERENCES "subcategory"("id") ON DELETE CASCADE,
  PRIMARY KEY ("Category_id", "subcategory_id"),
  "created_at" TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

COMMIT;







