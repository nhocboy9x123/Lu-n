GO
CREATE VIEW VIEW1 AS
SELECT tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masanpham 
WHERE YEAR(ngaynhap)=2018
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
GO
SELECT * FROM VIEW1

GO
CREATE VIEW VIEW2 AS
SELECT COUNT(masanpham) AS DEM, Hangsx.Mahangsx
FROM Hangsx JOIN Sanpham ON Hangsx.Mahangsx=Sanpham.mahangsx
GROUP BY Hangsx.Mahangsx
GO
SELECT * FROM VIEW2

GO
CREATE VIEW VIEW3 AS
SELECT Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongX>10000 AND Tenhang = 'Samsung'
GO
SELECT * FROM VIEW3

GO
CREATE VIEW VIEW4 AS
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Tenhang, tensp, soluongN
GO
SELECT * FROM VIEW4


GO
CREATE VIEW VIEW5 AS
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018
GROUP BY Sohdx, Nhanvien.Manv, soluongX
GO
SELECT * FROM VIEW5

GO
CREATE VIEW VIEW6 AS
SELECT Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
FROM Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
GROUP BY Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
GO
SELECT * FROM VIEW6


GO
CREATE VIEW VIEW7 AS
SELECT COUNT(Manv) AS DEM , Tennv, Phong
FROM Nhanvien WHERE Gioitinh = 'Nam' GROUP BY Tennv, Phong
GO
SELECT * FROM VIEW7

GO
CREATE VIEW VIEW8 AS
SELECT *FROM Nhap 
WHERE Nhap.Masp NOT IN(SELECT Xuat.Masp FROM Xuat)
GO
SELECT * FROM VIEW8

GO
CREATE VIEW VIEW9 AS
SELECT Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018
GO
SELECT * FROM VIEW9

GO
CREATE VIEW VIEW10 AS
SELECT Manv, Tennv FROM Nhanvien
WHERE EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
GO
SELECT * FROM VIEW10

GO
CREATE VIEW VIEW11 AS
SELECT Manv, Tennv FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
GO
SELECT * FROM VIEW11

GO
CREATE VIEW VIEW12 AS
SELECT masanpham, Tenhang, tensp, soluong, mausac, giaban
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang='Samsung'
GO
SELECT * FROM VIEW12

GO



GO
CREATE VIEW VIEW13 AS
SELECT top 10 Xuat.sohdx, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban,Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat,Nhanvien.tennv, Nhanvien.phong
FROM Xuat
inner join Sanpham ON Xuat.masp=Sanpham.masanpham
inner join Hangsx ON Sanpham.mahangsx=Hangsx.mahangsx
inner join Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH (Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC
GO
SELECT * FROM VIEW13

GO
CREATE VIEW VIEW14 AS
SELECT TOP 10 *FROM Sanpham ORDER BY giaban DESC
GO
SELECT * FROM VIEW14

GO
CREATE VIEW VIEW15 AS
SELECT tennv FROM Nhanvien WHERE Nhanvien.gioitinh = 'Nu' AND phong = 'Ke toan'
GO
SELECT * FROM VIEW15


/*******************UPDATE*****************/


GO
AFTER VIEW VIEW1 AS
SELECT tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masanpham 
WHERE YEAR(ngaynhap)=2018
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
GO
SELECT * FROM VIEW1

GO
AFTER VIEW VIEW2 AS
SELECT COUNT(masanpham) AS DEM, Hangsx.Mahangsx
FROM Hangsx JOIN Sanpham ON Hangsx.Mahangsx=Sanpham.mahangsx
GROUP BY Hangsx.Mahangsx
GO
SELECT * FROM VIEW2

GO
AFTER VIEW VIEW3 AS
SELECT Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongX>10000 AND Tenhang = 'Samsung'
GO
SELECT * FROM VIEW3

GO
AFTER VIEW VIEW4 AS
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Tenhang, tensp, soluongN
GO
SELECT * FROM VIEW4


GO
AFTER VIEW VIEW5 AS
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018
GROUP BY Sohdx, Nhanvien.Manv, soluongX
GO
SELECT * FROM VIEW5

GO
AFTER VIEW VIEW6 AS
SELECT Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
FROM Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
GROUP BY Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
GO
SELECT * FROM VIEW6


GO
AFTER VIEW VIEW7 AS
SELECT COUNT(Manv) AS DEM , Tennv, Phong
FROM Nhanvien WHERE Gioitinh = 'Nam' GROUP BY Tennv, Phong
GO
SELECT * FROM VIEW7

GO
AFTER VIEW VIEW8 AS
SELECT *FROM Nhap 
WHERE Nhap.Masp NOT IN(SELECT Xuat.Masp FROM Xuat)
GO
SELECT * FROM VIEW8

GO
AFTER VIEW VIEW9 AS
SELECT Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018
GO
SELECT * FROM VIEW9

GO
AFTER VIEW VIEW10 AS
SELECT Manv, Tennv FROM Nhanvien
WHERE EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
GO
SELECT * FROM VIEW10

GO
AFTER VIEW VIEW11 AS
SELECT Manv, Tennv FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
GO
SELECT * FROM VIEW11

GO
AFTER VIEW VIEW12 AS
SELECT masanpham, Tenhang, tensp, soluong, mausac, giaban
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang='Samsung'
GO
SELECT * FROM VIEW12

GO



GO
AFTER VIEW VIEW13 AS
SELECT top 10 Xuat.sohdx, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban,Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat,Nhanvien.tennv, Nhanvien.phong
FROM Xuat
inner join Sanpham ON Xuat.masp=Sanpham.masanpham
inner join Hangsx ON Sanpham.mahangsx=Hangsx.mahangsx
inner join Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH (Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC
GO
SELECT * FROM VIEW13

GO
AFTER VIEW VIEW14 AS
SELECT TOP 10 *FROM Sanpham ORDER BY giaban DESC
GO
SELECT * FROM VIEW14

GO
AFTER VIEW VIEW15 AS
SELECT tennv FROM Nhanvien WHERE Nhanvien.gioitinh = 'Nu' AND phong = 'Ke toan'
GO
SELECT * FROM VIEW15



/******************************DROP*****************/

GO
DROP VIEW VIEW1
GO

GO
DROP VIEW VIEW2
GO

GO
DROP VIEW VIEW3
GO

GO
DROP VIEW VIEW4
GO

GO
DROP VIEW VIEW5
GO

GO
DROP VIEW VIEW5
GO

GO
DROP VIEW VIEW6
GO

GO
DROP VIEW VIEW7
GO

GO
DROP VIEW VIEW8
GO

GO
DROP VIEW VIEW9
GO

GO
DROP VIEW VIEW10
GO

GO
DROP VIEW VIEW11
GO

GO
DROP VIEW VIEW12
GO

GO
DROP VIEW VIEW13
GO


GO
DROP VIEW VIEW14
GO

GO
DROP VIEW VIEW15
GO
