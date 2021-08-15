USE [master]
GO
/****** Object:  Database [PRJ321_PROJECT]    Script Date: 12/24/2020 17:43:05 ******/
CREATE DATABASE [PRJ321_PROJECT] ON  PRIMARY 
GO
ALTER DATABASE [PRJ321_PROJECT] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ321_PROJECT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ321_PROJECT] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET ARITHABORT OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PRJ321_PROJECT] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PRJ321_PROJECT] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PRJ321_PROJECT] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET  DISABLE_BROKER
GO
ALTER DATABASE [PRJ321_PROJECT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PRJ321_PROJECT] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PRJ321_PROJECT] SET  READ_WRITE
GO
ALTER DATABASE [PRJ321_PROJECT] SET RECOVERY SIMPLE
GO
ALTER DATABASE [PRJ321_PROJECT] SET  MULTI_USER
GO
ALTER DATABASE [PRJ321_PROJECT] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PRJ321_PROJECT] SET DB_CHAINING OFF
GO
USE [PRJ321_PROJECT]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/24/2020 17:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'admin', N'admin', N'admin@gmail.com', N'0987654321')
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'anhnam1', N'anhnam1', N'kahdsjga@gmail.com', N'11221122')
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'mra', N'mra', N'aa', N'aa')
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'mrb', N'mrb', N'bb', N'b')
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'nam', N'123', N'namnnhe131010@gmail.com', N'0868186194')
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'nam1', N'nam1', N'hiimhide123@gmail.com', N'098762621')
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'nam11', N'nam11', N'hiimhidhsk@gmail.com', N'55456454')
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'nam12', N'nam12', N'kjasdhj@gmail.com', N'0554555451')
INSERT [dbo].[User] ([username], [password], [email], [phone]) VALUES (N'test100', N'test100', N'namnam@gmail.com', N'789')
/****** Object:  Table [dbo].[Product]    Script Date: 12/24/2020 17:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[ProductImage] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (1, N'Milo Chocolate', 250000, N'Q1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (2, N'Matcha Strawberry', 300000, N'Q2.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (3, N'Orange Pudding', 300000, N'Q3.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (4, N'Red Velvet', 350000, N'Q4.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (5, N'Galaxy Cake', 300000, N'Q5.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (6, N'Pinky Winky', 300000, N'Q6.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (7, N'Socola Ball', 270000, N'Q7.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (8, N'Cream Pastel', 299000, N'Q8.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (9, N'Sunshine Sand', 300000, N'Q9.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (10, N'Rose Gold', 500000, N'Q10.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (11, N'Lady Garden', 500000, N'Q11.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (12, N'Cream & Strawberry', 300000, N'Q12.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (13, N'Oreo Chocolate', 300000, N'Q13.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (14, N'Grey White', 250000, N'Q14.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductImage]) VALUES (16, N'Puding', 50, N'Q1.jpg')
/****** Object:  Table [dbo].[History]    Script Date: 12/24/2020 17:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[Cart_ID] [int] IDENTITY(1,1) NOT NULL,
	[Total_Price_Cart] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[History] ON
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (1, 2100000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (2, 1500000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (3, 550000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (4, 2400000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (5, 1100000, N'nam12')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (6, 600000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (7, 250000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (8, 300000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (9, 950000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (10, 1200000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (11, 600000, N'nam1')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (12, 250000, N'nam11')
INSERT [dbo].[History] ([Cart_ID], [Total_Price_Cart], [username]) VALUES (13, 300000, N'hi')
SET IDENTITY_INSERT [dbo].[History] OFF
/****** Object:  Table [dbo].[Contact]    Script Date: 12/24/2020 17:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[contents] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Contact_1] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Contact] ([name], [email], [phone], [contents]) VALUES (N'Long', N'0383376171', N'0868186194', N'i  love you <3')
INSERT [dbo].[Contact] ([name], [email], [phone], [contents]) VALUES (N'abc', N'abc@gmail.com', N'0987654321', N'I love your cake')
INSERT [dbo].[Contact] ([name], [email], [phone], [contents]) VALUES (N'nam', N'comdachin@gmail.com', N'113', N'Good cake <3')
INSERT [dbo].[Contact] ([name], [email], [phone], [contents]) VALUES (N'Nam', N'hiimhidde@gmail.com', N'0868186194', N'i love you <3')
INSERT [dbo].[Contact] ([name], [email], [phone], [contents]) VALUES (N'Namnammmmmmmmm', N'kjasdhj@gmail.com', N'55456454', N'solution')
/****** Object:  Table [dbo].[Order]    Script Date: 12/24/2020 17:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[OrderTotalPrice] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (0, 2, 600000, 2, N'mra')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (1, 2, 500000, 1, N'mra')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (2, 2, 500000, 1, N'mrb')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (3, 2, 600000, 2, N'mra')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (4, 2, 600000, 2, N'mra')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (5, 3, 900000, 5, N'mra')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (6, 1, 299000, 8, N'nam')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (7, 1, 299000, 8, N'nam')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (8, 3, 750000, 1, N'nam')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (9, 2, 500000, 1, N'nam')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (10, 2, 600000, 2, N'nam1')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (11, 1, 300000, 2, N'nam1')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (12, 1, 300000, 13, N'nam12')
INSERT [dbo].[Order] ([OrderID], [OrderQuantity], [OrderTotalPrice], [ProductID], [username]) VALUES (13, 3, 900000, 2, N'nam1')
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/24/2020 17:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Order_Product]    Script Date: 12/24/2020 17:43:06 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
/****** Object:  ForeignKey [FK_Order_User]    Script Date: 12/24/2020 17:43:06 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Order]    Script Date: 12/24/2020 17:43:06 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Product]    Script Date: 12/24/2020 17:43:06 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
