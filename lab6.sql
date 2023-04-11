/***** cau 1*****/

create function tensanpham1 (@Tenhang nvarchar(20))
returns
table
return
     select tensp,masanpham from Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	 where tenhang = @Tenhang
go
select * from dbo .tensanpham1('OPPO')

/******cau2******/

create function danhsachsanpham (@x int ,@y int)
returns
table
return
     select tensp, Sanpham.masanpham, tenhang from Hangsx inner join Sanpham ON Sanpham.mahangsx = Hangsx.mahangsx inner join Nhap ON Sanpham.masanpham = Nhap.masp
	 WHERE DAY(NGAYNHAP) BETWEEN @x and @y
go
select * from dbo.danhsachsanpham(1,10)

/******cau3******/
CREATE FUNCTION LuaChon(@luachon int)
RETURNS @bang TABLE (tensp nvarchar(20), masp nvarchar(10),tenhang nvarchar(20), Soluong int)
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang 
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong < 0
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong > 0
	END
	RETURN
END

/********cau4*******/


create function kiemtranv(@tenphong nvarchar(30))
returns
table
return
	select * from Nhanvien 
	where Phong = @tenphong
go
SELECT * from dbo.kiemtranv('ke toan')

/******cau5******/

create function  kiemtrahsx(@diachi nvarchar(30))
returns
table
return
     select tenhang, mahangsx, diachi from Hangsx 
	 where diachi = @diachi
go
select * from dbo.kiemtrahsx('China')

/*****cau7******/
create function LuaChonXuatNhap1(@luachon int)
returns @bang1 
table (tensp nvarchar(20), masp nvarchar(10),tenhang nvarchar(20), Soluong int)
as
begin
	if @luachon = 0
	begin
		insert into @bang1 
			select tensp, Sanpham.masanpham, tenhang, soluongN from Hangsx INNER JOIN Sanpham on Sanpham.mahangsx = Hangsx.mahangsx INNER JOIN Nhap on Sanpham.masanpham = Nhap.masp
	
	end
	if @luachon = 1
	begin
		insert into @bang1
			select tensp, Sanpham.masanpham, tenhang, soluongX from Hangsx INNER JOIN Sanpham on Sanpham.mahangsx = Hangsx.mahangsx INNER JOIN Xuat on Sanpham.masanpham = Xuat.masp
	end
	return
end
go

/******cau6*******/
create function danhsachsanpham (@x int, @y int)
returns
table 
return
     select Tenhang, tensp, soluongX
     from Xuat INNER JOIN Sanpham ON Xuat.Masp = Sanpham. inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
     where YEAR(Ngayxuat) BETWEEN @x AND @y
GO
SELECT * FROM danhsachsanpham(2019, 2020)

/*******cau8*****/
create function NVNhap (@x int)
returns 
table 
return
select Nhanvien.Manv, Tennv, Phong
from Nhanvien INNER JOIN Nhap ON Nhanvien.Manv = Nhap.Manv
where DAY(Ngaynhap) = @x
go
SELECT * FROM NVNhap ('17')


/**********cau9******/
create function bansanpham (@x money, @y money, @tenhang nvarchar(20))
returns
table
return
     select tensp,tenhang, giaban from Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	 where tenhang = @tenhang and @x <= giaban and giaban <=@y
go
select * from dbo.bansanpham(7000000.000, 15000000.000, 'OPPO')

/*******cau10******/
create function KhongCoBien ()
returns 
table 
return
	select tensp, masanpham, Tenhang from Sanpham INNER JOIN Hangsx on Sanpham.mahangsx = Hangsx.mahangsx
go
select * from dbo.KhongCoBien()
order by Tenhang
go




