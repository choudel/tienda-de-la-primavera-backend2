ALTER TABLE tienda.items enable ROW level SECURITY;

CREATE policy update_item ON tienda.items FOR UPDATE TO tienda2_person USING (person_id = nullif(current_setting('jwt.claims.person_id',TRUE),'')::integer);

CREATE policy insert_item ON tienda.items FOR INSERT TO tienda2_person WITH CHECK (person_id = nullif(current_setting('jwt.claims.person_id',TRUE),'')::integer);