
USE master;  
GO  

CREATE DATABASE nhaphang
go
use nhaphang
go

--Tạo bảng NHACUNGCAP
Create table NHACUNGCAP
(
	MaNCC	char(6),
	TenNCC	Nvarchar(50),
	DiaChi	Nvarchar(100),
	Sdt	varchar(15),
	primary key(MaNCC)
)
go

--Tạo bảng HANGHOA
Create table HANGHOA
(
	MaHH	varchar(10),
	TenHH	Nvarchar(100),
	DonVi	Nvarchar(10),
	DonGia	numeric(15,0),
	primary key(MaHH)
)
go

--Tạo bảng NHAP 
Create table NHAP
(
	MaHDN	varchar(10),
	MaNCC	char(6),
	NgayLapHD	date,
	TongTien varchar(20),
	primary key(MaHDN),
	foreign key (MaNCC) references NHACUNGCAP
)
go

--Tạo bảng NHAP_CHITIET 
Create table NHAP__CHITIET
(
	MaHDN	varchar(10),
	MaHH	varchar(10),
	SoLuong	int,
	ThanhTien numeric(15,0),
	primary key(MaHDN),
	foreign key (MaHDN) references NHAP,
	foreign key (MaHH) references HANGHOA
)
go


--DROP table NHAP_CHITIET
--DROP table NHAP
--DROP table HANGHOA
--DROP table NHANVIEN

insert into NHACUNGCAP values('NCC001',N'Công ty TNHH Lê Dũng',N'29 Trần Hưng Đạo, Phường 1, Đông Hà, Quảng trị','02333555889')
insert into NHACUNGCAP values('NCC002',N'Công ty TNHH Phát Triển Công Nghệ Điện Tử',N'101 Trần Hưng Đạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng','3821671')
insert into NHACUNGCAP values('NCC003',N'Công ty TNHH Điện Tử Hoàn Kiếm',N'31 Xuân Diệu, Quảng An, Tây Hồ, Hà Nội','02322342334')
insert into NHACUNGCAP values('NCC004',N'Công ty Hằng Hữu',N'29 Trần Hưng Đạo, Phường 1, Đông Hà, Quảng trị','02757434783')
insert into NHACUNGCAP values('NCC005',N'Công ty Tịnh Thất Bồng Lai',N'101 Châu Thị Vĩnh Tế, Mỹ An, Ngũ Hành Sơn, Đà Nẵng','02334655569')
select * from NHACUNGCAP

insert into HANGHOA values ('HH0011',N'Tủ đông SANAKY',N'Cái',4000000)
insert into HANGHOA values ('HH0012',N'Máy mát SANAKY',N'Cái',7000000)
insert into HANGHOA values ('HH0013',N'Máy giặt SANAKY',N'Cái',5000000)
insert into HANGHOA values ('HH0014',N'Máy sấy ',N'Cái',6000000)
insert into HANGHOA values ('HH0015',N'Tivi Samsung',N'Chiếc',12000000)
insert into HANGHOA values ('HH0016',N'Dịch vụ máy chủ ',N'Dịch vụ',300000)
select * from HANGHOA

insert into NHAP__CHITIET values ('HDN001','HH0011',3,0)
insert into NHAP__CHITIET values ('HDN001','HH0012',2,0)
insert into NHAP__CHITIET values ('HDN002','HH0013',4,0)
insert into NHAP__CHITIET values ('HDN003','HH0014',5,0)
insert into NHAP__CHITIET values ('HDN004','HH0015',2,0)
insert into NHAP__CHITIET values ('HDN005','HH0016',6,0)
select * from NHAP__CHITIET
update NHAP__CHITIET
set ThanhTien=Dongia*soluong
from NHAP__CHITIET join HANGHOA on NHAP__CHITIET.MaHH=HANGHOA.MaHH


insert into NHAP values ('HDN001','NCC001','2021/12/27',0)
insert into NHAP values ('HDN002','NCC002','2021/01/31',0)
insert into NHAP values ('HDN003','NCC003','2020/06/16',0)
insert into NHAP values ('HDN004','NCC004','2020/06/13',0)
insert into NHAP values ('HDN005','NCC005','2021/01/16',0)
select * from NHAP													   


update NHAP
set TongTien=thanhtien
from NHAP join NHAP__CHITIET on NHAP.MaHDN=NHAP__CHITIET.MaHDN

select * from NHACUNGCAP
select * from HANGHOA
select * from NHAP__CHITIET
select * from NHAP

--
CREATE NONCLUSTERED INDEX IDX_TenHH_HANGHOA on HANGHOA(TenHH)
CREATE NONCLUSTERED INDEX IDX_TenNCC_NHACUNGCAP ON NHACUNGCAP(TenNCC)
CREATE NONCLUSTERED INDEX IDX_NgayLHD_NHAP on NHAP(NgayLapHD)


Select * from HANGHOA where TenHH = N'Tủ đông SANAKY'
Select * from NHACUNGCAP where TenNCC = N'Công ty Hằng Hữu'