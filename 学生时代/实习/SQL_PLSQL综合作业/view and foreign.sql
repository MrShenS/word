

--外键
alter table CUX_PO_HEADERS_22 
add constraint cux_po_headers_vendor_forkey 
foreign key (vendor_id) 
references CUX_VENDORS_22(vendor_id);

--添加外键
alter table CUX_PO_LINES_22 
add constraint CUX_PO_LINES_ITEM_forkey 
foreign key (ITEM_ID) 
references CUX_ITEMS_22(ITEM_ID);

alter table CUX_PO_LINES_22 
add constraint CUX_PO_LINES_HEADER_forkey 
foreign key (HEADER_ID) 
references CUX_PO_HEADERS_22(HEADER_ID);

--创建视图
create or replace view CUX_PO_HEADERS_22_V as
SELECT headers.*,vendors.vendor_number,vendors.vendor_name
  FROM cux_po_headers_22 headers,
       cux_vendors_22    vendors
 WHERE headers.vendor_id = vendors.vendor_id;

create or replace view CUX_PO_LINES_22_V as
select line.*,
item.item_number,
item.item_name,
item.item_description,
line.unit_price*line.quantity amount
from CUX_PO_LINES_22 line,CUX_ITEMS_22 item 
where line.item_id = item.item_id;
