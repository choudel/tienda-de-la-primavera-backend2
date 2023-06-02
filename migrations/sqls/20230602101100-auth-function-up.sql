CREATE FUNCTION tienda.authenticate (email text, password text)
  RETURNS tienda.jwt
  AS $$
DECLARE
  account tienda_private.user_account;
BEGIN
  SELECT
    * INTO account
  FROM
    tienda_private.user_account
  WHERE
    user_account.email = authenticate.email;
  IF account.password_hash = crypt(password, account.password_hash) THEN
    RETURN ('tienda2_person',
      account.user_id,
      extract(epoch FROM (now() + interval '30 days')))::tienda.jwt;
  ELSE
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;