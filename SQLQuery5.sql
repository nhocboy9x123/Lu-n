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
create function Tonggiatri(@x int,@y int)
returns int
as
begin
declare @tongtien int
select @tongtien = sum(soluongN*dongiaN)
from nhap
where day(ngaynhap) between @x and @y
return @tongtien
end
GO
SELECT dbo.tonggiatri('2019', '2020')