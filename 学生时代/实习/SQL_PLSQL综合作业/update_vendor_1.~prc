create or replace procedure update_vendor_1(p_vendor_id number, p_contact_name varchar2,
                                            p_telephone varchar2, p_start_date_active date, 
                                            p_end_date_active date) is
        -- v_END_DATE date;
         NULL_exce Exception; 
         DATE_EXCE exception;                      
begin
     
 IF( p_vendor_id is NULL and  p_contact_name is NULL and  p_telephone is NULL and  p_start_date_active is NULL
         and p_end_date_active  is NULL )
         THEN RAISE NULL_exce;
       ELSE
          IF(p_end_date_active > p_start_date_active or p_end_date_active is null) then 
            
            
            update Cux_Vendors_22 
            set CONTACT_NAME = p_contact_name ,Telephone=p_telephone,
                                      START_DATE_ACTIVE = p_start_date_active,End_Date_Active = p_end_date_active
                                      where VENDOR_ID = p_vendor_id;
             dbms_output.put_line('修改信息 ID:'||p_vendor_id ||'联系人姓名：'|| p_contact_name||'联系人电话'|| p_telephone
                                    ||'开始时间'|| p_start_date_active  || '结束时间' ||  p_end_date_active); 

           ELSE  
                raise date_exce;     
                
           END IF;
         END IF;
                                                                             
        exception 
           WHEN NULL_exce
               THEN RAISE_APPLICATION_ERROR (-20202,'参数全部为空');                                
           WHEN DATE_EXCE 
                THEN RAISE_APPLICATION_ERROR (-20201,'日期有误');         
        
 END update_vendor_1;
/
