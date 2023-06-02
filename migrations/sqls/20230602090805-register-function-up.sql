create function tienda.register_user (name text, email text,password text)
RETURNS tienda.user 
AS $$
DECLARE
person tienda.user;
BEGIN
INSERT INTO tienda.user (name,email)
VALUES(name,email)
RETURNING
* INTO person;
INSERT INTO tienda_private.user_account(user_id, email, password_hash) VALUES (person.id , email, crypt(password,gen_salt('bf')));
RETURN person;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;