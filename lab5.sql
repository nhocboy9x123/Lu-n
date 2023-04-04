create function Timsanpham (@masp nvarchar(10))
returns nvarchar(20)
as
begin
declare @ten nvarchar(20)
set @ten = (select tenhang from hangsx inner join sanpham
on hangsx.mahangsx = sanpham.mahangsx
where masanpham = @masp)
return @ten
end
Go
SELECT dbo.Timsanpham('SP02')

/***2**/

create function tonggiatri(@x int,@y int)
returns int
as
begin
declare @tongtien int
select @tongtien = sum(soluongN*dongiaN)
from nhap
where year(ngaynhap) between @x and @y
return @tongtien
end
GO
SELECT dbo.tonggiatri('2019', '2020')

/*****3****/

create function Tongnhap (@tensp nvarchar(20), @y int)
returns int
as
begin
	DECLARE @Tongnhap int
	SELECT @Tongnhap = soluongN - soluongX FROM Nhap INNER JOIN Xuat ON Nhap.masp = Xuat.masp INNER JOIN Sanpham ON Xuat.masp = Sanpham.masanpham
	WHERE Sanpham.tensp = @tensp AND YEAR(Ngaynhap) = @y AND YEAR(Ngayxuat) = @y
	RETURN @Tongnhap
END
GO
SELECT dbo.Tongnhap('Vjoy3', 2020)

/*****4******/
CREATE FUNCTION Tonggiatri(@x int, @y int)
RETURNS int
AS
BEGIN 
	DECLARE @Tonggiatri int
	SELECT @Tonggiatri = SUM(soluongN*dongiaN) FROM Nhap 
	WHERE DAY(Ngaynhap) BETWEEN @x and @y
	RETURN @Tonggiatri
END
GO
SELECT dbo.@Tonggiatri(1,10)



/******5******/
CREATE FUNCTION Tonggiatrixuat(@tenhang nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @Tonggiatrixuat int
	SELECT @Tonggiatrixuat = SUM(soluongX*giaban) FROM Xuat INNER JOIN Sanpham ON Xuat.masanpham = Sanpham.masanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	WHERE Hangsx.Tenhang = @tenhang AND YEAR(Ngayxuat) = @y
	RETURN @Tonggiatrixuat
END
GO
SELECT dbo.TongGiaTriXuat('Samsung', 2019)

/*****6*****/
CREATE FUNCTION thongkenv(@tenphong nvarchar(30))
RETURNS int
AS
BEGIN 
	DECLARE @thongkenv int
	SELECT @thongkenv = Count(Phong) FROM Nhanvien 
	WHERE Nhanvien.Phong = @tenphong
	RETURN @thongkenv
END
GO
SELECT dbo.thongkenv('Ke Toan')

/******7******/
CREATE FUNCTION sanphamtrongngay(@tensp nvarchar(20),@y int)
RETURNS int
AS
BEGIN 
	DECLARE @sanphamtrongngay int
	SELECT @sanphamtrongngay = Sum(soluongX) FROM Xuat INNER JOIN Sanpham ON Xuat.masanpham = Sanpham.masanpham
	WHERE Sanpham.tensp = @tensp AND DAY(Ngayxuat) = @y
	RETURN @sanphamtrongngay
END
GO
SELECT dbo.sanphamtrongngay('Vjoy3', 20)

/*****8****/
CREATE FUNCTION sdtnvxuathoadon(@x nchar(10))
RETURNS int
AS
BEGIN 
	DECLARE @sdtnvxuathoadon int
	SELECT @sdtnvxuathoadon = Sodt FROM Nhanvien INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
	WHERE Xuat.Sohdx = @x
	RETURN @sdtnvxuathoadon
END
GO
SELECT dbo.sdtnvxuathoadon('X02')

/*****9*****/
CREATE FUNCTION nhapxuat(@tensp nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @nhapxuat int
	SELECT @nhapxuat = soluongN - soluongX FROM Nhap INNER JOIN Xuat ON Nhap.masanpham = Xuat.masanpham INNER JOIN Sanpham ON Xuat.masanpham = Sanpham.masanpham
	WHERE Sanpham.tensp = @tensp AND YEAR(Ngaynhap) = @y AND YEAR(Ngayxuat) = @y
	RETURN @nhapxuat
END
GO
SELECT dbo.nhapxuat('F3 lite', 2020)

/*****10******/
CREATE FUNCTION tongsosanpham(@tenhang nvarchar(20))
RETURNS int
AS
BEGIN 
	DECLARE @tongsosanpham int
	SELECT @tongsosanpham= Count(tensp) FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx 
	WHERE Hangsx.Tenhang = @tenhang
	RETURN @tongsosanpham
END
GO
SELECT dbo.tongsosanpham('OPPO')


