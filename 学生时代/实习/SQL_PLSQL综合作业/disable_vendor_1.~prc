create or replace procedure disable_vendor_1(p_vendor_id number) is
  v_end_date date;
  
  date_EXCE exception;
  Order_exce exception;
  v_Order_Status Cux_Po_Headers_22.Order_Status%type;
begin
 
select Order_Status 
into v_Order_Status
from Cux_Po_Headers_22
where VENDOR_ID=p_vendor_id;  

  select End_Date_Active
    into v_end_date
    from Cux_Vendors_22
   where vendor_id = p_vendor_id;

 

  IF (v_end_date < sysdate) then
       IF(v_Order_Status <> 'CANCELLED' or v_Order_Status <>  'CLOSED') 
          then  raise Order_exce;
        END IF;
    update CUX_VENDORS_22
       set End_Date_Active = sysdate
     where vendor_id = p_vendor_id;
    dbms_output.put_line(p_vendor_id || '供货商出局');
  end if;  

EXCEPTION
  WHEN NO_DATA_FOUND then
    RAISE_APPLICATION_ERROR(-20203, '数据缺失');
  WHEN Order_exce then
     RAISE_APPLICATION_ERROR(-20204, '有未完成的订单');
end disable_vendor_1;
/
