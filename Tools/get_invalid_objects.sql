SELECT 'Invalid Object', object_type, object_name FROM dba_objects WHERE status != 'VALID' AND owner = 'HR_CI_BUILD' ORDER BY object_type; 
