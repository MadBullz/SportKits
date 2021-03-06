USE [master]
GO
/****** Object:  Database [SportKits]    Script Date: 21/07/2021 11:25:37 ******/
CREATE DATABASE [SportKits]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportKits', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SportKits.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SportKits_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SportKits_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SportKits] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportKits].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportKits] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportKits] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportKits] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportKits] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportKits] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportKits] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SportKits] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportKits] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportKits] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportKits] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportKits] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportKits] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportKits] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportKits] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportKits] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportKits] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportKits] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportKits] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportKits] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportKits] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportKits] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportKits] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportKits] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportKits] SET  MULTI_USER 
GO
ALTER DATABASE [SportKits] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportKits] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportKits] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportKits] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SportKits] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SportKits]
GO
/****** Object:  Table [dbo].[account]    Script Date: 21/07/2021 11:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cart]    Script Date: 21/07/2021 11:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cart](
	[img] [varchar](100) NULL,
	[username] [varchar](50) NOT NULL,
	[kitID] [char](10) NOT NULL,
	[size] [char](5) NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[payment] [float] NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[kitID] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 21/07/2021 11:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kit]    Script Date: 21/07/2021 11:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kit](
	[kitID] [char](10) NOT NULL,
	[kitName] [varchar](50) NULL,
	[season] [varchar](10) NULL,
	[league] [varchar](20) NULL,
	[price] [float] NULL,
	[descript] [text] NULL,
	[supplier] [varchar](10) NULL,
	[img] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[kitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 21/07/2021 11:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orderDetails](
	[orderID] [int] NOT NULL,
	[kitID] [char](10) NOT NULL,
	[size] [char](5) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_orderDetails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[kitID] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 21/07/2021 11:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[shipDate] [date] NULL,
	[username] [varchar](50) NULL,
	[payment] [float] NULL,
	[shipping] [float] NULL,
	[total] [float] NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[storage]    Script Date: 21/07/2021 11:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[storage](
	[kitID] [char](10) NOT NULL,
	[size] [char](5) NOT NULL,
	[num_left] [int] NULL,
	[inDate] [date] NULL,
 CONSTRAINT [PK_storage] PRIMARY KEY CLUSTERED 
(
	[kitID] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'asd', N'asd', N'user')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'mnb', N'mnb', N'user')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'mra', N'mra', N'admin')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'mrb', N'mrb', N'user')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'mrc', N'mrc', N'user')
INSERT [dbo].[customer] ([username], [email], [address], [phone]) VALUES (N'asd', N'asd@gmail.com', N'Tu Son', N'888456')
INSERT [dbo].[customer] ([username], [email], [address], [phone]) VALUES (N'mnb', N'mnb@gmail.com', N'Dai Dong', N'258963')
INSERT [dbo].[customer] ([username], [email], [address], [phone]) VALUES (N'mra', N'mra@gmail.com', N'Hanoi', N'123456')
INSERT [dbo].[customer] ([username], [email], [address], [phone]) VALUES (N'mrb', N'mrb@gmail.com', N'Hai Phong', N'456789')
INSERT [dbo].[customer] ([username], [email], [address], [phone]) VALUES (N'mrc', N'mrc@gmail.com', N'Da Nang', N'159753')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'ACMA2021  ', N'AC Milan (AWAY) 2020/2021', N'2020-2021', N'Series A', 73.87, N'AC Milan Away Kit Season 20/21', N'Puma', N'image/ACMA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'ACMH2021  ', N'AC Milan (HOME) 2020/2021', N'2020-2021', N'Series A', 73.87, N'AC Milan Home Kit Season 20/21', N'Puma', N'image/ACMH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'ARSA2021  ', N'Arsenal (AWAY) 2020/2021', N'2020-2021', N'Premier League', 78.25, N'Arsenal Away Kit Season 20/21', N'Adidas', N'image/ARSA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'ARSH2021  ', N'Arsenal (HOME) 2020/2021', N'2020-2021', N'Premier League', 78.25, N'Arsenal Home Kit Season 20/21', N'Adidas', N'image/ARSH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'ATMA2021  ', N'Atletico Madrid (AWAY) 2020/2021', N'2020-2021', N'La Liga', 79.65, N'Atletico Madrid Away Kit Season 20/21', N'Nike', N'image/ATMA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'ATMH2021  ', N'Atletico Madrid (HOME) 2020/2021', N'2020-2021', N'La Liga', 79.65, N'Atletico Madrid Home Kit Season 20/21', N'Nike', N'image/ATMH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'BARA2021  ', N'FC Barcelona (AWAY) 2020/2021', N'2020-2021', N'La Liga', 92.669998168945312, N'FC Barcelona Away Kit Season 20/21', N'Nike', N'image/BARA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'BARH2021  ', N'FC Barcelona (HOME) 2020/2021', N'2020-2021', N'La Liga', 92.669998168945312, N'FC Barcelona Home Kit Season 20/21', N'Nike', N'image/BARH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'BVBH2021  ', N'Borussia Dortmund (HOME) 2020/2021', N'2020-2021', N'Bundesliga', 72.25, N'Borussia Dortmund Home Kit Season 20/21', N'Puma', N'image/BVBH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'HFCH2021  ', N'Ha Noi FC (HOME) 2020/2021', N'2020-2021', N'V-League', 45.35, N'Ha Noi FC Home Kit Season 20/21', N'Kappa', N'image/HFCH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'INTA2021  ', N'Inter Milan (AWAY) 2020/2021', N'2020-2021', N'Series A', 77.459999084472656, N'Inter Milan Away Kit Season 20/21', N'Nike', N'image/INTA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'INTH2021  ', N'Inter Milan (HOME) 2020/2021', N'2020-2021', N'Series A', 77.459999084472656, N'Inter Milan Home Kit Season 20/21', N'Nike', N'image/INTH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'JUVA2021  ', N'Juventus (AWAY) 2020/2021', N'2020-2021', N'Series A', 80.7300033569336, N'Juventus Away Kit Season 20/21', N'Adidas', N'image/JUVA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'JUVH2021  ', N'Juventus (Home) 2020/2021', N'2020-2021', N'Series A', 80.7300033569336, N'Juventus Home Kit Season 20/21', N'Adidas', N'image/JUVH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'LIVA2021  ', N'Liverpool (AWAY) 2020/2021 ', N'2020-2021', N'Premier League', 85.35, N'Liverpool Away Season 20/21', N'Nike', N'image/LIVA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'LIVH2021  ', N'Liverpool (HOME) 2020/2021 ', N'2020-2021', N'Premier League', 85.35, N'Liverpool Home Season 20/21', N'Nike', N'image/LIVH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'LYOA2021  ', N'Olympique Lyonnais (AWAY) 2020/2021', N'2020-2021', N'Ligue 1', 79.99, N'Olympique Lyonnais Away Kit Season 20/21', N'Nike', N'image/LYOA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'LYOH2021  ', N'Olympique Lyonnais (HOME) 2020/2021', N'2020-2021', N'Ligue 1', 79.99, N'Olympique Lyonnais Home Kit Season 20/21', N'Adidas', N'image/LYOH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'MCIA2021  ', N'Manchester City (AWAY) 2020/2021', N'2020-2021', N'Premier League', 88.55, N'Manchester City Away Kit Season 20/21', N'Puma', N'image/MCIA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'MCIH2021  ', N'Manchester City (HOME) 2020/2021', N'2020-2021', N'Premier League', 88.55, N'Manchester City Home Kit Season 20/21', N'Puma', N'image/MCIH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'MUNA2021  ', N'Manchester United (AWAY) 2020/2021', N'2020-2021', N'Premier League', 86.95, N'Manchester United Away Kit Season 20/21', N'Adidas', N'image/MUNA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'MUNH2021  ', N'Manchester United (HOME) 2020/2021', N'2020-2021', N'Premier League', 86.95, N'Manchester United Home Kit Season 20/21', N'Adidas', N'image/MUNH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'PSGA2021  ', N'Paris Saint-Germain (AWAY) 2020/2021', N'2020-2021', N'Ligue 1', 81.55, N'Paris Saint-Germain Away Kit Season 20/21', N'Nike', N'image/PSGA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'PSGH2021  ', N'Paris Saint-Germain (HOME) 2020/2021', N'2020-2021', N'Ligue 1', 81.55, N'Paris Saint-Germain Home Kit Season 20/21', N'Nike', N'image/PSGH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'RMAA2021  ', N'Real Madrid (AWAY) 2020/2021', N'2020-2021', N'La Liga', 95.8499984741211, N'Real Madrid Away Season 20/21', N'Adidas', N'image/RMAA2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'RMAH2021  ', N'Real Madrid (HOME) 2020/2021', N'2020-2021', N'La Liga', 95.8499984741211, N'Real Madrid Home Season 20/21', N'Adidas', N'image/RMAH2021.jpg')
INSERT [dbo].[kit] ([kitID], [kitName], [season], [league], [price], [descript], [supplier], [img]) VALUES (N'TOTH2021  ', N'Tottenham', N'2020-2021', N'Premier League', 79.9, N'Tottenham Home Kit 20/21', N'Nike', N'image/TOTH2021.jpg')
INSERT [dbo].[orderDetails] ([orderID], [kitID], [size], [price], [quantity], [total]) VALUES (10, N'ACMA2021  ', N'L    ', 73.87, 1, 73.87)
INSERT [dbo].[orderDetails] ([orderID], [kitID], [size], [price], [quantity], [total]) VALUES (10, N'BARH2021  ', N'XL   ', 92.67, 2, 185.34)
INSERT [dbo].[orderDetails] ([orderID], [kitID], [size], [price], [quantity], [total]) VALUES (11, N'BVBH2021  ', N'XL   ', 72.25, 1, 72.25)
INSERT [dbo].[orderDetails] ([orderID], [kitID], [size], [price], [quantity], [total]) VALUES (12, N'HFCH2021  ', N'L    ', 45.35, 1, 45.35)
INSERT [dbo].[orderDetails] ([orderID], [kitID], [size], [price], [quantity], [total]) VALUES (13, N'HFCH2021  ', N'L    ', 45.35, 1, 45.35)
INSERT [dbo].[orderDetails] ([orderID], [kitID], [size], [price], [quantity], [total]) VALUES (14, N'ACMA2021  ', N'XL   ', 73.87, 2, 147.74)
INSERT [dbo].[orderDetails] ([orderID], [kitID], [size], [price], [quantity], [total]) VALUES (14, N'PSGA2021  ', N'XL   ', 81.55, 1, 81.55)
INSERT [dbo].[orderDetails] ([orderID], [kitID], [size], [price], [quantity], [total]) VALUES (15, N'HFCH2021  ', N'XL   ', 45.35, 10, 453.5)
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([orderID], [orderDate], [shipDate], [username], [payment], [shipping], [total], [status]) VALUES (10, CAST(N'2021-07-09' AS Date), CAST(N'2021-07-09' AS Date), N'mnb', 259.21, 1.3, 260.51, N'delivered')
INSERT [dbo].[orders] ([orderID], [orderDate], [shipDate], [username], [payment], [shipping], [total], [status]) VALUES (11, CAST(N'2021-07-09' AS Date), CAST(N'2021-07-13' AS Date), N'mrc', 72.25, 0.36, 72.61, N'delivered')
INSERT [dbo].[orders] ([orderID], [orderDate], [shipDate], [username], [payment], [shipping], [total], [status]) VALUES (12, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-18' AS Date), N'mra', 45.35, 0.23, 45.58, N'delivering')
INSERT [dbo].[orders] ([orderID], [orderDate], [shipDate], [username], [payment], [shipping], [total], [status]) VALUES (13, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-18' AS Date), N'mra', 45.35, 0.23, 45.58, N'delivering')
INSERT [dbo].[orders] ([orderID], [orderDate], [shipDate], [username], [payment], [shipping], [total], [status]) VALUES (14, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date), N'mnb', 229.29, 1.15, 230.44, N'delivered')
INSERT [dbo].[orders] ([orderID], [orderDate], [shipDate], [username], [payment], [shipping], [total], [status]) VALUES (15, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-18' AS Date), N'mra', 453.5, 2.27, 455.77, N'delivering')
SET IDENTITY_INSERT [dbo].[orders] OFF
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'ACMA2021  ', N'L    ', 48, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'ACMA2021  ', N'XL   ', 48, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'ACMH2021  ', N'L    ', 50, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'ACMH2021  ', N'XL   ', 50, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'ARSA2021  ', N'XL   ', 49, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'ARSH2021  ', N'XL   ', 50, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'BARA2021  ', N'XL   ', 50, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'BARH2021  ', N'XL   ', 38, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'BVBH2021  ', N'XL   ', 49, CAST(N'2021-07-09' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'HFCH2021  ', N'XL   ', 20, CAST(N'2021-07-13' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'LIVA2021  ', N'XL   ', 48, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'LIVH2021  ', N'XL   ', 50, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'PSGA2021  ', N'XL   ', 49, CAST(N'2021-07-07' AS Date))
INSERT [dbo].[storage] ([kitID], [size], [num_left], [inDate]) VALUES (N'PSGH2021  ', N'XL   ', 48, CAST(N'2021-07-07' AS Date))
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_username] FOREIGN KEY([username])
REFERENCES [dbo].[customer] ([username])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_username]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_user] FOREIGN KEY([username])
REFERENCES [dbo].[customer] ([username])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_user]
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([kitID])
REFERENCES [dbo].[kit] ([kitID])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[orders] ([orderID])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[customer] ([username])
GO
ALTER TABLE [dbo].[storage]  WITH CHECK ADD  CONSTRAINT [FK_storage_kit] FOREIGN KEY([kitID])
REFERENCES [dbo].[kit] ([kitID])
GO
ALTER TABLE [dbo].[storage] CHECK CONSTRAINT [FK_storage_kit]
GO
USE [master]
GO
ALTER DATABASE [SportKits] SET  READ_WRITE 
GO
