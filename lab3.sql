/***cau 1***/
SELECT COUNT(masanpham), Hangsx.Mahangsx
FROM Hangsx JOIN Sanpham ON Hangsx.Mahangsx=Sanpham.mahangsx
GROUP BY Hangsx.Mahangsx

/***cau 2***/
SELECT  tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masanpham 
WHERE YEAR(ngaynhap)=2018
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp

/***cau 3***/
SELECT Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongX>10000 AND Tenhang = 'Samsung'

/***cau 4***/
SELECT COUNT(Manv), Tennv, Phong
FROM Nhanvien WHERE Gioitinh = 'Nam' GROUP BY Tennv, Phong

/***cau 5***/
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Tenhang, tensp, soluongN

/***cau 6***/
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018
GROUP BY Sohdx, Nhanvien.Manv, soluongX

/***cau 7***/
SELECT Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
FROM Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
GROUP BY Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap

/****cau 8***/
SELECT *FROM Nhap 
WHERE Nhap.Masp NOT IN(SELECT Xuat.Masp FROM Xuat)

/***cau 9***/
SELECT Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018

/***cau 10***/
SELECT Manv, Tennv FROM Nhanvien
WHERE EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)

/***cau 11***/
SELECT Manv, Tennv FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)