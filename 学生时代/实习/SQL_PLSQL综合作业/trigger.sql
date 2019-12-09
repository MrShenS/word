create or replace trigger tri_ins_header
before insert on CUX_PO_HEADERS_22 for each row
declare 
l_next_header_id number;
l_next_header_num number;
if :new.HEADER_ID is null
  select CUX_PO_HEADERS_22_S.Nextval 
  into l_next_header_id from dual;
  :new.HEADER_ID:=l_next_header_id;
end if;
if :new.order_number is null
  select cux_po_num_22_2.nextval 
  into l_next_header_num
  from dual;
  :new.order_number :=l_next_header_num;
end if;

if :new.created_by = -1
  :new.created_by := 22
end if;

if :new.creation_date is null
  :new.creation_date:=sysdate;
end if;

if :new.order_status is null
  :new.order_status:='unapproved';
end if;

end tri_ins_header;


CREATE OR REPLACE TRIGGER tri_ins_line
  BEFORE INSERT ON cux_po_lines_22
  FOR EACH ROW
DECLARE
  l_next_line_id NUMBER;
BEGIN
  IF :new.line_id IS NULL THEN
    SELECT cux_po_lines_22_s.nextval
      INTO l_next_line_id
      FROM dual;
  
    :new.line_id := l_next_line_id;
  END IF;
  IF :new.created_by = -1 THEN
    :new.created_by := 22;
  END IF;

  IF :new.creation_date IS NULL THEN
    :new.creation_date := SYSDATE;
  END IF;

END tri_ins_line;
