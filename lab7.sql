/****cau1*****/
create proc nhapHSX(@mahangsx nvarchar(20), @tenhang nvarchar(20), @diachi nvarchar(20), @sodt nvarchar(20), @email nvarchar(20))
as
if @tenhang NOT IN (select Tenhang from Hangsx)
	begin
		insert into Hangsx(mahangsx, Tenhang, Diachi, Sodt, email)
		values (@mahangsx, @tenhang, @diachi, @sodt, @email)
	end
	else
	begin
		raiserror (N'Tên Hãng đã tồn tại',16,1)
		rollback tran
	end
go
dbo.nhapHSX 'H01', 'Samsung', 'Cà Mau', '019461841', 'Samsung.email'
go

/*****cau2*****/
create proc NhapSPM(@masp nvarchar(10), @tenhangsx nvarchar(20), @tensp nvarchar(20), @soluong int, @mausac nvarchar(10), @giaban money, @donvitinh nvarchar(10), @mota nvarchar(10))
as
	if @masp IN (select masp from Sanpham)
	begin
		UPDATE Sanpham set tensp = @tensp, mahangsx = @tenhangsx, soluong = @soluong, mausac = @mausac, giaban = @giaban, donvitinh = @donvitinh, mota = @mota
		where masp = @masp
	end
	else
	begin 
		insert into Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
		values (@masp, @tenhangsx, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
	end
go
dbo.NhapSPM 'SP08', 'H03', 'Redmi note11', 12, 'Tim', 2000000, 'Chiec', 'Gia re'
go

/****cau3****/
create proc XoaHang (@Tenhang nvarchar(20))
as
	if @Tenhang IN (select tenhang from Hangsx)
	begin
		delete from  Hangsx 
		where Tenhang = @Tenhang
	end
	else
	begin
		raiserror (N'Hang khong ton tai', 16,1)
		rollback tran
	end
go
dbo.XoaHang 'Xiaomi'

/*****cau4****/
create proc ChinhsuaNV(@manv nvarchar(10), @tennv nvarchar(20), @gioitinh nvarchar(10), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20), @phong nvarchar(30), @Flag int)
as
	if @Flag = 0
	begin
		UPDATE Nhanvien set Tennv = @tennv, Gioitinh = @gioitinh, Diachi = @diachi, Sodt = @sodt, email = @email, Phong = @phong
		where manv = @manv
	end
	else
	begin
		insert into Nhanvien(manv, Tennv, Gioitinh, Diachi, Sodt, email, Phong)
		values (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)
	end
go
dbo.ChinhsuaNV 'NV04', 'Nguyễn Văn Hai', 'Nam', 'Hà Nội', '0164167142', 'Hainguyen@gmail.com', 'Ke toan', 0
go
/****cau5****/
create proc Nhaphang(@shdn nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngaynhap date, @soluongN int, @dongiaN money)
as
	if @masp IN (select masp from Sanpham) AND @manv IN (select Manv from Nhanvien)
	BEGIN
		if @shdn IN (select Sohdn from Nhap)
		begin
			UPDATE Nhap set masp = @masp, manv = @manv, Ngaynhap = @ngaynhap, soluongN = @soluongN, dongiaN = @dongiaN
			where Sohdn = @shdn
	end
	else
	begin
			insert into Nhap(Sohdn, masp, manv, Ngaynhap, soluongN, dongiaN)
			values (@shdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
		end
	end
	else
	begin
		raiserror (N'Mã sản phẩm và mã nhân viên không tồn tại',16,1)
		rollback tran
	end
go
dbo.Nhaphang 'N06', 'SP01', 'NV03','2023-3-12', 14, 8000000.0000
go
/****cau6****/
create proc Xuathang(@shdx nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngayxuat date, @soluongX int)
as
	if @masp IN (select masp from Sanpham) AND @manv IN (select Manv from Nhanvien) AND @soluongX <= (select top 1 soluong from Sanpham)	
	begin
		if @shdx IN (select Sohdx from Xuat)
		begin
			UPDATE Xuat set masp = @masp, manv = @manv, Ngayxuat = @ngayxuat, soluongX = @soluongX
			where Sohdx = @shdx
	end
	else
	begin
			insert into Xuat(Sohdx, masp, manv, Ngayxuat, soluongX)
			values (@shdx, @masp, @manv, @ngayxuat, @soluongX)
		end
	end
	else
	begin
		raiserror (N'Mã sản phẩm và mã nhân viên không tồn tại hoặc số lượng xuất nhiều hơn tồn kho',16,1)
		rollback tran
	end
go
dbo.Xuathang 'X06', 'SP01', 'NV03','2023-3-12',12
go
/****B7****/
create proc XoaNhanVien (@manv nvarchar(10))
as
	if @manv IN (select Manv from Nhanvien)
	BEGIN
		delete from Nhanvien where manv = @manv
		delete from Nhap where manv = @manv
		delete from Xuat where manv = @manv
	end
	else
	begin
		raiserror (N'Mã nhân viên không tồn tại',16,1)
		rollback tran
	end
go
dbo.XoaNhanVien 'NV04'
go
/****B8****/
create proc XoaSanPham (@masp nvarchar(10))
as
	IF @masp IN (select masp from Sanpham)
	begin
		delete from Sanpham where masp = @masp
		delete from Nhap where masp = @masp
		delete from Xuat where masp = @masp
	end
	else
	begin
		raiserror (N'Mã sản phẩm không tồn tại',16,1)
		rollback tran
	end
go
dbo.XoaSanPham 'SP08'
go
