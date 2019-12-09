create or replace procedure insert_vendor_1(p_vendor_number     varchar2,
                                              p_vendor_name       varchar2,
                                              p_contact_name      varchar2,
                                              p_telephone         varchar2,
                                              p_start_date_active date,
                                              p_end_date_active   date) IS
   -- P_VENDOR_ID NUMBER;
    DATE_EXCEPTION EXCEPTION;
    v_ID number ;
   BEGIN
    IF p_start_date_active > p_end_date_active THEN
      RAISE DATE_EXCEPTION;
    END IF;
    insert into CUX_VENDORS_22
      (VENDOR_ID,
       VENDOR_NUMBER,
       VENDOR_NAME,
       CONTACT_NAME,
       TELEPHONE,
       Start_Date_Active,
       End_Date_Active,
       CREATED_BY,
       CREATION_DATE,
       LAST_UPDATED_BY,
       LAST_UPDATE_DATE)
    values
      (cux_vendors_22_s.nextval,
       p_vendor_number,
       p_vendor_name,
       p_contact_name,
       p_telephone,
       p_start_date_active,
       p_end_date_active,
       1,
       SYSDATE,
       1,
       SYSDATE
       );
       
       select Vendor_Id into v_id from CUX_VENDORS_22 where VENDOR_NAME=p_vendor_name;
       
       DBMS_OUTPUT.PUT_LINE('成功插入'||SQL%ROWCOUNT|| '条记录，ID 为：'|| v_id);
       
       
       EXCEPTION 
         WHEN DATE_EXCEPTION THEN RAISE_APPLICATION_ERROR (-20201,'DATE EXCEPTON');
       
       
       
       
       
  END insert_vendor_1;
/
