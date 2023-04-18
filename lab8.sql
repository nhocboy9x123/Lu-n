/*****cau1****/
create proc suanv1(@manv nvarchar(10), @tennv nvarchar(20), @gioitinh nvarchar(10), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20), @phong nvarchar(30), @Flag int)
as
	if @gioitinh IN('Nam', 'Nu')
	begin
		if @Flag = 0
		begin
			insert into Nhanvien(manv, Tennv, Gioitinh, Diachi, Sodt, email, Phong)
			values (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)
		end
		else 
		begin
			UPDATE Nhanvien set Tennv = @tennv, Gioitinh = @gioitinh, Diachi = @diachi, Sodt = @sodt, email = @email, Phong = @phong
			where manv = @manv
		end
		raiserror (N'Ma Loi 0', 16,1)
	end
	else 
	begin
		raiserror (N'Ma loi 1',16,1)
		rollback tran
	end
go
dbo.suanv1 'NV01','Nguyen Thi Thu','Nu','Ha Noi','0982626521','thu@gmail.com','Ke toan','1'
go
/*****cau2*****/
create proc themmoisanphan(@masp nvarchar(10), @tensp nvarchar(20), @tenhang nvarchar(20), @soluong int, @mausac nvarchar(10), @giaban money,  @donvitinh nvarchar(10), @mota nvarchar(30), @flag int)
as
	if @flag = 0
	begin
		if @tenhang NOT IN (select mahangsx from Sanpham )
		begin
			raiserror (N'Ma loi 1',16,1)
			rollback tran
		end
		if @soluong < 0 
		begin
			raiserror (N'Ma loi 2',16,1)
			rollback tran
		end
		IF @tenhang IN (select mahangsx from Sanpham) AND @soluong > 0
		begin
			insert into Sanpham(masanpham, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
			values (@masp, @tenhang, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
			raiserror (N'Ma loi 0',16,1)
		end
	end
	else 
	begin
		if @tenhang NOT IN (select mahangsx from Sanpham )
		begin
			raiserror (N'Ma loi 1',16,1)
			rollback tran
		end
		if @soluong < 0 
		begin
			raiserror (N'Ma loi 2',16,1)
			rollback tran
    end
	else 
	begin
			UPDATE Sanpham set mahangsx = @tenhang, tensp = @tensp, soluong = @soluong, mausac = @mausac, giaban = @giaban, donvitinh = @donvitinh, mota = @mota
			where masanpham = @masp
			raiserror (N'Ma loi 0',16,1)
		end
	end
go
dbo. themmoisanphan 'SP02','H01','GalaxyNote11','50','Do','19000000.0000','Chiec','Hang cao cap','0'
go
/*****cau3******/
create proc XoaNhanVien (@manv nvarchar(10))
as
	if @manv IN (select Manv from Nhanvien)
	begin
		delete from Nhanvien where manv = @manv
		delete from  Nhap where manv = @manv
		delete from Xuat where manv = @manv
		raiserror (N'Ma loi 0',16,1)
	end
	else 
	begin
		raiserror (N'Ma loi 1',16,1)
		rollback tran
	end
go

dbo.XoaNhanVien 'NV04'
go

/*****cau4*****/
create proc XoaSanPham (@masp nvarchar(10))
as
	if @masp IN (select masanpham from Sanpham)
	begin
		delete from Sanpham where masanpham = @masp
		delete from Nhap where masp = @masp
		delete from Xuat where masp = @masp
		raiserror (N'Ma loi 0',16,1)
	end
	else
	begin
	     raiserror (N'Ma loi 1',16,1)
		 rollback tran
	end
go
dbo.XoaSanPham 'SP08'
go
/*****cau5*****/
create proc nhaphangsx(@mahangsx nvarchar(10), @tenhang nvarchar(20), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20))
as 
	if @tenhang NOT IN (select Tenhang from Hangsx)
	begin
		raiserror (N'Ma loi 0',16,1)
	end
    else
	begin
		raiserror (N'Ma loi 1',16,1)
		rollback tran
	end
go
dbo.nhaphangsx 'H02','OPPO','China','081-08626262','oppo@gmail.com.cn','1'
go
/*****cau6*****/
create proc nhaphang(@shdn nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngaynhap date, @soluongN int, @dongiaN money)
as
	if @masp IN (select masanpham from Sanpham) AND @manv IN (select Manv from Nhanvien)
	begin
		if @shdn IN (select Sohdn from Nhap)
		begin
			UPDATE Nhap set masp = @masp, manv = @manv, Ngaynhap = @ngaynhap, soluongN = @soluongN, dongiaN = @dongiaN
			where Sohdn = @shdn
			raiserror (N'Ma loi 0',16,1)
		end
		else
		begin
			insert into Nhap(Sohdn, masp, manv, Ngaynhap, soluongN, dongiaN)
			values (@shdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
			raiserror (N'Ma loi 0',16,1)
		end
	end
	else
	begin
		if @masp NOT IN (select masanpham from Sanpham) OR @manv NOT IN (select manv from Nhanvien)
		begin
			if @masp NOT IN (select masanpham from Sanpham)
			begin
				raiserror (N'Ma loi 1',16,1)
				rollback tran
			end
			else
			begin
				raiserror (N'Ma loi 2',16,1)
				rollback tran
			end
		end
	end
go
dbo.nhaphang 'N02','SP01','NV02','2020-04-07','30','6000000.0000','1'
go
/****cau7****/
create proc Xuathanghang12(@shdx nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngayxuat date, @soluongX int)
as
	if @masp IN (select masanpham from Sanpham) AND @manv IN (select Manv from Nhanvien) AND @soluongX <= (select top 1 soluong from Sanpham)	
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
			raiserror (N'Ma loi 0',16,1)
		end
	end
	else
	begin
		if @masp NOT IN(select masanpham from Sanpham) OR @manv NOT IN (select manv from Nhanvien) OR @soluongX >= (select top 1 soluong from Sanpham)	
		begin
			if @masp NOT IN(select masanpham from Sanpham)
			begin
				raiserror (N'Ma loi 1',16,1)
				rollback tran
			end
			if @manv NOT IN (select manv from Nhanvien)
			begin
				raiserror (N'Ma loi 2',16,1)
				rollback tran
			end
			else
			begin
				raiserror (N'Ma loi 1',16,1)
				rollback tran
			end
		end
	end
go
dbo.Xuathanghang12 'X04','SP03','NV02','2020-06-02','2','1'
go
