CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE "game_genres" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "video_game_id" integer, "genre_id" integer, "video_games_id" integer NOT NULL, "genres_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_70a120c8ff"
FOREIGN KEY ("video_games_id")
  REFERENCES "video_games" ("id")
, CONSTRAINT "fk_rails_6ab7fabcf5"
FOREIGN KEY ("genres_id")
  REFERENCES "genres" ("id")
);
CREATE INDEX "index_game_genres_on_video_games_id" ON "game_genres" ("video_games_id");
CREATE INDEX "index_game_genres_on_genres_id" ON "game_genres" ("genres_id");
CREATE TABLE "genres" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "video_game_id" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE "video_games" ("id" integer NOT NULL PRIMARY KEY, "title" varchar DEFAULT NULL, "description" text DEFAULT NULL, "user_id" integer NOT NULL, "genre_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_a78344bf05"
FOREIGN KEY ("genre_id")
  REFERENCES "genres" ("id")
, CONSTRAINT "fk_rails_7836de0fd0"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_video_games_on_genre_id" ON "video_games" ("genre_id");
CREATE INDEX "index_video_games_on_user_id" ON "video_games" ("user_id");
CREATE TABLE "users" ("id" integer NOT NULL PRIMARY KEY, "email" varchar DEFAULT NULL, "password_digest" varchar DEFAULT NULL, "admin" boolean DEFAULT 0, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "username" varchar);
INSERT INTO "schema_migrations" (version) VALUES
('20210504062559'),
('20210504072555'),
('20210504072850'),
('20210504073348'),
('20210509014901'),
('20210509034813'),
('20210509035641'),
('20210509065533'),
('20210509065754'),
('20210509091403');


