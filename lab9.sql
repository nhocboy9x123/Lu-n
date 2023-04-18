/*****cau1*****/
create trigger nhaplieu on Nhap
for insert as
begin
     declare @masanpham nvarchar(10), @manv nvarchar(10)
	 declare @sln int , @dgn float
	 select @masanpham = masp, @manv=manv, @sln=soluongN, @dgn=dongiaN
	 from inserted
	 if (not exists(select * from Sanpham where masanpham = @masanpham))
	    begin
		   raiserror (N'khong ton tai san pham trong muc san pham',16,1)
		   rollback transaction 
		end
	else
	   if (not exists (select * from Nhanvien where manv = @manv))
	      begin
		     raiserror (N'khong ton tai nhan vien co ma nay',16,1)
			 rollback transaction
		  end
	else
	if (@sln <=0 or @dgn <=0)
	      begin
		     raiserror (N'Nhap sai so luong hoac don gia',16,1)
			 rollback transaction
		  end
	else
	   update Sanpham set soluong = soluong + @sln
	   from Sanpham where masanpham = @masanpham
end

insert into Nhap values ('nh02','sp01','nv01','2018-7-3',0,'15000000')
select * from Sanpham
select * from Nhap


/*****cau2*****/
create trigger xuathang on Xuat
for insert as
begin 
	declare @masp nvarchar(10), @manv nvarchar(10), @slx int
	select @masp = masp, @manv = @manv , @slx = soluongX from inserted
	update Sanpham set soluong = soluong - @slx where @masp = @masp
	if @masp NOT IN (select masanpham from Sanpham) OR @manv NOT IN (select manv from Nhanvien)
	begin
		IF @masp NOT IN (select masanpham from Sanpham)
		begin
			raiserror (N'Ma San Pham Khong Ton Tai',16,1)
			rollback tran
		end
		else
		begin
			raiserror (N'Ma Nhan Vien Khong Ton Tai',16,1)
			rollback tran
		 end
	  end
	  else
	  begin
		if @slx > (select top 1 Soluong from Sanpham)
		begin
			raiserror (N'So luong xuat cao hon ton kho',16,1)
			rollback tran
		end
	end
end


/*****cau3*****/
create trigger xoaphieuxuat on Xuat
for delete as
begin
	UPDATE Sanpham set soluong=soluong+(select soluongX from deleted where masp=Sanpham.masanpham)
	from Sanpham 
	JOIN deleted on Sanpham.masanpham=deleted.Masp
end
/****B4****/
create trigger [dbo].[Xuathang111] on [dbo].[Xuat]
for update as
begin
	declare @masp nvarchar(10), @slx int
	select @masp = masp, @slx = soluongX from inserted
	update Sanpham set soluong = soluong - @slx where masanpham = @masp
	if @slx > (select top 1 Soluong from Sanpham)
	begin
		raiserror (N'So luong xuat cao hon ton kho',16,1)
		rollback tran
	end
end


/*****B5*****/
create trigger [dbo].[capnhatdulieu] on [dbo].[Nhap]
for update as
begin
	declare @masp nvarchar(10), @sln int, @dgn money
	select @masp = masp, @sln = soluongN, @dgn = dongiaN from inserted
	update Sanpham set soluong = soluong + @sln where masanpham = @masp
	if @sln <=0 OR @dgn <= 0
		begin
			raiserror (N'So luong nhap va don gia nhap sai',16,1)
			rollback tran
	end
end


/*****B6*****/
create trigger xoaphieunhap on Nhap
for delete as
begin
	update Sanpham set soluong=soluong-(select soluongN from deleted where masp=Sanpham.masp)
	from Sanpham 
	JOIN deleted on Sanpham.masp=deleted.Masp
end