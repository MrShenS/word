/*
create or replace trigger updateTrigger
  before update on cux_vendors_22  
  for each row
declare
  -- local variables here
begin
  
end updateTrigger;
*/


create or replace trigger updateTrigger
before update of end_date_active,start_date_active on cux_vendors_22
for each row
declare
e_e2 exception;
begin
  if (nvl(:new.end_date_active,:old.end_date_active)>nvl(:new.start_date_active,:old.start_date_active)) then
      dbms_output.put_line('日期正常');
    else 
      raise e_e2;
    end if;
    exception
      when e_e2 then dbms_output.put_line('日期错误');
end updateTrigger;
/
