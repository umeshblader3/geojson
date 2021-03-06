ALTER TABLE TABLE_B DROP CONSTRAINT fk__TABLE_B__TABLE_A_FOR_id_a;
ALTER TABLE TABLE_B DROP CONSTRAINT fk__TABLE_B__TABLE_A_FOR_id_b;
ALTER TABLE TABLE_B DROP CONSTRAINT fk__TABLE_B__TABLE_A_FOR_id_c;

ALTER TABLE TABLE_B ADD CONSTRAINT fk__TABLE_B__TABLE_A_FOR_id_a FOREIGN KEY (id_a) REFERENCES TABLE_A (id) ON DELETE CASCADE;
ALTER TABLE TABLE_B ADD CONSTRAINT fk__TABLE_B__TABLE_A_FOR_id_b FOREIGN KEY (id_b) REFERENCES TABLE_A (id) ON DELETE CASCADE;
ALTER TABLE TABLE_B ADD CONSTRAINT fk__TABLE_B__TABLE_A_FOR_id_c FOREIGN KEY (id_c) REFERENCES TABLE_A (id) ON DELETE CASCADE;

DELETE FROM TABLE_A WHERE EXISTS (SELECT * FROM TABLE_B WHERE TABLE_A.id = TABLE_B.id_a OR TABLE_A.id = TABLE_B.id_b OR TABLE_A.id = TABLE_B.id_c);