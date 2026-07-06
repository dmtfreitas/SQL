-- ALTER TABLE - MODIFY
ALTER TABLE 'table_name' MODIFY 'column_name' 'type_of_data';

-- ALTER TABLE - ADD COLUMN
ALTER TABLE 'table_name' ADD COLUMN 'column_name' 'type_of_data';

-- ALTER TABLE - ADD COLUMN AFTER
ALTER TABLE 'table_name' ADD COLUMN 'column_name' 'type_of_data' AFTER 'column_name';

-- ALTER TABLE - DROP COLUMN
ALTER TABLE 'table_name' DROP COLUMN 'column_name';

-- ALTER USER - IDENTIFIED BY
ALTER USER 'user'@'localhost' IDENTIFIED BY 'new_password';

-- ALTER USER IDENTIFIED VIA mysql_native_password USING PASSWORD()
ALTER USER 'user'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('new_password');