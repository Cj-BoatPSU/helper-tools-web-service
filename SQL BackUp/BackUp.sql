USE [master]
GO
/****** Object:  Database [Helper_Tools_DB]    Script Date: 4/28/2024 2:23:04 PM ******/
CREATE DATABASE [Helper_Tools_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Helper_Tools_DB', FILENAME = N'C:\Users\zchutiwat.j\Helper_Tools_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Helper_Tools_DB_log', FILENAME = N'C:\Users\zchutiwat.j\Helper_Tools_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Helper_Tools_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Helper_Tools_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Helper_Tools_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Helper_Tools_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Helper_Tools_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Helper_Tools_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Helper_Tools_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Helper_Tools_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Helper_Tools_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Helper_Tools_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Helper_Tools_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Helper_Tools_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Helper_Tools_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Helper_Tools_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Helper_Tools_DB] SET QUERY_STORE = OFF
GO
USE [Helper_Tools_DB]
GO
/****** Object:  Table [dbo].[FinancialDetail]    Script Date: 4/28/2024 2:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialDetail](
	[FinancialDetailID] [int] IDENTITY(1,1) NOT NULL,
	[FinancialInfoID] [int] NULL,
	[TypeID] [int] NULL,
	[Topic] [nvarchar](100) NULL,
	[Amount] [float] NULL,
	[Already_Paid] [bit] NULL,
 CONSTRAINT [PK_FinancialDetail] PRIMARY KEY CLUSTERED 
(
	[FinancialDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialInfo]    Script Date: 4/28/2024 2:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialInfo](
	[FinancialInfoID] [int] IDENTITY(1,1) NOT NULL,
	[InfoTopic] [nvarchar](100) NULL,
	[Salary] [int] NULL,
	[Use] [float] NULL,
	[Balance] [float] NULL,
	[IsCompleted] [bit] NULL,
 CONSTRAINT [PK_FinancialInfo] PRIMARY KEY CLUSTERED 
(
	[FinancialInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialType]    Script Date: 4/28/2024 2:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Percent] [int] NULL,
	[Value] [int] NULL,
	[FinancialInfoID] [int] NULL,
	[Use] [float] NULL,
	[Balance] [float] NULL,
 CONSTRAINT [PK_FinancialType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FinancialDetail] ON 
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (134, 8, 23, N'ให้น้อง', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (135, 8, 23, N'จ่าค่าโทรศัพท์', 474.86, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (136, 8, 24, N'จ่ายค่า Shopee', 4180.32, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (137, 8, 25, N'ค่าแชร์1 (แม่ยอมออกให้ 500 บาท เหลือ 3000 บาท)', 500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (138, 8, 23, N'ค่าผ่อนทอง', 850, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (144, 8, 23, N'จ่ายค่าห้อง', 6500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (145, 8, 23, N'ค่าไฟ', 1800, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (146, 8, 23, N'ค่าอินเตอร์เน็ต', 750, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (147, 8, 23, N'ประกันสังคม + ค่าภาษี', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (148, 8, 23, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (149, 8, 23, N'ซื้อยาคุม', 450, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (150, 8, 23, N'ซื้ออาหารเข้าคอนโด', 2000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (151, 8, 24, N'ทำฟัน', 1000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (152, 8, 24, N'ค่าบัตรเครดิต: Iphone 15 Plus (2/10)', 4190, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (153, 8, 24, N'ค่าบัตรเครดิต: กระเป๋า LYN (2/3)', 604.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (154, 8, 24, N'ค่าบัตรเครดิต: ดูหนังธี่หยุด', 600, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (155, 8, 24, N'ค่าบัตรเครดิต: Shabu Shi (1/3)', 199.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (156, 8, 24, N'ค่าบัตรเครดิต: ชุดชั้นในแม่ (1/3)', 793.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (157, 8, 23, N'กินใช้', 4000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (158, 8, 25, N'เก็บ', 5000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (159, 8, 24, N'งบเที่ยว', 5000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (160, 10, 29, N'ให้น้อง', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (161, 10, 29, N'จ่ายค่าโทรศัพท์', 368.93, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (162, 10, 30, N'จ่ายค่า Shopee', 2421.32, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (163, 10, 31, N'ค่าแชร์1 (แม่ยอมออกให้ 500 บาท เหลือ 2500 บาท)', 500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (164, 10, 29, N'จ่ายค่าห้อง', 6500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (165, 10, 29, N'ค่าไฟ', 1800, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (166, 10, 29, N'ค่าอินเตอร์เน็ต', 750, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (167, 10, 29, N'ประกันสังคม + ค่าภาษี', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (168, 10, 29, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (169, 10, 29, N'ซื้อยาคุม', 450, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (170, 10, 29, N'ซื้ออาหารเข้าคอนโด', 2000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (171, 10, 30, N'ทำฟัน', 1500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (172, 10, 30, N'ค่าบัตรเครดิต: Iphone 15 Plus (3/10)', 4190, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (173, 10, 30, N'ค่าบัตรเครดิต: กระเป๋า LYN (3/3)', 604.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (174, 10, 30, N'ค่าบัตรเครดิต: Shabu Shi (2/3)', 199.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (175, 10, 30, N'ค่าบัตรเครดิต: ชุดชั้นในแม่ (2/3)', 793.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (176, 10, 29, N'กินใช้', 4000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (177, 10, 31, N'เก็บ', 5000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (178, 10, 30, N'งบเที่ยว', 4000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (179, 10, 29, N'เงินไปทำงานที่ออฟฟิศ', 1096, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (180, 8, 23, N'เงินไปทำงานที่ออฟฟิศ', 1096, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (181, 11, 32, N'ให้น้อง', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (182, 11, 32, N'จ่ายค่าโทรศัพท์', 400, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (183, 11, 32, N'จ่ายค่าห้อง', 6500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (184, 11, 32, N'ค่าไฟ', 1800, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (185, 11, 32, N'ค่าอินเตอร์เน็ต', 750, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (186, 11, 32, N'ประกันสังคม + ค่าภาษี', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (187, 11, 32, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (188, 11, 32, N'ซื้อยาคุม', 400, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (189, 11, 32, N'ซื้ออาหารเข้าคอนโด', 2000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (190, 11, 32, N'กินใช้', 6000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (191, 11, 33, N'งบเที่ยว', 4000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (192, 11, 32, N'เงินไปทำงานที่ออฟฟิศ', 1096, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (193, 11, 33, N'จ่ายค่า Shopee', 2550.31, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (194, 11, 33, N'ทำฟัน', 1500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (195, 11, 33, N'ค่าบัตรเครดิต: Iphone 15 Plus (4/10)', 4190, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (197, 11, 33, N'ค่าบัตรเครดิต: Shabu Shi (3/3) <หาร 2 กับน้องเตย>', 199.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (198, 11, 33, N'ค่าบัตรเครดิต: ชุดชั้นในแม่ (3/3)', 793.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (199, 11, 34, N'ค่าแชร์1 (แม่ยอมออกให้ 500 บาท เหลือ 2000 บาท)', 500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (200, 11, 34, N'เก็บ', 5000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (201, 12, 35, N'ให้น้อง', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (202, 12, 35, N'จ่ายค่าโทรศัพท์', 533.93, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (203, 12, 35, N'จ่ายค่าห้อง', 6500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (204, 12, 35, N'ค่าไฟ', 1800, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (205, 12, 35, N'ค่าอินเตอร์เน็ต', 750, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (206, 12, 35, N'ประกันสังคม + ค่าภาษี', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (207, 12, 35, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (208, 12, 35, N'ซื้อยาคุม', 400, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (209, 12, 35, N'ซื้ออาหารเข้าคอนโด', 2000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (210, 12, 35, N'กินใช้', 6000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (211, 12, 35, N'เงินไปทำงานที่ออฟฟิศ', 1096, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (212, 12, 36, N'งบเที่ยว', 4000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (213, 12, 36, N'จ่ายค่า Shopee', 2000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (214, 12, 36, N'ทำฟัน', 1500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (215, 12, 36, N'ค่าบัตรเครดิต: Iphone 15 Plus (5/10)', 4190, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (218, 12, 37, N'ค่าแชร์1 (แม่ยอมออกให้ 500 บาท เหลือ 1500 บาท)', 500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (219, 12, 37, N'เก็บ', 5000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (220, 13, 38, N'ให้น้อง', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (221, 13, 38, N'จ่ายค่าโทรศัพท์', 533.93, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (222, 13, 38, N'จ่ายค่าห้อง', 6500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (223, 13, 38, N'ค่าไฟ', 1800, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (224, 13, 38, N'ค่าอินเตอร์เน็ต', 750, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (225, 13, 38, N'ประกันสังคม + ค่าภาษี', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (226, 13, 38, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (227, 13, 38, N'ซื้อยาคุม', 400, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (228, 13, 38, N'ซื้ออาหารเข้าคอนโด', 2000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (229, 13, 38, N'กินใช้', 6000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (230, 13, 38, N'เงินไปทำงานที่ออฟฟิศ', 1096, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (231, 13, 39, N'งบเที่ยว', 4000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (232, 13, 39, N'จ่ายค่า Shopee', 2502.6, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (233, 13, 39, N'ทำฟัน', 1500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (234, 13, 39, N'ค่าบัตรเครดิต: Iphone 15 Plus (6/10)', 4190, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (235, 13, 40, N'ค่าแชร์1 (แม่ยอมออกให้ 500 บาท เหลือ 1000 บาท)', 500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (236, 13, 40, N'เก็บ', 5000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (237, 8, 24, N'ซื้อของขวัญให้น้อง', 2000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (3238, 10, 30, N'ค่าบัตรเครดิต: ดูหนังธี่หยุด 4 ใบ', 276, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (4240, 8, 25, N'ค่าแชร์2 (ป๊าออกให้ 1000 บาท เหลือ 1000 บาท)', 0, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (4241, 10, 31, N'ค่าแชร์2 (ป๊าออกให้ 1000 บาท เหลือ 0 บาท)', 0, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (4242, 11, 34, N'ค่าแชร์2', 1000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (4244, 12, 37, N'ค่าแชร์2', 1000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (4245, 13, 40, N'ค่าแชร์2 (ป๊าออกให้ 1000 บาท เหลือ 1000 บาท)', 0, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (4272, 10, 30, N'คอร์สภาษาอังกฤษ', 2500, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (5272, 10, 29, N'ค่าล้างแอร์', 1000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (7272, 10, 31, N'ซื้อเสื้อผ้าให้น้องเตย (โอนคืนบัญชี Saving)', 650, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (8272, 10, 30, N'ค่าบัตรเครดิต: ค่าโรงแรม (1/3) <หาร 2 กับน้องเตย>', 372.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (9272, 11, 33, N'ค่าบัตรเครดิต: ค่าโรงแรม (2/3) <หาร 2 กับน้องเตย>', 372.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (9274, 12, 36, N'ค่าบัตรเครดิต: ค่าโรงแรม (3/3) <หาร 2 กับน้องเตย>', 372.33, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11272, 11, 33, N'เลี้ยงข้าวปีใหม่ให้ป๊ากับแม่ (คืนไปที่บัญชี saving)', 1000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11273, 14, 41, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11274, 14, 41, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11275, 14, 41, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11276, 14, 41, N'ค่าไฟ', 2100, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11277, 14, 41, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11278, 14, 41, N'ประกันสังคม + ค่าภาษี', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11279, 14, 41, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11280, 14, 41, N'ซื้อยาคุม', 400, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11281, 14, 41, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11282, 14, 41, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11283, 14, 41, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11284, 14, 42, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11285, 14, 42, N'จ่ายค่า Shopee', 2116, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11286, 14, 42, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11287, 14, 42, N'ค่าบัตรเครดิต: Iphone 15 Plus (7/10)', 4190, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11288, 14, 43, N'ค่าแชร์1 (แม่ยอมออกให้ 500 บาท เหลือ 500 บาท)', 500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11289, 14, 43, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (11290, 14, 43, N'ค่าแชร์2 (ป๊าออกให้ 1000 บาท เหลือ 0 บาท)', 0, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (13273, 11, 33, N'ค่า Netflix', 89, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (13275, 12, 36, N'ค่า Netflix', 139, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (13276, 13, 39, N'ค่า Netflix', 139, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (13277, 14, 42, N'ค่า Netflix', 139, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (17273, 12, 36, N'ค่าบัตรเครดิต: จอมอนิเตอร์ (1/6)', 592.06, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (17274, 13, 39, N'ค่าบัตรเครดิต: จอมอนิเตอร์ (2/6)', 569.84, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (17275, 14, 42, N'ค่าบัตรเครดิต: จอมอนิเตอร์ (3/6)', 592.06, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (18273, 12, 36, N'ค่าบัตรเครดิต: แขนจับจอ + ปลั๊ก (1/6)', 588.17, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (19273, 13, 39, N'ค่าบัตรเครดิต: แขนจับจอ + ปลั๊ก (2/6)', 563.17, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (19274, 14, 42, N'ค่าบัตรเครดิต: แขนจับจอ + ปลั๊ก (3/6)', 570, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (20273, 12, 36, N'ค่าบัตรเครดิต: ค่าโรงแรมพัทยา (1/3) <หาร 2 กับน้องเตย>', 541.76, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (20276, 11, 33, N'ค่าบัตรเครดิต: Shabu Shi (Central) (1/3) <หาร 2 กับน้องเตย>', 219, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (20278, 12, 36, N'ค่าบัตรเครดิต: Shabu Shi (Central) (2/3) <หาร 2 กับน้องเตย>', 219, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (20279, 13, 39, N'ค่าบัตรเครดิต: Shabu Shi (Central) (3/3) <หาร 2 กับน้องเตย>', 214, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (20280, 13, 39, N'ค่าบัตรเครดิต: ค่าโรงแรมพัทยา (2/3) <หาร 2 กับน้องเตย>', 530, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (20281, 14, 42, N'ค่าบัตรเครดิต: ค่าโรงแรมพัทยา (3/3) <หาร 2 กับน้องเตย>', 530, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (21274, 13, 39, N'ค่าบัตรเครดิต: ตั๋วหนัง', 560, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (22273, 14, 42, N'ค่าบัตรเครดิต: ค่าโรงแรมพัทยา The Base Inn', 455, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (23273, 13, 39, N'เที่ยวเกาะล้าน', 2000, 1)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24296, 1015, 1044, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24297, 1015, 1044, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24298, 1015, 1044, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24299, 1015, 1044, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24300, 1015, 1044, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24301, 1015, 1044, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24302, 1015, 1044, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24303, 1015, 1044, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24304, 1015, 1044, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24305, 1015, 1044, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24306, 1015, 1044, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24307, 1015, 1045, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24308, 1015, 1045, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24309, 1015, 1045, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24310, 1015, 1045, N'ค่าบัตรเครดิต: Iphone 15 Plus (8/10)', 4190, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24311, 1015, 1045, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24312, 1015, 1045, N'ค่าบัตรเครดิต: จอมอนิเตอร์ (4/6)', 592.06, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24313, 1015, 1045, N'ค่าบัตรเครดิต: แขนจับจอ + ปลั๊ก (4/6)', 588.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24316, 1015, 1046, N'ค่าแชร์1 (แม่ยอมออกให้ 500 บาท เหลือ 0 บาท)', 500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24317, 1015, 1046, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (24318, 1015, 1046, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25299, 1015, 1046, N'ลงทุน: หุ้น', 1000, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25300, 1015, 1046, N'ลงทุน: ฺBinary Option', 1000, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25301, 1015, 1046, N'ลงทุน: กองทุน', 1000, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25302, 1015, 1046, N'ลงทุน: StashAway', 1000, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25303, 1015, 1046, N'ลงทุน: ทองคำ', 1000, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25304, 2015, 2044, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25305, 2015, 2044, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25306, 2015, 2044, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25307, 2015, 2044, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25308, 2015, 2044, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25309, 2015, 2044, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25310, 2015, 2044, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25311, 2015, 2044, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25312, 2015, 2044, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25313, 2015, 2044, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25314, 2015, 2044, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25315, 2015, 2045, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25316, 2015, 2045, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25317, 2015, 2045, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25318, 2015, 2045, N'ค่าบัตรเครดิต: Iphone 15 Plus (9/10)', 4190, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25319, 2015, 2045, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25320, 2015, 2045, N'ค่าบัตรเครดิต: จอมอนิเตอร์ (5/6)', 592.06, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25321, 2015, 2045, N'ค่าบัตรเครดิต: แขนจับจอ + ปลั๊ก (5/6)', 588.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25322, 2015, 2046, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25323, 2015, 2046, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25324, 2015, 2046, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25325, 2015, 2046, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25326, 2015, 2046, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25327, 2015, 2046, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25328, 2015, 2046, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25329, 2015, 2046, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25330, 2016, 2047, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25331, 2016, 2047, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25332, 2016, 2047, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25333, 2016, 2047, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25334, 2016, 2047, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25335, 2016, 2047, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25336, 2016, 2047, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25337, 2016, 2047, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25338, 2016, 2047, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25339, 2016, 2047, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25340, 2016, 2047, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25341, 2016, 2048, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25342, 2016, 2048, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25343, 2016, 2048, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25344, 2016, 2048, N'ค่าบัตรเครดิต: Iphone 15 Plus (10/10)', 4190, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25345, 2016, 2048, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25346, 2016, 2048, N'ค่าบัตรเครดิต: จอมอนิเตอร์ (6/6)', 592.06, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25347, 2016, 2048, N'ค่าบัตรเครดิต: แขนจับจอ + ปลั๊ก (6/6)', 588.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25348, 2016, 2049, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25349, 2016, 2049, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25350, 2016, 2049, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25351, 2016, 2049, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25352, 2016, 2049, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25353, 2016, 2049, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25354, 2016, 2049, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25355, 2016, 2049, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25356, 2017, 2050, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25357, 2017, 2050, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25358, 2017, 2050, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25359, 2017, 2050, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25360, 2017, 2050, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25361, 2017, 2050, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25362, 2017, 2050, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25363, 2017, 2050, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25364, 2017, 2050, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25365, 2017, 2050, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25366, 2017, 2050, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25367, 2017, 2051, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25368, 2017, 2051, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25369, 2017, 2051, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25371, 2017, 2051, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25374, 2017, 2052, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25375, 2017, 2052, N'เก็บ', 10000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25376, 2017, 2052, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25377, 2017, 2052, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25378, 2017, 2052, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25379, 2017, 2052, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25380, 2017, 2052, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25381, 2017, 2052, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25382, 2018, 2053, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25383, 2018, 2053, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25384, 2018, 2053, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25385, 2018, 2053, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25386, 2018, 2053, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25387, 2018, 2053, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25388, 2018, 2053, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25389, 2018, 2053, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25390, 2018, 2053, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25391, 2018, 2053, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25392, 2018, 2053, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25393, 2018, 2054, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25394, 2018, 2054, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25395, 2018, 2054, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25396, 2018, 2054, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25397, 2018, 2055, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25398, 2018, 2055, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25399, 2018, 2055, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25400, 2018, 2055, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25401, 2018, 2055, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25402, 2018, 2055, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25403, 2018, 2055, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25404, 2018, 2055, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25405, 2019, 2056, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25406, 2019, 2056, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25407, 2019, 2056, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25408, 2019, 2056, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25409, 2019, 2056, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25410, 2019, 2056, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25411, 2019, 2056, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25412, 2019, 2056, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25413, 2019, 2056, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25414, 2019, 2056, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25415, 2019, 2056, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25416, 2019, 2057, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25417, 2019, 2057, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25418, 2019, 2057, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25419, 2019, 2057, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25420, 2019, 2058, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25421, 2019, 2058, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25422, 2019, 2058, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25423, 2019, 2058, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25424, 2019, 2058, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25425, 2019, 2058, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25426, 2019, 2058, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25427, 2019, 2058, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25428, 2020, 2059, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25429, 2020, 2059, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25430, 2020, 2059, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25431, 2020, 2059, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25432, 2020, 2059, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25433, 2020, 2059, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25434, 2020, 2059, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25435, 2020, 2059, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25436, 2020, 2059, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25437, 2020, 2059, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25438, 2020, 2059, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25439, 2020, 2060, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25440, 2020, 2060, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25441, 2020, 2060, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25442, 2020, 2060, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25443, 2020, 2061, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25444, 2020, 2061, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25445, 2020, 2061, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25446, 2020, 2061, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25447, 2020, 2061, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25448, 2020, 2061, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25449, 2020, 2061, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25450, 2020, 2061, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25451, 2021, 2062, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25452, 2021, 2062, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25453, 2021, 2062, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25454, 2021, 2062, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25455, 2021, 2062, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25456, 2021, 2062, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25457, 2021, 2062, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25458, 2021, 2062, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25459, 2021, 2062, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25460, 2021, 2062, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25461, 2021, 2062, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25462, 2021, 2063, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25463, 2021, 2063, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25464, 2021, 2063, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25465, 2021, 2063, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25466, 2021, 2064, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25467, 2021, 2064, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25468, 2021, 2064, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25469, 2021, 2064, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25470, 2021, 2064, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25471, 2021, 2064, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25472, 2021, 2064, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25473, 2021, 2064, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25474, 2022, 2065, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25475, 2022, 2065, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25476, 2022, 2065, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25477, 2022, 2065, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25478, 2022, 2065, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25479, 2022, 2065, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25480, 2022, 2065, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25481, 2022, 2065, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25482, 2022, 2065, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25483, 2022, 2065, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25484, 2022, 2065, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25485, 2022, 2066, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25486, 2022, 2066, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25487, 2022, 2066, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25488, 2022, 2066, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25489, 2022, 2067, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25490, 2022, 2067, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25491, 2022, 2067, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25492, 2022, 2067, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25493, 2022, 2067, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25494, 2022, 2067, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25495, 2022, 2067, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25496, 2022, 2067, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25497, 2023, 2068, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25498, 2023, 2068, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25499, 2023, 2068, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25500, 2023, 2068, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25501, 2023, 2068, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25502, 2023, 2068, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25503, 2023, 2068, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25504, 2023, 2068, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25505, 2023, 2068, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25506, 2023, 2068, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25507, 2023, 2068, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25508, 2023, 2069, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25509, 2023, 2069, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25510, 2023, 2069, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25511, 2023, 2069, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25512, 2023, 2070, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25513, 2023, 2070, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25514, 2023, 2070, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25515, 2023, 2070, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25516, 2023, 2070, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25517, 2023, 2070, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25518, 2023, 2070, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25519, 2023, 2070, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25520, 2024, 2071, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25521, 2024, 2071, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25522, 2024, 2071, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25523, 2024, 2071, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25524, 2024, 2071, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25525, 2024, 2071, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25526, 2024, 2071, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25527, 2024, 2071, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25528, 2024, 2071, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25529, 2024, 2071, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25530, 2024, 2071, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25531, 2024, 2072, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25532, 2024, 2072, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25533, 2024, 2072, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25534, 2024, 2072, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25535, 2024, 2073, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25536, 2024, 2073, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25537, 2024, 2073, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25538, 2024, 2073, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25539, 2024, 2073, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25540, 2024, 2073, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25541, 2024, 2073, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25542, 2024, 2073, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25543, 2025, 2074, N'ให้น้อง', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25544, 2025, 2074, N'จ่ายค่าโทรศัพท์', 533.93, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25545, 2025, 2074, N'จ่ายค่าห้อง', 6500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25546, 2025, 2074, N'ค่าไฟ', 1800, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25547, 2025, 2074, N'ค่าอินเตอร์เน็ต', 750, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25548, 2025, 2074, N'ประกันสังคม + ค่าภาษี', 3679.17, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25549, 2025, 2074, N'ซื้อของเข้าคอนโด (ของใช้)', 3000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25550, 2025, 2074, N'ซื้อยาคุม', 420, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25551, 2025, 2074, N'ซื้ออาหารเข้าคอนโด', 2000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25552, 2025, 2074, N'กินใช้', 6000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25553, 2025, 2074, N'เงินไปทำงานที่ออฟฟิศ', 1096, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25554, 2025, 2075, N'งบเที่ยว', 4000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25555, 2025, 2075, N'จ่ายค่า Shopee', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25556, 2025, 2075, N'ทำฟัน', 1500, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25557, 2025, 2075, N'ค่า Netflix', 139, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25558, 2025, 2076, N'ค่าแชร์1', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25559, 2025, 2076, N'เก็บ', 5000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25560, 2025, 2076, N'ค่าแชร์2', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25561, 2025, 2076, N'ลงทุน: หุ้น', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25562, 2025, 2076, N'ลงทุน: ฺBinary Option', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25563, 2025, 2076, N'ลงทุน: กองทุน', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25564, 2025, 2076, N'ลงทุน: StashAway', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (25565, 2025, 2076, N'ลงทุน: ทองคำ', 1000, NULL)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (26451, 14, 42, N'ค่าบัตรเครดิต: ค่าตั๋วเครื่องบินค่ากลับของทิพย์', 940.12, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (27451, 14, 42, N'ค่าบัตรเครดิต: ค่า Wax ขน (1/3) <หาร 2 กับน้องเตย>', 644, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (28451, 1015, 1045, N'ค่าบัตรเครดิต: ค่า Wax ขน (2/3) <หาร 2 กับน้องเตย>', 644, 0)
GO
INSERT [dbo].[FinancialDetail] ([FinancialDetailID], [FinancialInfoID], [TypeID], [Topic], [Amount], [Already_Paid]) VALUES (28452, 2015, 2045, N'ค่าบัตรเครดิต: ค่า Wax ขน (3/3) <หาร 2 กับน้องเตย>', 644, 0)
GO
SET IDENTITY_INSERT [dbo].[FinancialDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[FinancialInfo] ON 
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (8, N'December 2023', 55000, 50988.17, 4011.83, 1)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (10, N'January 2024', 55000, 49971.57, 5028.43, 1)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (11, N'February 2024', 55000, 49359.3, 5640.7, 1)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (12, N'March 2024', 55000, 48722.25, 6277.75, 1)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (13, N'April 2024', 55000, 50348.54, 4651.46, 1)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (14, N'May 2024', 55000, 49556.11, 5443.89, 0)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (1015, N'June 2024', 60000, 53432.33, 6567.67, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2015, N'July 2024', 60000, 53932.33, 6067.67, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2016, N'August 2024', 60000, 53288.33, 6711.67, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2017, N'September 2024', 60000, 52918.1, 7081.9, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2018, N'October 2024', 60000, 47918.1, 12081.9, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2019, N'November 2024', 60000, 47918.1, 12081.9, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2020, N'December 2024', 60000, 47918.1, 12081.9, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2021, N'January 2025', 60000, 47918.1, 12081.9, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2022, N'February 2025', 60000, 47918.1, 12081.9, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2023, N'March 2025', 60000, 47918.1, 12081.9, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2024, N'April 2025', 60000, 47918.1, 12081.9, NULL)
GO
INSERT [dbo].[FinancialInfo] ([FinancialInfoID], [InfoTopic], [Salary], [Use], [Balance], [IsCompleted]) VALUES (2025, N'May 2025', 60000, 47918.1, 12081.9, NULL)
GO
SET IDENTITY_INSERT [dbo].[FinancialInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[FinancialType] ON 
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (23, N'Need', 50, 27500, 8, 26920.86, 579.14)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (24, N'Want', 30, 16500, 8, 18567.31, -2067.31)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (25, N'Saving', 20, 11000, 8, 5500, 5500)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (29, N'Need', 50, 27500, 10, 26964.93, 535.07)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (30, N'Want', 30, 16500, 10, 16856.64, -356.64)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (31, N'Saving', 20, 11000, 10, 6150, 4850)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (32, N'Need', 50, 27500, 11, 27946, -446)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (33, N'Want', 30, 16500, 11, 14913.3, 1586.7)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (34, N'Saving', 20, 11000, 11, 6500, 4500)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (35, N'Need', 50, 27500, 12, 28079.93, -579.93)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (36, N'Want', 30, 16500, 12, 14142.32, 2357.68)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (37, N'Saving', 20, 11000, 12, 6500, 4500)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (38, N'Need', 50, 27500, 13, 28079.93, -579.93)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (39, N'Want', 30, 16500, 13, 16768.61, -268.61)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (40, N'Saving', 20, 11000, 13, 5500, 5500)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (41, N'Need', 50, 27500, 14, 28379.93, -879.93)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (42, N'Want', 30, 16500, 14, 15676.18, 823.82)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (43, N'Saving', 20, 11000, 14, 5500, 5500)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (1044, N'Need', 50, 30000, 1015, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (1045, N'Want', 30, 18000, 1015, 13153.23, 4846.77)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (1046, N'Saving', 20, 12000, 1015, 11500, 500)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2044, N'Need', 50, 30000, 2015, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2045, N'Want', 30, 18000, 2015, 13153.23, 4846.77)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2046, N'Saving', 20, 12000, 2015, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2047, N'Need', 50, 30000, 2016, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2048, N'Want', 30, 18000, 2016, 12509.23, 5490.77)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2049, N'Saving', 20, 12000, 2016, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2050, N'Need', 50, 30000, 2017, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2051, N'Want', 30, 18000, 2017, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2052, N'Saving', 20, 12000, 2017, 17000, -5000)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2053, N'Need', 50, 30000, 2018, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2054, N'Want', 30, 18000, 2018, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2055, N'Saving', 20, 12000, 2018, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2056, N'Need', 50, 30000, 2019, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2057, N'Want', 30, 18000, 2019, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2058, N'Saving', 20, 12000, 2019, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2059, N'Need', 50, 30000, 2020, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2060, N'Want', 30, 18000, 2020, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2061, N'Saving', 20, 12000, 2020, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2062, N'Need', 50, 30000, 2021, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2063, N'Want', 30, 18000, 2021, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2064, N'Saving', 20, 12000, 2021, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2065, N'Need', 50, 30000, 2022, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2066, N'Want', 30, 18000, 2022, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2067, N'Saving', 20, 12000, 2022, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2068, N'Need', 50, 30000, 2023, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2069, N'Want', 30, 18000, 2023, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2070, N'Saving', 20, 12000, 2023, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2071, N'Need', 50, 30000, 2024, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2072, N'Want', 30, 18000, 2024, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2073, N'Saving', 20, 12000, 2024, 12000, 0)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2074, N'Need', 50, 30000, 2025, 28779.1, 1220.9)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2075, N'Want', 30, 18000, 2025, 7139, 10861)
GO
INSERT [dbo].[FinancialType] ([TypeID], [Type], [Percent], [Value], [FinancialInfoID], [Use], [Balance]) VALUES (2076, N'Saving', 20, 12000, 2025, 12000, 0)
GO
SET IDENTITY_INSERT [dbo].[FinancialType] OFF
GO
ALTER TABLE [dbo].[FinancialInfo] ADD  CONSTRAINT [DF_FinancialInfo_IsCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
USE [master]
GO
ALTER DATABASE [Helper_Tools_DB] SET  READ_WRITE 
GO
