create or replace procedure update_vendor(
        p_vendor_id number, 
        p_contact_name varchar2, 
        p_telephone varchar2, 
        p_start_date_active date, 
        p_end_date_active date) 
        is 
        e_e1 exception;
        cursor emp_cursor(c_vendor_id number) is select contact_name,telephone,start_date_active,end_date_active,object_version_number from cux_vendors_22 where vendor_id=c_vendor_id;
       begin
        if (p_vendor_id||p_contact_name||p_telephone||p_start_date_active||p_end_date_active) is null then 
          raise e_e1;
        else 
            for emp_record in emp_cursor(p_vendor_id) loop
                update cux_vendors_22 set contact_name=nvl(p_contact_name,emp_record.contact_name),telephone=nvl(p_telephone,emp_record.telephone),start_date_active=nvl(p_start_date_active,emp_record.start_date_active),end_date_active=nvl(p_end_date_active,emp_record.end_date_active),last_update_date=sysdate,object_version_number=emp_record.object_version_number+1 where vendor_id=p_vendor_id;
                dbms_output.put_line('current insert records:'||sql%rowcount||'now id');
            end loop;
        end if;
       exception
          when no_data_found then dbms_output.put_line('no data found');
          when too_many_rows then dbms_output.put_line('too many data');
          when e_e1 then dbms_output.put_line('È«Îª¿Õ');
       end update_vendor;
/
