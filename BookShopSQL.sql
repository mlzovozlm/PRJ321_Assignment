USE [master]
GO
/****** Object:  Database [BookShop]    Script Date: 19/03/18 7:45:31 AM ******/
CREATE DATABASE [BookShop] ON  PRIMARY 
( NAME = N'BookShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.PCMASTER\MSSQL\DATA\BookShop.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.PCMASTER\MSSQL\DATA\BookShop_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookShop] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookShop] SET  MULTI_USER 
GO
ALTER DATABASE [BookShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookShop] SET DB_CHAINING OFF 
GO
USE [BookShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 19/03/18 7:45:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NULL,
	[name] [nvarchar](50) NULL,
	[gender] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[dob] [date] NULL,
	[telNo] [varchar](15) NULL,
	[authen] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 19/03/18 7:45:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Author] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[cover_url] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 19/03/18 7:45:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NULL,
	[BookID] [int] NULL,
	[UnitPrice] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19/03/18 7:45:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [varchar](20) NULL,
	[OrderDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [name], [gender], [email], [dob], [telNo], [authen]) VALUES (N'aaaaa', N'12345', N'ng van c', N'male', N'aaaaa@gmail.com', CAST(N'1999-12-01' AS Date), N'0993999143', N'customer')
INSERT [dbo].[Account] ([username], [password], [name], [gender], [email], [dob], [telNo], [authen]) VALUES (N'abc', N'12345', N'ng thi a', N'female', N'm@gmail.com', CAST(N'1990-12-12' AS Date), N'0908877564', N'customer')
INSERT [dbo].[Account] ([username], [password], [name], [gender], [email], [dob], [telNo], [authen]) VALUES (N'abcdef', N'12345', N'ng thi b', N'female', N'l@gmail.com', CAST(N'1990-12-01' AS Date), N'0993422143', N'customer')
INSERT [dbo].[Account] ([username], [password], [name], [gender], [email], [dob], [telNo], [authen]) VALUES (N'staff', N'12345', N'tran van b', N'male', N'mmm@gmail.com', CAST(N'1999-12-01' AS Date), N'0939455684', N'staff')
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (1, N'Goblin Emperor', N'Katherine Addison', 5.99, N'goblinemperor.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (2, N'Der Werwolf Book 1', N'Hyougetsu', 3.99, N'derwerewolf1.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (3, N'Der Werwolf Book 2', N'Hyougetsu', 3.99, N'derwerewolf2.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (4, N'Der Werwolf Book 3', N'Hyougetsu', 3.99, N'derwerewolf3.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (5, N'Missing Magic Book 3', N'Guy Antibes', 4.99, N'missingmagic3.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (6, N'Missing Magic Book 2', N'Guy Antibes', 4.99, N'missingmagic2.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (7, N'Missing Magic Book 1', N'Guy Antibes', 4.99, N'missingmagic1.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (8, N'The Dungeoneers Book 1', N'Jeffrey Russell', 4.49, N'thedungeoneers.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (9, N'The Dungeoneers Book 2', N'Jeffrey Russell', 4.49, N'thedungeoneers.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (10, N'The Dungeoneers Book 3', N'Jeffrey Russell', 4.49, N'thedungeoneers.jpg')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Price], [cover_url]) VALUES (11, N'The Dungeoneers Book 4', N'Jeffrey Russell', 4.49, N'thedungeoneers.jpg')
SET IDENTITY_INSERT [dbo].[Book] OFF
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (15, 1, 5.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (16, 1, 5.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (16, 2, 3.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (16, 4, 3.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (16, 8, 4.49)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (16, 10, 4.49)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (17, 1, 5.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (18, 4, 3.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (19, 2, 3.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (20, 1, 5.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (21, 8, 4.49)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (21, 5, 4.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (22, 8, 4.49)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (22, 9, 4.49)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (23, 1, 5.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (23, 9, 4.49)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (24, 1, 5.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (24, 7, 4.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (25, 6, 4.99)
INSERT [dbo].[OrderDetail] ([OrderID], [BookID], [UnitPrice]) VALUES (26, 3, 3.99)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (15, N'abc', CAST(N'2019-03-13' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (16, N'abc', CAST(N'2019-03-15' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (17, N'aaaaa', CAST(N'2019-03-15' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (18, N'aaaaa', CAST(N'2019-03-15' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (19, N'aaaaa', CAST(N'2019-03-15' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (20, N'aaaaa', CAST(N'2019-03-17' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (21, N'abc', CAST(N'2019-03-18' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (22, N'abc', CAST(N'2019-03-18' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (23, N'abc', CAST(N'2019-03-18' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (24, N'abc', CAST(N'2019-03-18' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (25, N'abc', CAST(N'2019-03-18' AS Date))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate]) VALUES (26, N'abc', CAST(N'2019-03-18' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E6164023D5A04]    Script Date: 19/03/18 7:45:31 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [BookShop] SET  READ_WRITE 
GO
