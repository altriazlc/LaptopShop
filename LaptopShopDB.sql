USE [master]
GO
/****** Object:  Database [LaptopShopData]    Script Date: 11/12/2024 1:08:18 AM ******/
CREATE DATABASE [LaptopShopData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaptopShopData', FILENAME = N'F:\SQLS erver\MSSQL16.MSSQLSERVER\MSSQL\DATA\LaptopShopData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaptopShopData_log', FILENAME = N'F:\SQLS erver\MSSQL16.MSSQLSERVER\MSSQL\DATA\LaptopShopData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LaptopShopData] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaptopShopData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaptopShopData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaptopShopData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaptopShopData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaptopShopData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaptopShopData] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaptopShopData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaptopShopData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaptopShopData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaptopShopData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaptopShopData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaptopShopData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaptopShopData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaptopShopData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaptopShopData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaptopShopData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LaptopShopData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaptopShopData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaptopShopData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaptopShopData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaptopShopData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaptopShopData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaptopShopData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaptopShopData] SET RECOVERY FULL 
GO
ALTER DATABASE [LaptopShopData] SET  MULTI_USER 
GO
ALTER DATABASE [LaptopShopData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaptopShopData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaptopShopData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaptopShopData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaptopShopData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LaptopShopData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LaptopShopData', N'ON'
GO
ALTER DATABASE [LaptopShopData] SET QUERY_STORE = ON
GO
ALTER DATABASE [LaptopShopData] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LaptopShopData]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11/12/2024 1:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 11/12/2024 1:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemID] [int] IDENTITY(1,1) NOT NULL,
	[LaptopID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/12/2024 1:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laptops]    Script Date: 11/12/2024 1:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptops](
	[LaptopID] [int] IDENTITY(1,1) NOT NULL,
	[BrandID] [int] NULL,
	[CategoryID] [int] NULL,
	[ModelName] [varchar](100) NOT NULL,
	[Description] [text] NULL,
	[CreatedAt] [datetime] NULL,
	[Image] [varbinary](max) NULL,
	[Price] [decimal](10, 2) NULL,
	[Stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LaptopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 11/12/2024 1:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[LaptopID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/12/2024 1:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specifications]    Script Date: 11/12/2024 1:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specifications](
	[SpecID] [int] IDENTITY(1,1) NOT NULL,
	[LaptopID] [int] NULL,
	[Processor] [varchar](100) NULL,
	[RAM] [varchar](50) NULL,
	[Storage] [varchar](100) NULL,
	[ScreenSize] [varchar](50) NULL,
	[GraphicsCard] [varchar](100) NULL,
	[BatteryLife] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[OperatingSystem] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/12/2024 1:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[Role] [int] NULL,
	[FullName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Moneys] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1, N'ASUS')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (2, N'Dell')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (3, N'Acer')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (4, N'HP')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (5, N'MSI')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (6, N'Lenovo')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (7, N'Apple')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (8, N'Microsoft')
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
GO
INSERT [dbo].[CartItems] ([CartItemID], [LaptopID], [Quantity], [UserID]) VALUES (1, 1, 1, 5)
GO
INSERT [dbo].[CartItems] ([CartItemID], [LaptopID], [Quantity], [UserID]) VALUES (2, 1, 5, 4)
GO
INSERT [dbo].[CartItems] ([CartItemID], [LaptopID], [Quantity], [UserID]) VALUES (1004, 2, 1, 4)
GO
INSERT [dbo].[CartItems] ([CartItemID], [LaptopID], [Quantity], [UserID]) VALUES (1005, 3, 1, 4)
GO
INSERT [dbo].[CartItems] ([CartItemID], [LaptopID], [Quantity], [UserID]) VALUES (1006, 6, 1, 4)
GO
INSERT [dbo].[CartItems] ([CartItemID], [LaptopID], [Quantity], [UserID]) VALUES (1007, 5, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Gaming')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Student')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Office')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Laptops] ON 
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (1, 1, 1, N'ASUS ROG Strix', N'High performance gaming laptop', CAST(N'2024-06-27T17:19:30.090' AS DateTime), NULL, CAST(2290.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (2, 2, 1, N'MSI Stealth', N'High performance gaming laptop', CAST(N'2024-05-18T17:19:30.090' AS DateTime), NULL, CAST(1360.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (3, 1, 1, N'ASUS TUF Gaming', N'Affordable gaming laptop', CAST(N'2024-04-08T17:19:30.090' AS DateTime), NULL, CAST(2380.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (4, 2, 1, N'MSI GS66 Stealth', N'Premium gaming laptop', CAST(N'2024-04-06T17:19:30.090' AS DateTime), NULL, CAST(2360.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (5, 3, 1, N'Acer Predator Helios', N'Powerful gaming laptop', CAST(N'2023-07-10T17:19:30.090' AS DateTime), NULL, CAST(2040.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (6, 4, 1, N'Dell Alienware', N'Extreme gaming performance laptop', CAST(N'2023-11-02T17:19:30.090' AS DateTime), NULL, CAST(1370.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (7, 5, 1, N'HP Omen', N'Gaming laptop with sleek design', CAST(N'2023-10-15T17:19:30.090' AS DateTime), NULL, CAST(1190.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (8, 6, 1, N'Lenovo Legion', N'Value gaming laptop', CAST(N'2024-03-26T17:19:30.090' AS DateTime), NULL, CAST(1930.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (9, 7, 1, N'Apple MacBook Pro', N'High performance MacBook for gaming', CAST(N'2023-07-24T17:19:30.090' AS DateTime), NULL, CAST(2670.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (10, 8, 1, N'Microsoft Surface Book', N'Premium gaming experience on Surface Book', CAST(N'2024-06-27T17:19:30.090' AS DateTime), NULL, CAST(1210.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (11, 1, 2, N'ASUS ZenBook', N'Ultra-slim student laptop', CAST(N'2023-09-30T17:19:30.090' AS DateTime), NULL, CAST(1960.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (12, 2, 2, N'MSI Modern', N'Stylish and efficient student laptop', CAST(N'2024-04-21T17:19:30.090' AS DateTime), NULL, CAST(2820.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (13, 3, 2, N'Acer Swift', N'Budget-friendly student laptop', CAST(N'2023-12-21T17:19:30.090' AS DateTime), NULL, CAST(2850.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (14, 4, 2, N'Dell Inspiron', N'Reliable student laptop for everyday use', CAST(N'2024-06-13T17:19:30.090' AS DateTime), NULL, CAST(2590.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (15, 5, 2, N'HP Pavilion', N'Affordable and lightweight student laptop', CAST(N'2023-09-17T17:19:30.090' AS DateTime), NULL, CAST(2430.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (16, 6, 2, N'Lenovo IdeaPad', N'Versatile student laptop with good battery life', CAST(N'2023-10-24T17:19:30.090' AS DateTime), NULL, CAST(1190.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (17, 7, 2, N'Apple MacBook Air', N'Premium lightweight laptop for students', CAST(N'2023-12-19T17:19:30.090' AS DateTime), NULL, CAST(1560.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (18, 8, 2, N'Microsoft Surface Laptop', N'Sleek and powerful laptop for students', CAST(N'2024-03-04T17:19:30.090' AS DateTime), NULL, CAST(2100.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (19, 8, 2, N'Apple MacBook Pro', N'Premium lightweight laptop for students', CAST(N'2023-12-18T17:19:30.090' AS DateTime), NULL, CAST(1480.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (20, 1, 2, N'Asus Tuf Dash', N'Sleek and powerful laptop for students', CAST(N'2024-02-04T17:19:30.090' AS DateTime), NULL, CAST(1420.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (21, 1, 3, N'ASUS VivoBook', N'Affordable office laptop with good performance', CAST(N'2023-07-13T17:19:30.090' AS DateTime), NULL, CAST(1570.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (22, 2, 3, N'MSI Prestige', N'Professional office laptop with sleek design', CAST(N'2023-12-28T17:19:30.090' AS DateTime), NULL, CAST(1160.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (23, 3, 3, N'Acer TravelMate', N'Durable and reliable office laptop', CAST(N'2024-01-31T17:19:30.090' AS DateTime), NULL, CAST(1050.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (24, 4, 3, N'Dell Latitude', N'Business-grade office laptop with security features', CAST(N'2024-01-05T17:19:30.090' AS DateTime), NULL, CAST(1860.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (25, 5, 3, N'HP ProBook', N'Secure and manageable office laptop', CAST(N'2024-06-10T17:19:30.090' AS DateTime), NULL, CAST(2020.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (26, 6, 3, N'Lenovo ThinkPad', N'Robust office laptop for productivity', CAST(N'2023-11-27T17:19:30.090' AS DateTime), NULL, CAST(1910.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (27, 7, 3, N'Apple MacBook', N'Premium office laptop with macOS', CAST(N'2024-06-20T17:19:30.090' AS DateTime), NULL, CAST(1410.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (28, 8, 3, N'Microsoft Surface Pro', N'Versatile office laptop with detachable keyboard', CAST(N'2024-05-07T17:19:30.090' AS DateTime), NULL, CAST(2740.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (29, 7, 3, N'Apple MacBook', N'Premium office laptop with macOS', CAST(N'2023-11-17T17:19:30.090' AS DateTime), NULL, CAST(2710.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (30, 8, 3, N'Microsoft Surface Pro', N'Versatile office laptop with detachable keyboard', CAST(N'2023-10-09T17:19:30.090' AS DateTime), NULL, CAST(1110.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (1002, 1, 1, N'ASUS ROG Strix', N'High performance gaming laptop', CAST(N'2024-07-06T01:14:16.393' AS DateTime), 0x89504E470D0A1A0A0000000D4948445200000001000000010802000000, CAST(1240.00 AS Decimal(10, 2)), 999)
GO
INSERT [dbo].[Laptops] ([LaptopID], [BrandID], [CategoryID], [ModelName], [Description], [CreatedAt], [Image], [Price], [Stock]) VALUES (2008, 1, 1, N'Asus TUF', N'High Quailty', CAST(N'2024-07-09T16:31:48.900' AS DateTime), NULL, CAST(1999.00 AS Decimal(10, 2)), 999)
GO
SET IDENTITY_INSERT [dbo].[Laptops] OFF
GO
SET IDENTITY_INSERT [dbo].[Specifications] ON 
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (4, 2, N'Intel i7', N'16GB', N'512GB SSD', N'15.6"', N'NVIDIA GTX 1660', N'6 hours', N'2.5 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (5, 3, N'Intel i7', N'16GB', N'1TB SSD', N'15.6"', N'NVIDIA RTX 2060', N'6 hours', N'2.5 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (6, 4, N'Intel i7', N'16GB', N'1TB SSD', N'15.6"', N'NVIDIA RTX 2060', N'6 hours', N'2.5 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (7, 5, N'Intel i9', N'32GB', N'1TB SSD', N'17.3"', N'NVIDIA RTX 2080', N'5 hours', N'3 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (8, 6, N'Intel i9', N'32GB', N'1TB SSD', N'17.3"', N'NVIDIA RTX 2080', N'5 hours', N'3 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (9, 7, N'Intel i9', N'32GB', N'2TB SSD', N'17.3"', N'NVIDIA RTX 2080', N'5 hours', N'3 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (10, 8, N'Intel i9', N'32GB', N'2TB SSD', N'17.3"', N'NVIDIA RTX 2080', N'5 hours', N'3 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (11, 9, N'AMD Ryzen 7', N'16GB', N'1TB SSD', N'15.6"', N'AMD Radeon RX 5700', N'6 hours', N'2.5 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (12, 10, N'AMD Ryzen 7', N'16GB', N'1TB SSD', N'15.6"', N'AMD Radeon RX 5700', N'6 hours', N'2.5 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (13, 11, N'Intel i5', N'8GB', N'256GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (14, 12, N'Intel i5', N'8GB', N'256GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (15, 13, N'Intel i5', N'8GB', N'256GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (16, 14, N'Intel i5', N'8GB', N'512GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (17, 15, N'Intel i5', N'8GB', N'512GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (18, 16, N'Intel i5', N'8GB', N'512GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (19, 17, N'AMD Ryzen 5', N'8GB', N'256GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (20, 18, N'AMD Ryzen 5', N'8GB', N'256GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (21, 19, N'AMD Ryzen 5', N'8GB', N'512GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (22, 20, N'AMD Ryzen 5', N'8GB', N'512GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (23, 21, N'Intel i5', N'8GB', N'512GB SSD', N'14"', N'Integrated', N'10 hours', N'1.5 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (24, 22, N'Intel i5', N'8GB', N'512GB SSD', N'14"', N'Integrated', N'10 hours', N'1.5 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (25, 23, N'Intel i5', N'8GB', N'512GB SSD', N'14"', N'Integrated', N'10 hours', N'1.5 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (26, 24, N'Intel i7', N'16GB', N'512GB SSD', N'15.6"', N'Integrated', N'9 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (27, 25, N'Intel i7', N'16GB', N'512GB SSD', N'15.6"', N'Integrated', N'9 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (28, 26, N'Intel i7', N'16GB', N'1TB SSD', N'15.6"', N'Integrated', N'9 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (29, 27, N'Intel i7', N'16GB', N'1TB SSD', N'15.6"', N'Integrated', N'9 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (30, 28, N'AMD Ryzen 7', N'16GB', N'1TB SSD', N'15.6"', N'Integrated', N'9 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (31, 29, N'AMD Ryzen 7', N'16GB', N'1TB SSD', N'15.6"', N'Integrated', N'9 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (32, 30, N'AMD Ryzen 7', N'16GB', N'1TB SSD', N'15.6"', N'Integrated', N'9 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (36, 1, N'Intel i5', N'8GB', N'256GB SSD', N'14"', N'Integrated', N'8 hours', N'1.8 kg', N'Windows 10')
GO
INSERT [dbo].[Specifications] ([SpecID], [LaptopID], [Processor], [RAM], [Storage], [ScreenSize], [GraphicsCard], [BatteryLife], [Weight], [OperatingSystem]) VALUES (1043, 2008, N'Intel I9', N'8gb', N'512GB', N'17 inch', N'GTX1650', N'5h', N'3kg', N'Win 11')
GO
SET IDENTITY_INSERT [dbo].[Specifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [PasswordHash], [Role], [FullName], [Address], [Phone], [Moneys]) VALUES (4, N'hoanganh', N'john.doe@example.com', N'123', 1, N'John Doe', N'123 Main St, City', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [PasswordHash], [Role], [FullName], [Address], [Phone], [Moneys]) VALUES (5, N'tuan', N'nhhagp2@gmail.com', N'123', 0, N'Nguyen Huu Hoang Anh', N'VN', N'0961316508', NULL)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [PasswordHash], [Role], [FullName], [Address], [Phone], [Moneys]) VALUES (12, N'halong', N'nhhagp@gmail.com', N'123', 0, N'Nguyen Huu Hoang', N'VN', N'0961316509', NULL)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [PasswordHash], [Role], [FullName], [Address], [Phone], [Moneys]) VALUES (16, N'hoanganhdz', N'nhha@gmail.com', N'1', 1, N'Nguyen Huu Hoang Anh', N'VN', N'0961316508', NULL)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [PasswordHash], [Role], [FullName], [Address], [Phone], [Moneys]) VALUES (19, N'hoanghadz', N'nhhag2@gmail.com', N'1', 1, N'Nguyen Huu Hoang Anh', N'VN', N'0961316508', NULL)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [PasswordHash], [Role], [FullName], [Address], [Phone], [Moneys]) VALUES (20, N'hoangha', N'nhhagpp2@gmail.com', N'1', 1, N'Nguyen Huu Hoang Anh', N'VN', N'0961316508', NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053424288C3A]    Script Date: 11/12/2024 1:08:18 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Laptops] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Laptops] ADD  DEFAULT ((999)) FOR [Stock]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([LaptopID])
REFERENCES [dbo].[Laptops] ([LaptopID])
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Users]
GO
ALTER TABLE [dbo].[Laptops]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Laptops]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([LaptopID])
REFERENCES [dbo].[Laptops] ([LaptopID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Specifications]  WITH CHECK ADD FOREIGN KEY([LaptopID])
REFERENCES [dbo].[Laptops] ([LaptopID])
GO
USE [master]
GO
ALTER DATABASE [LaptopShopData] SET  READ_WRITE 
GO
