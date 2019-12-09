create or replace package CUX_ITEMS_PKG_350 is

procedure disable_item_1(p_item_id number);
procedure update_item_1(p_item_id number, p_item_description varchar2,
                                          p_start_date_active date, p_end_date_active date);

procedure insert_item (p_item_number varchar2, p_item_name varchar2,p_item_description varchar2,
                                                   p_start_date_active date, p_end_date_active date);

end CUX_ITEMS_PKG_350;
/
create or replace package body CUX_ITEMS_PKG_350 is

/*
  -- Private type declarations
  type <TypeName> is <Datatype>;
  
  -- Private constant declarations
  <ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  <VariableName> <Datatype>;

  -- Function and procedure implementations
  function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
    <LocalVariable> <Datatype>;
  begin
    <Statement>;
    return(<Result>);
  end;*/
  
  
  ---失效方法
  
   procedure disable_item_1(p_item_id number) is
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
  WHEN NO_DATA_FOUND then
    dbms_output.put_line('没有找到数据');
  WHEN Order_exce then
     RAISE_APPLICATION_ERROR(-20204, '有未完成的订单');
end disable_item_1;


--修改方法 ------------


 procedure update_item_1(p_item_id number, p_item_description varchar2,
                                          p_start_date_active date, p_end_date_active date) is

  DATE_EXCE EXCEPTION;
  NULL_EXCE Exception;
  start_date date;
  end_date date;
  v_item_description CUX_ITEMS_22.ITEM_DESCRIPTION%TYPE;
  v_PUBLIC_STRING varchar2(200):=p_item_id || p_item_description || p_start_date_active || p_end_date_active;                                        
  --cursor T_CUR is select item_description,start_date_active,end_date_active  from CUX_ITEMS_22 where item_id= p_item_id ;

begin
    
select item_description,start_date_active,end_date_active  
into v_item_description,start_date,end_date
from CUX_ITEMS_22 
where item_id= p_item_id ;
   IF(v_PUBLIC_STRING is not null) THEN 
              IF( (nvl(p_start_date_active,start_date) < nvl(p_end_date_active,end_date)) 
                        or nvl(p_end_date_active,end_date) is null ) THEN
                      
              update CUX_ITEMS_22 set item_description = nvl(p_item_description,v_item_description),
                                      start_date_active =nvl(p_start_date_active,start_date),
                                      end_date_active=nvl(p_end_date_active,end_date) where item_id= p_item_id;                                 
                 ELSE 
                   RAISE DATE_EXCE;
               END IF;
           ELSE 
             RAISE NULL_EXCE; 
         END IF;
   

EXCEPTION 
   WHEN NULL_exce
               THEN RAISE_APPLICATION_ERROR (-20202,'参数全部为空');                                
   WHEN DATE_EXCE 
                THEN RAISE_APPLICATION_ERROR (-20201,'日期有误');   
end update_item_1;


---------------------插入方法----------------------------------------

  procedure insert_item (p_item_number varchar2, p_item_name varchar2,p_item_description varchar2,
                                                   p_start_date_active date, p_end_date_active date) is
date_exce exception;
add_exce exception;
old_item_number number;

begin
    
    IF(p_end_date_active < p_start_date_active) THEN RAISE date_exce;END IF;
    
    select ITEM_ID 
    into old_item_number
    from CUX_ITEMS_22
    where ITEM_NUMBER = p_item_number;
    
    if(old_item_number is not null) THEN RAISE add_exce;END IF;
    
    

EXCEPTION  
   WHEN date_exce
       THEN RAISE_APPLICATION_ERROR(-20202,' 请输入正确的日期');
   WHEN add_exce 
       THEN Raise_APPlICATION_ERROR(-20203,'已存在的物料信息');
   WHEN NO_DATA_FOUND
       THEN
           insert into CUX_ITEMS_22(ITEM_ID,ITEM_NUMBER,ITEM_NAME,ITEM_DESCRIPTION,
                             START_DATE_ACTIVE,END_DATE_ACTIVE,CREATED_BY,
                             CREATION_DATE,LAST_UPDATED_BY,LAST_UPDATE_DATE) 
                             values(CUX_ITEMS_22_S.NEXTVAL,p_item_number,p_item_name,
                                    p_item_description,p_start_date_active,p_end_date_active,
                                    1,sysdate,1,sysdate);
                                                            
       Dbms_Output.put_line(old_item_number||' : '||p_item_number||' : '||p_item_name);

end  insert_item;
  


 
end CUX_ITEMS_PKG_350;
/
