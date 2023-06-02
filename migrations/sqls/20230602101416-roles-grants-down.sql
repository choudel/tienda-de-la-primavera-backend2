REVOKE ALL privileges ON TABLE tienda.user FROM tienda2_person;
REVOKE SELECT, INSERT, UPDATE ( id, item, lot, arrival_date, out_of_stock_date, price, sell_text) ON TABLE tienda.items FROM tienda2_person;

REVOKE EXECUTE ON FUNCTION tienda.register_user (text,text,text) FROM tienda2_anonymous;
REVOKE EXECUTE ON FUNCTION tienda.authenticate (text, text) FROM tienda2_anonymous, tienda2_person;

REVOKE usage ON SCHEMA tienda FROM tienda2_anonymous, tienda2_person;

ALTER DEFAULT privileges GRANT EXECUTE ON functions TO public;