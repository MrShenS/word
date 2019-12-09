--=======================================
--���ڴ�Ź�Ӧ����Ϣ
--=======================================
drop table CUX_VENDORS_22;
create table CUX_VENDORS_22
(
       vendor_id number   primary key,                   --��Ӧ��ID
       vendor_number varchar2(30) not null,              --��Ӧ�̱��
       vendor_name varchar2(100) not null,               --��Ӧ������
       contact_name varchar2(50),                        --��ϵ��
       telephone varchar2(50),                           --�绰
       start_date_active date,                           --��Ч����
       end_date_active date,                             --ʧЧ����
       created_by number default -1,                     --������
       creation_date date not null,                      --��������
       last_updated_by number default -1,                --������
       last_update_date date not null,                   --��������
       object_version_number number default 1,           --�汾�ţ�Ĭ��1
       attribute_category varchar2(30),                  --������ṹ��
       attribute1 varchar2(150),                         --�������
       attribute2 varchar2(150),
       attribute3 varchar2(150),
       attribute4 varchar2(150),
       attribute5 varchar2(150),
       attribute6 varchar2(150),
       attribute7 varchar2(150),
       attribute8 varchar2(150),
       attribute9 varchar2(150),
       attribute10 varchar2(150),
       attribute11 varchar2(150),
       attribute12 varchar2(150),
       attribute13 varchar2(150),
       attribute14 varchar2(150),
       attribute15 varchar2(150)
       )
       ;
--������Ӧ������
--create unique index CUX_VENDORS_22_U1 on CUX_VENDORS_22(vendor_id);
create unique index CUX_VENDORS_22_U2 on CUX_VENDORS_22(vendor_number);
create unique index CUX_VENDORS_22_U3 on CUX_VENDORS_22(vendor_name);
--=======================================
--���ڴ�Ų�Ʒ��Ϣ
--=======================================
create table CUX_ITEMS_22
(
       ITEM_ID number   primary key,                   --��ƷID
       ITEM_NUMBER varchar2(30) not null,              --��Ʒ���
       ITEM_NAME varchar2(100) not null,               --��Ʒ����
       ITEM_DESCRIPTION varchar2(255),                 --��Ʒ����
       
       start_date_active date,                           --��Ч����
       end_date_active date,                             --ʧЧ����
       created_by number default -1,                     --������
       creation_date date not null,                      --��������
       last_updated_by number default -1,                --������
       last_update_date date not null,                   --��������
       object_version_number number default 1,           --�汾�ţ�Ĭ��1
       
       attribute_category varchar2(30),                  --������ṹ��
       attribute1 varchar2(150),                         --�������
       attribute2 varchar2(150),
       attribute3 varchar2(150),
       attribute4 varchar2(150),
       attribute5 varchar2(150),
       attribute6 varchar2(150),
       attribute7 varchar2(150),
       attribute8 varchar2(150),
       attribute9 varchar2(150),
       attribute10 varchar2(150),
       attribute11 varchar2(150),
       attribute12 varchar2(150),
       attribute13 varchar2(150),
       attribute14 varchar2(150),
       attribute15 varchar2(150)
       );
--������Ʒ����
--create unique index CUX_ITEMS_22_U1 on CUX_ITEMS_22(ITEM_ID);
create unique index CUX_ITEMS_22_U1 on CUX_ITEMS_22(ITEM_NUMBER);
--=======================================
--�ɹ�����ͷ��Ϣ
--=======================================
--drop table CUX_PO_HEADERS_22;
create table CUX_PO_HEADERS_22
(
       HEADER_ID number   primary key,                 --����ͷID
       order_number number not null,                   --������
       vendor_id number,                               --��Ӧ��ID
       order_date date,                                --��������
       order_status varchar2(30),                      --����״̬
       --unapprovedδ���� approved������ cancelledȡ�� closed�ر�
       HEADERS_description varchar2(240),              --��ע descriptionΪ�ؼ���
       cancel_flag varchar2(1),                        --ȡ����־
       closed_date date,                               --�ر�����
       
       created_by number default -1,                     --������
       creation_date date not null,                      --��������
       last_updated_by number default -1,                --������
       last_update_date date not null,                   --��������
       object_version_number number default 1,           --�汾�ţ�Ĭ��1
       
       attribute_category varchar2(30),                  --������ṹ��
       attribute1 varchar2(150),                         --�������
       attribute2 varchar2(150),
       attribute3 varchar2(150),
       attribute4 varchar2(150),
       attribute5 varchar2(150),
       attribute6 varchar2(150),
       attribute7 varchar2(150),
       attribute8 varchar2(150),
       attribute9 varchar2(150),
       attribute10 varchar2(150),
       attribute11 varchar2(150),
       attribute12 varchar2(150),
       attribute13 varchar2(150),
       attribute14 varchar2(150),
       attribute15 varchar2(150)
       )
       ;
--���
alter table CUX_PO_HEADERS_22 
add constraint cux_po_headers_vendor_forkey 
foreign key (vendor_id) 
references CUX_VENDORS_22(vendor_id);
--��������ͷ����
--create unique index CUX_PO_HEADERS_22_U1 on CUX_PO_HEADERS_22(HEADER_ID);
create unique index CUX_PO_HEADERS_22_U2 on CUX_PO_HEADERS_22(ORDER_NUMBER);
create index CUX_PO_HEADERS_22_N1 on CUX_PO_HEADERS_22(VENDOR_ID);

--=======================================
--�ɹ���������Ϣ
--=======================================
create table CUX_PO_LINES_22
(
       LINE_ID number   primary key,                   --������ID
       HEADER_ID number not null,                      --����ͷID
       LINE_NUMBER number not null,                    --�к�
       ITEM_ID NUMBER not null,                        --��ƷID
       UNIT_PRICE NUMBER,                              --����
       QUANTITY NUMBER,                                --����
       LINES_description varchar2(240),                 --��ע descriptionΪ�ؼ���
       
       created_by number default -1,                     --������
       creation_date date not null,                      --��������
       last_updated_by number default -1,                --������
       last_update_date date not null,                   --��������
       object_version_number number default 1,           --�汾�ţ�Ĭ��1
       
       attribute_category varchar2(30),                  --������ṹ��
       attribute1 varchar2(150),                         --�������
       attribute2 varchar2(150),
       attribute3 varchar2(150),
       attribute4 varchar2(150),
       attribute5 varchar2(150),
       attribute6 varchar2(150),
       attribute7 varchar2(150),
       attribute8 varchar2(150),
       attribute9 varchar2(150),
       attribute10 varchar2(150),
       attribute11 varchar2(150),
       attribute12 varchar2(150),
       attribute13 varchar2(150),
       attribute14 varchar2(150),
       attribute15 varchar2(150)
       );
--������
alter table CUX_PO_LINES_22 
add constraint CUX_PO_LINES_ITEM_forkey 
foreign key (ITEM_ID) 
references CUX_ITEMS_22(ITEM_ID);

alter table CUX_PO_LINES_22 
add constraint CUX_PO_LINES_HEADER_forkey 
foreign key (HEADER_ID) 
references CUX_PO_HEADERS_22(HEADER_ID);
--������������������ 
--create unique index CUX_PO_LINES_22_U1 on CUX_PO_LINES_22(LINE_ID);
create unique index CUX_PO_LINES_22_U2 on CUX_PO_LINES_22(HEADER_ID,LINE_NUMBER);
create index CUX_PO_LINE22_N1 on CUX_PO_LINES_22(HEADER_ID);
create index CUX_PO_LINE22_N2 on CUX_PO_LINES_22(ITEM_ID);


--��������
create sequence cux_vendors_22_s start with 1;           --��������CUX_VENDORS_22.VENDOR_ID
create sequence cux_items_22_s start with 1;             --��������CUX_ITEMS_22.ITEM_ID
create sequence cux_po_num_22_2 start with 10000;        --��������CUX_PO_HEADERS_22.ORDER_NUMBER
create sequence CUX_PO_HEADERS_22_S start with 1;        --��������CUX_PO_HEADERS_22.HEADER_ID
create sequence CUX_PO_LINES_22_S start with 1;          --��������CUX_PO_LINES_22.LINE_ID


--������ͼ
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
