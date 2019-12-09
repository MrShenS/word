--=======================================
--用于存放供应商信息
--=======================================
drop table CUX_VENDORS_22;
create table CUX_VENDORS_22
(
       vendor_id number   primary key,                   --供应商ID
       vendor_number varchar2(30) not null,              --供应商编号
       vendor_name varchar2(100) not null,               --供应商名称
       contact_name varchar2(50),                        --联系人
       telephone varchar2(50),                           --电话
       start_date_active date,                           --生效日期
       end_date_active date,                             --失效日期
       created_by number default -1,                     --创建者
       creation_date date not null,                      --创建日期
       last_updated_by number default -1,                --更新者
       last_update_date date not null,                   --更新日期
       object_version_number number default 1,           --版本号，默认1
       attribute_category varchar2(30),                  --弹性域结构段
       attribute1 varchar2(150),                         --弹性域段
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
--创建供应商索引
--create unique index CUX_VENDORS_22_U1 on CUX_VENDORS_22(vendor_id);
create unique index CUX_VENDORS_22_U2 on CUX_VENDORS_22(vendor_number);
create unique index CUX_VENDORS_22_U3 on CUX_VENDORS_22(vendor_name);
--=======================================
--用于存放产品信息
--=======================================
create table CUX_ITEMS_22
(
       ITEM_ID number   primary key,                   --产品ID
       ITEM_NUMBER varchar2(30) not null,              --产品编号
       ITEM_NAME varchar2(100) not null,               --产品名称
       ITEM_DESCRIPTION varchar2(255),                 --产品描述
       
       start_date_active date,                           --生效日期
       end_date_active date,                             --失效日期
       created_by number default -1,                     --创建者
       creation_date date not null,                      --创建日期
       last_updated_by number default -1,                --更新者
       last_update_date date not null,                   --更新日期
       object_version_number number default 1,           --版本号，默认1
       
       attribute_category varchar2(30),                  --弹性域结构段
       attribute1 varchar2(150),                         --弹性域段
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
--创建产品索引
--create unique index CUX_ITEMS_22_U1 on CUX_ITEMS_22(ITEM_ID);
create unique index CUX_ITEMS_22_U1 on CUX_ITEMS_22(ITEM_NUMBER);
--=======================================
--采购订单头信息
--=======================================
--drop table CUX_PO_HEADERS_22;
create table CUX_PO_HEADERS_22
(
       HEADER_ID number   primary key,                 --订单头ID
       order_number number not null,                   --订单号
       vendor_id number,                               --供应商ID
       order_date date,                                --订单日期
       order_status varchar2(30),                      --订单状态
       --unapproved未审批 approved已审批 cancelled取消 closed关闭
       HEADERS_description varchar2(240),              --备注 description为关键字
       cancel_flag varchar2(1),                        --取消标志
       closed_date date,                               --关闭日期
       
       created_by number default -1,                     --创建者
       creation_date date not null,                      --创建日期
       last_updated_by number default -1,                --更新者
       last_update_date date not null,                   --更新日期
       object_version_number number default 1,           --版本号，默认1
       
       attribute_category varchar2(30),                  --弹性域结构段
       attribute1 varchar2(150),                         --弹性域段
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
--外键
alter table CUX_PO_HEADERS_22 
add constraint cux_po_headers_vendor_forkey 
foreign key (vendor_id) 
references CUX_VENDORS_22(vendor_id);
--创建订单头索引
--create unique index CUX_PO_HEADERS_22_U1 on CUX_PO_HEADERS_22(HEADER_ID);
create unique index CUX_PO_HEADERS_22_U2 on CUX_PO_HEADERS_22(ORDER_NUMBER);
create index CUX_PO_HEADERS_22_N1 on CUX_PO_HEADERS_22(VENDOR_ID);

--=======================================
--采购订单行信息
--=======================================
create table CUX_PO_LINES_22
(
       LINE_ID number   primary key,                   --订单行ID
       HEADER_ID number not null,                      --订单头ID
       LINE_NUMBER number not null,                    --行号
       ITEM_ID NUMBER not null,                        --产品ID
       UNIT_PRICE NUMBER,                              --单价
       QUANTITY NUMBER,                                --数量
       LINES_description varchar2(240),                 --备注 description为关键字
       
       created_by number default -1,                     --创建者
       creation_date date not null,                      --创建日期
       last_updated_by number default -1,                --更新者
       last_update_date date not null,                   --更新日期
       object_version_number number default 1,           --版本号，默认1
       
       attribute_category varchar2(30),                  --弹性域结构段
       attribute1 varchar2(150),                         --弹性域段
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
--添加外键
alter table CUX_PO_LINES_22 
add constraint CUX_PO_LINES_ITEM_forkey 
foreign key (ITEM_ID) 
references CUX_ITEMS_22(ITEM_ID);

alter table CUX_PO_LINES_22 
add constraint CUX_PO_LINES_HEADER_forkey 
foreign key (HEADER_ID) 
references CUX_PO_HEADERS_22(HEADER_ID);
--创建订单订单行索引 
--create unique index CUX_PO_LINES_22_U1 on CUX_PO_LINES_22(LINE_ID);
create unique index CUX_PO_LINES_22_U2 on CUX_PO_LINES_22(HEADER_ID,LINE_NUMBER);
create index CUX_PO_LINE22_N1 on CUX_PO_LINES_22(HEADER_ID);
create index CUX_PO_LINE22_N2 on CUX_PO_LINES_22(ITEM_ID);


--创建序列
create sequence cux_vendors_22_s start with 1;           --用于生成CUX_VENDORS_22.VENDOR_ID
create sequence cux_items_22_s start with 1;             --用于生成CUX_ITEMS_22.ITEM_ID
create sequence cux_po_num_22_2 start with 10000;        --用于生成CUX_PO_HEADERS_22.ORDER_NUMBER
create sequence CUX_PO_HEADERS_22_S start with 1;        --用于生成CUX_PO_HEADERS_22.HEADER_ID
create sequence CUX_PO_LINES_22_S start with 1;          --用于生成CUX_PO_LINES_22.LINE_ID


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
