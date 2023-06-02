CREATE TABLE tienda.items (
  id SERIAL PRIMARY KEY,
  item TEXT NOT NULL,
  lot TEXT,
  arrival_date DATE,
  out_of_stock_date DATE,
  price NUMERIC NOT NULL,
  sell_text TEXT NOT NULL,
  image TEXT
);