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
             dbms_output.put_line('�޸���Ϣ ID:'||p_vendor_id ||'��ϵ��������'|| p_contact_name||'��ϵ�˵绰'|| p_telephone
                                    ||'��ʼʱ��'|| p_start_date_active  || '����ʱ��' ||  p_end_date_active); 

           ELSE  
                raise date_exce;     
                
           END IF;
         END IF;
                                                                             
        exception 
           WHEN NULL_exce
               THEN RAISE_APPLICATION_ERROR (-20202,'����ȫ��Ϊ��');                                
           WHEN DATE_EXCE 
                THEN RAISE_APPLICATION_ERROR (-20201,'��������');         
        
 END update_vendor_1;
/
