create or replace procedure insert_po_line
(p_header_id number, p_item_id number,
p_quantity number, p_price number,p_description varchar2) is

--p_header_id cux_po_headers_22.header_id%type;
h_ID_num number;
h_ID_num_exce Exception;
v_item_number number;
item_number_exce EXCEPTION;
quantity_price_exce EXCEPTION;
line_number number := 0;

begin
  select count(*) 
  into h_ID_num
  from Cux_Po_Headers_22 
  where header_id =p_header_id;
  
  select count(*) 
  into v_item_number
  from CUX_ITEMS_22 
  where item_id =p_item_id;
  
    IF(h_ID_num = 0)
       THEN    raise h_ID_num_exce;
    elsIF(v_item_number =0) 
       THEN raise item_number_exce;
    elsIF(p_quantity>0 and p_price>0)
       then raise quantity_price_exce;
    end if;   
    
  insert into Cux_Po_Lines_22 (LINE_ID,HEADER_ID,LINE_NUMBER,ITEM_ID,
                               UNIT_PRICE,QUANTITY,LINES_description,
                               CREATED_BY, CREATION_DATE,LAST_UPDATED_BY,
                               LAST_UPDATE_DATE)
                               values(Cux_Po_Lines_22_s.Nextval,
                                      p_header_id,line_number+1,
                                      p_item_id,p_price,p_quantity
                                      ,p_description,1,SYSDATE,1,SYSDATE);
       



EXCEPTION 
  WHEN h_ID_num_exce then DBMS_OUTPUT.put_line('提供的订单号不存在');
  WHEN item_number_exce  then Dbms_Output.put_line('提供的物料号不存在');
  WHEN quantity_price_exce then Dbms_Output.put_line('请提供物料数量和单价');
end insert_po_line;
/
