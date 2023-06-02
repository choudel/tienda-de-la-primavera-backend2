DROP policy IF EXISTS insert_item ON tienda.items;
DROP policy IF EXISTS update_item ON tienda.items;

ALTER TABLE tienda.items DISABLE ROW level SECURITY;
