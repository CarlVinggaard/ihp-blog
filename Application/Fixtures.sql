

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('11a9bd9e-16fe-4998-9754-3f04a9eff745', 'Her er et nyt blogindlæg', 'Blogindlæg nr. 1 er altid et specielt et af slagsen.', '2021-04-28 08:36:51.760746+02');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('7fcc647a-969c-43f0-987b-fb602005f73c', 'Her er et nyt blogindlæg', 'Blogindlæg nr. 1 er altid et specielt et af slagsen.', '2021-04-28 08:36:51.761479+02');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('bdc2f071-55e9-4a67-9d52-cf4b948220f5', 'Markdown test blogpost', '# Test
## Her tester vi markdown
Ok, her er noget almindelig tekst.', '2021-04-28 17:53:32.757098+02');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body) VALUES ('73cf7178-95ee-4caa-9060-2fe3a8ad9970', 'bdc2f071-55e9-4a67-9d52-cf4b948220f5', 'carl', 'here is another comment');
INSERT INTO public.comments (id, post_id, author, body) VALUES ('f570345b-cc63-4987-830a-cdeccefbbfef', 'bdc2f071-55e9-4a67-9d52-cf4b948220f5', 'carl', 'here is a comment');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


