CREATE TABLE `schema_migrations` (`filename` varchar(255) NOT NULL PRIMARY KEY);
CREATE TABLE `todos` (`id` integer NOT NULL PRIMARY KEY AUTOINCREMENT, `name` varchar(255) NOT NULL, `due_date` timestamp NOT NULL, `created_at` timestamp NOT NULL, `updated_at` timestamp NOT NULL);
INSERT INTO "schema_migrations" VALUES('20180623054131_create_todos.rb');