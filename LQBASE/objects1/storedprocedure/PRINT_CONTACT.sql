CREATE OR REPLACE PROCEDURE print_contact(in_customer_id NUMBER)
IS r_contact contacts%ROWTYPE;

BEGIN

  SELECT *
  INTO r_contact
  FROM contacts
  WHERE customer_id = in_customer_id;
  
  dbms_output.put_line( r_contact.first_name || ' ' ||
  r_contact.last_name || '<' || r_contact.email ||'>' );

EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( SQLERRM );
END;