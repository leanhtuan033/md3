create database if not exists QuanLyBanHang;

use QuanLyBanHang;
create table Customer (
    cID int primary key auto_increment,
    cName varchar(50) not null,
    cAge int
);
create table Product (
    pID int primary key auto_increment,
    pName varchar(50) not null,
    pPrice decimal(15,2) not null
);
create table `Order` (
    oID int primary key auto_increment,
    cID int not null,
    oDate date not null,
    oTotalPrice decimal(15,2) default 0,

    constraint fk_order_customer
        foreign key (cID)
        references Customer(cID)
);
create table OrderDetail (
    oID int not null,
    pID int not null,
    odQTY int not null,

    primary key (oID, pID),

    constraint fk_orderdetail_order
        foreign key (oID)
        references `Order`(oID),

    constraint fk_orderdetail_product
        foreign key (pID)
        references Product(pID),

    constraint chk_quantity
        check (odQTY > 0)
);
show tables







