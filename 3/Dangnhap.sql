create database Dangnhap
use Dangnhap

create table Taikhoan (
Taikhoan varchar(20),
Matkhau varchar(10)
)

insert into Taikhoan
values ('buithithuy','12345'),
	   ('tranvanhung','12345'),
	   ('phamphuonganh','12345'),
	   ('lexuannhat','12345')

select * from Taikhoan