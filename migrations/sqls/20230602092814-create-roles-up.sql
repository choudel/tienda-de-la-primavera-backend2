CREATE ROLE tienda2_postgraphile LOGIN PASSWORD 'secret_password';
CREATE ROLE tienda2_anonymous;
GRANT tienda2_anonymous TO tienda2_postgraphile;
CREATE ROLE tienda2_person;
GRANT tienda2_person TO tienda2_postgraphile;