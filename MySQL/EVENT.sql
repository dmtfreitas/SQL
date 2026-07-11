-- SET GLOBAL - ON
SET GLOBAL event_scheduler = ON;

-- CREATE EVENT
CREATE EVENT 'event_name'
ON SCHEDULE EVERY 1 DAY
STARTS (TIMESTAMP(CURDATE(), '00:00:00'))
DO
CALL 'procedure_name'();