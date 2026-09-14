create database if not exists quanly_vattu;
use quanly_vattu ;
create table if not exists NHACC(
MaNCC int primary key auto_increment,
TenNCC varchar(50),
DiaChi varchar(100),
SDT varchar(15)
);
create table if not exists VATTU(
MaVTU int primary key auto_increment,
TenVTU varchar(50)
);
create table if not exists PHIEUXUAT(
SoPX int primary key auto_increment,
NgayXuat date
);
create table if not exists PHIEUNHAP(
SoPN int primary key auto_increment,
NgayNhap date
);
create table if not exists DONHD(
SoDH int primary key auto_increment,
NgayDH date,
MaNCC int,
foreign key (MaNCC) references NHACC(MaNCC)
);
create table if not exists CHITIETPHIEUXUAT(
SoPX int,
MaVTU int,
DGXuat decimal(15,2),
SLXuat int,
primary key (SoPX, MaVTU),
foreign key (SoPX) references PHIEUXUAT(SoPX),
foreign key (MaVTU) references VATTU(MaVTU)
);
create table if not exists CHITIETPHIEUNHAP(
SoPN int,
MaVTU int,
DGNhap decimal(15,2),
SLNhap int,
primary key (SoPN, MaVTU),
foreign key (SoPN) references PHIEUNHAP(SoPN),
foreign key (MaVTU) references VATTU(MaVTU)
);
create table if not exists CHITIETDONHANG (
    SoDH int,
    MaVTU int,
    primary key (SoDH, MaVTU),
    foreign key (SoDH) references  DONHD(SoDH),
    foreign key (MaVTU) references VATTU(MaVTU)
);
use quanly_vattu;

show tables;




