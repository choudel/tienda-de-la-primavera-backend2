create table tienda_private.user_account(
    user_id integer PRIMARY KEY REFERENCES tienda.user(id) ON DELETE CASCADE,
    email text NOT NULL UNIQUE CHECK (email ~* '^.+@.+\..+$'),
    password_hash text NOT NULL
);

create index user_account_email_idx ON tienda_private.user_account (email);