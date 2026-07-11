DELIMITER //

CREATE PROCEDURE 'procedure_name'()
BEGIN

	DELETE FROM 'table_name' WHERE created_at = CURRENT_DATE() - INTERVAL 0 DAY
  
END //

DELIMITER ;