create or replace procedure insert_po_header_1(p_vendor_number varchar2, p_description
varchar2)  is     
V_Vendor_Id Cux_Vendors_22.Vendor_Id%TYpe;
--v_HEADER_ID Cux_Po_Headers_22.Header_Id%type;
   BEGIN     
       select Vendor_Id into V_Vendor_Id 
       from  Cux_Vendors_22 
       where Vendor_Number=p_vendor_number;
       
       insert into Cux_Po_Headers_22
      (HEADER_ID ,
       order_number ,
       vendor_id,
        order_date ,
       order_status,
         HEADERS_description , 
       CREATED_BY,
       CREATION_DATE,
       LAST_UPDATED_BY,
       LAST_UPDATE_DATE)
    values
      (Cux_Po_Headers_22_s.Nextval,
       Cux_Po_Num_22_2.Nextval,
       V_Vendor_Id,
       sysdate,
       'UNAPPROVED',
       p_description,
       1,
       SYSDATE,
       1,
       SYSDATE
       );
      -- select HEADER_ID from cux_po_headers_22 where 
       dbms_output.put_line('订单描述：' || p_description);
               
  
EXCEPTION
  WHEN NO_DATA_FOUND then  dbms_output.put_line('供应商信息不正确');


end insert_po_header_1;
/
