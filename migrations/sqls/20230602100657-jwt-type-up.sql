CREATE TYPE tienda.jwt AS (
    role text,
    person_id integer,
    exp bigint
);