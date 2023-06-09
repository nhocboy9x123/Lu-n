USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 3/28/2023 2:02:57 PM ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBH.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBH_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBH] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLBH]
GO
/****** Object:  Table [dbo].[Hangsx]    Script Date: 3/28/2023 2:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hangsx](
	[mahangsx] [nchar](10) NOT NULL,
	[tenhang] [nvarchar](20) NULL,
	[diachi] [nvarchar](30) NULL,
	[sodt] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
 CONSTRAINT [PK_Hangsx] PRIMARY KEY CLUSTERED 
(
	[mahangsx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhanvien]    Script Date: 3/28/2023 2:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvien](
	[manv] [nchar](10) NOT NULL,
	[tennv] [nvarchar](20) NULL,
	[gioitinh] [nchar](10) NULL,
	[diachi] [nvarchar](30) NULL,
	[sodt] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
	[phong] [nvarchar](30) NULL,
 CONSTRAINT [PK_Nhanvien] PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhap]    Script Date: 3/28/2023 2:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhap](
	[sohdn] [nchar](10) NOT NULL,
	[masp] [nchar](10) NOT NULL,
	[manv] [nchar](10) NOT NULL,
	[ngaynhap] [date] NULL,
	[soluongN] [int] NULL,
	[dongiaN] [money] NULL,
 CONSTRAINT [PK_Nhap] PRIMARY KEY CLUSTERED 
(
	[sohdn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 3/28/2023 2:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanpham](
	[masanpham] [nchar](10) NOT NULL,
	[mahangsx] [nchar](10) NOT NULL,
	[tensp] [nvarchar](20) NULL,
	[soluong] [int] NULL,
	[mausau] [nvarchar](20) NULL,
	[giaban] [money] NULL,
	[donvitinh] [nchar](10) NULL,
	[mota] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sanpham] PRIMARY KEY CLUSTERED 
(
	[masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xuat]    Script Date: 3/28/2023 2:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xuat](
	[sohdx] [nchar](10) NOT NULL,
	[masp] [nchar](10) NOT NULL,
	[manv] [nchar](10) NOT NULL,
	[ngayxuat] [date] NULL,
	[soluongX] [int] NULL,
 CONSTRAINT [PK_Xuat] PRIMARY KEY CLUSTERED 
(
	[sohdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Nhap]  WITH CHECK ADD  CONSTRAINT [FK_Nhap_Nhanvien] FOREIGN KEY([manv])
REFERENCES [dbo].[Nhanvien] ([manv])
GO
ALTER TABLE [dbo].[Nhap] CHECK CONSTRAINT [FK_Nhap_Nhanvien]
GO
ALTER TABLE [dbo].[Nhap]  WITH CHECK ADD  CONSTRAINT [FK_Nhap_Sanpham] FOREIGN KEY([masp])
REFERENCES [dbo].[Sanpham] ([masanpham])
GO
ALTER TABLE [dbo].[Nhap] CHECK CONSTRAINT [FK_Nhap_Sanpham]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Hangsx] FOREIGN KEY([mahangsx])
REFERENCES [dbo].[Hangsx] ([mahangsx])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Hangsx]
GO
ALTER TABLE [dbo].[Xuat]  WITH CHECK ADD  CONSTRAINT [FK_Xuat_Nhanvien] FOREIGN KEY([manv])
REFERENCES [dbo].[Nhanvien] ([manv])
GO
ALTER TABLE [dbo].[Xuat] CHECK CONSTRAINT [FK_Xuat_Nhanvien]
GO
ALTER TABLE [dbo].[Xuat]  WITH CHECK ADD  CONSTRAINT [FK_Xuat_Sanpham] FOREIGN KEY([masp])
REFERENCES [dbo].[Sanpham] ([masanpham])
GO
ALTER TABLE [dbo].[Xuat] CHECK CONSTRAINT [FK_Xuat_Sanpham]
GO
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
USE [QLBH]
GO

INSERT INTO [dbo].[Hangsx]
           ([mahangsx]
           ,[tenhang]
           ,[diachi]
           ,[sodt]
           ,[email])
     VALUES
           ('H01','Samsung','Korea','011-08271717','ss@gmail.com.kr')
INSERT INTO [dbo].[Hangsx]
           ([mahangsx]
           ,[tenhang]
           ,[diachi]
           ,[sodt]
           ,[email])
     VALUES
           ('H02','OPPO','China','081-08626262','oppo@gmail.com.cn')
     
INSERT INTO [dbo].[Hangsx]
           ([mahangsx]
           ,[tenhang]
           ,[diachi]
           ,[sodt]
           ,[email])
     VALUES
           ('H03','Vinfone','VietNam','084-098262626','084-098262626')
GO

USE [QLBH]
GO

INSERT INTO [dbo].[Sanpham]
           ([masanpham]
           ,[mahangsx]
           ,[tensp]
           ,[soluong]
           ,[mausau]
           ,[giaban]
           ,[donvitinh]
           ,[mota])
     VALUES
	 ('SP01','H02','F1Plus','100','Xam','7000000','Chiec','Hang can cao cap')
INSERT INTO [dbo].[Sanpham]
           ([masanpham]
           ,[mahangsx]
           ,[tensp]
           ,[soluong]
           ,[mausau]
           ,[giaban]
           ,[donvitinh]
           ,[mota])
     VALUES
	 ('SP02','H01','GalaxyNote11','50','Do','19000000','Chiec','Hang cao cap')
INSERT INTO [dbo].[Sanpham]
           ([masanpham]
           ,[mahangsx]
           ,[tensp]
           ,[soluong]
           ,[mausau]
           ,[giaban]
           ,[donvitinh]
           ,[mota])
     VALUES
	 ('SP03','H02','F3 lite','200','Nau','3000000','Chiec','Hang pho thong')
INSERT INTO [dbo].[Sanpham]
           ([masanpham]
           ,[mahangsx]
           ,[tensp]
           ,[soluong]
           ,[mausau]
           ,[giaban]
           ,[donvitinh]
           ,[mota])
     VALUES
	 ('SP04','H03','Vjoy3','200','Xam','1500000','Chiec','Hang pho thong')
INSERT INTO [dbo].[Sanpham]
           ([masanpham]
           ,[mahangsx]
           ,[tensp]
           ,[soluong]
           ,[mausau]
           ,[giaban]
           ,[donvitinh]
           ,[mota])
     VALUES
	 ('SP05','H01','GalaxyV21','500','Nau','8000000','Chiec','Hang cao cap')
GO

USE [QLBH]
GO
INSERT INTO [dbo].[Nhanvien]
           ([manv]
           ,[tennv]
           ,[gioitinh]
           ,[diachi]
           ,[sodt]
           ,[email]
           ,[phong])
     VALUES
	 ('NV01','Nguyen Thi Thu','Nu','Ha Noi','0982626521','thu@gmail.com','Ke toan')

INSERT INTO [dbo].[Nhanvien]
           ([manv]
           ,[tennv]
           ,[gioitinh]
           ,[diachi]
           ,[sodt]
           ,[email]
           ,[phong])
     VALUES
	 ('NV02','Le Van Nam','Nam','Bac Ninh','0972525252','nam@gmail.com','Vat Tu')
INSERT INTO [dbo].[Nhanvien]
           ([manv]
           ,[tennv]
           ,[gioitinh]
           ,[diachi]
           ,[sodt]
           ,[email]
           ,[phong])
     VALUES
	 ('NV03','Tran Hoa Binh','Nu','Ha Noi','0328388388','hb@gmail.com','Ke Toan')
GO

USE [QLBH]
GO

INSERT INTO [dbo].[Nhap]
           ([sohdn]
           ,[masp]
           ,[manv]
           ,[ngaynhap]
           ,[soluongN]
           ,[dongiaN])
     VALUES
	 ('N01','SP02','NV01','02-05-2019','10','17000000')
INSERT INTO [dbo].[Nhap]
           ([sohdn]
           ,[masp]
           ,[manv]
           ,[ngaynhap]
           ,[soluongN]
           ,[dongiaN])
     VALUES
	 ('N02','SP01','NV02','04-07-2020','30','6000000')
INSERT INTO [dbo].[Nhap]
           ([sohdn]
           ,[masp]
           ,[manv]
           ,[ngaynhap]
           ,[soluongN]
           ,[dongiaN])
     VALUES
	 ('N03','SP04','NV02','05-17-2020','20','1200000')
INSERT INTO [dbo].[Nhap]
           ([sohdn]
           ,[masp]
           ,[manv]
           ,[ngaynhap]
           ,[soluongN]
           ,[dongiaN])
     VALUES
	 ('N04','SP01','NV03','03-22-2020','10','6200000')
INSERT INTO [dbo].[Nhap]
           ([sohdn]
           ,[masp]
           ,[manv]
           ,[ngaynhap]
           ,[soluongN]
           ,[dongiaN])
     VALUES
	 ('N05','SP05','NV01','07-07-2020','20','7000000')
GO
USE [QLBH]
GO

INSERT INTO [dbo].[Xuat]
           ([sohdx]
           ,[masp]
           ,[manv]
           ,[ngayxuat]
           ,[soluongX])
     VALUES
	 ('X01','SP03','NV02','06-14-2020','5')
INSERT INTO [dbo].[Xuat]
           ([sohdx]
           ,[masp]
           ,[manv]
           ,[ngayxuat]
           ,[soluongX])
     VALUES
	 ('X02','SP01','NV03','03-05-2019','3')
INSERT INTO [dbo].[Xuat]
           ([sohdx]
           ,[masp]
           ,[manv]
           ,[ngayxuat]
           ,[soluongX])
     VALUES
	 ('X03','SP02','NV01','12-12-2020','1')
INSERT INTO [dbo].[Xuat]
           ([sohdx]
           ,[masp]
           ,[manv]
           ,[ngayxuat]
           ,[soluongX])
     VALUES
	 ('X04','SP03','NV02','06-02-2020','2')
INSERT INTO [dbo].[Xuat]
           ([sohdx]
           ,[masp]
           ,[manv]
           ,[ngayxuat]
           ,[soluongX])
     VALUES
	 ('X05','SP05','NV01','05-18-2020','1')
GO
