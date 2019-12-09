create or replace procedure disable_item_1(p_item_id number) is
 v_end_date date;
  
  date_EXCE exception;
  Order_exce exception;
  v_Order_Status Cux_Po_Headers_22.Order_Status%type;
begin
 
select Order_Status 
into v_Order_Status
from Cux_Po_Headers_22
where VENDOR_ID= (select VENDOR_ID 
                  from CUX_ITEMS_22 
                  where ITEM_ID= p_item_id); 

  select End_Date_Active
    into v_end_date
    from CUX_ITEMS_22
   where item_id = p_item_id;

 

  IF (v_end_date < sysdate) then
       IF(v_Order_Status <> 'CANCELLED' or v_Order_Status <>  'CLOSED') 
          then  raise Order_exce;
        END IF;
    update CUX_ITEMS_22
       set End_Date_Active = sysdate
       where  item_id = p_item_id;
    dbms_output.put_line(p_item_id || '供货商出局');
  end if;  

EXCEPTION
  WHEN date_EXCE then
    RAISE_APPLICATION_ERROR(-20203, '结束日期超时');
  WHEN Order_exce then
     RAISE_APPLICATION_ERROR(-20204, '有未完成的订单');
end disable_item_1;
/
