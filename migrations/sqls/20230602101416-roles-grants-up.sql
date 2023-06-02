ALTER DEFAULT privileges REVOKE EXECUTE ON functions FROM public;

GRANT usage ON SCHEMA tienda TO tienda2_anonymous, tienda2_person;

GRANT EXECUTE ON FUNCTION tienda.register_user (text,text,text) TO tienda2_anonymous;
GRANT EXECUTE ON FUNCTION tienda.authenticate (text, text) TO tienda2_anonymous, tienda2_person;


GRANT ALL privileges ON TABLE tienda.user TO tienda2_person;
GRANT SELECT, INSERT, UPDATE ( id, item, lot, arrival_date, out_of_stock_date, price, sell_text) ON TABLE tienda.items TO tienda2_person;