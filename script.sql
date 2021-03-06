USE [ShopGiay]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [varchar](max) NULL,
	[ParentId] [int] NULL DEFAULT ('0'),
	[Orders] [int] NULL,
	[Img] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaDesc] [nvarchar](max) NULL,
	[Created_By] [int] NULL DEFAULT ('1'),
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Detail] [nvarchar](255) NULL,
	[FullName] [nvarchar](64) NOT NULL,
	[Phone] [varchar](12) NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
	[UserId] [int] NULL,
	[DateContact] [datetime] NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Links]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slug] [nvarchar](255) NOT NULL,
	[TypeLink] [nvarchar](255) NOT NULL,
	[TableId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[ParentId] [int] NULL DEFAULT ('0'),
	[Orders] [int] NOT NULL,
	[MenuType] [varchar](155) NOT NULL,
	[Position] [varchar](155) NOT NULL,
	[TableId] [int] NULL,
	[Created_By] [int] NULL DEFAULT ('1'),
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orderdetails]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderdetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceBuy] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[DeliveryName] [nvarchar](255) NULL,
	[DeliveryEmail] [nvarchar](255) NULL,
	[DeliveryPhone] [nvarchar](255) NULL,
	[DeliveryAddress] [nvarchar](255) NULL,
	[Note] [nvarchar](255) NULL,
	[UserId] [int] NOT NULL,
	[DateOrder] [datetime] NOT NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Img] [nvarchar](255) NOT NULL,
	[PostType] [nvarchar](100) NULL,
	[MetaKey] [nvarchar](155) NULL,
	[MetaDesc] [nvarchar](155) NULL,
	[Created_By] [int] NULL DEFAULT ('1'),
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [varchar](max) NOT NULL,
	[Detail] [nvarchar](max) NULL,
	[PriceBuy] [float] NOT NULL,
	[Img] [varchar](255) NOT NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaDesc] [nvarchar](max) NULL,
	[Created_By] [int] NULL DEFAULT ('1'),
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductSales]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[PriceSale] [float] NULL,
	[DateBegin] [datetime] NULL,
	[DateEnd] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Link] [varchar](255) NOT NULL,
	[Img] [varchar](100) NOT NULL,
	[Position] [varchar](100) NOT NULL,
	[Orders] [int] NULL,
	[Created_By] [int] NULL DEFAULT ('1'),
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Slug] [varchar](255) NOT NULL,
	[ParentId] [int] NOT NULL DEFAULT ('0'),
	[Orders] [int] NULL,
	[MetaKey] [nvarchar](155) NULL,
	[MetaDesc] [nvarchar](155) NULL,
	[Created_By] [int] NULL DEFAULT ('1'),
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/07/2021 11:45:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[UserName] [varchar](225) NOT NULL,
	[Password] [varchar](40) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Img] [varchar](255) NOT NULL,
	[Gender] [int] NULL,
	[Roles] [int] NOT NULL,
	[Created_By] [int] NULL DEFAULT ('1'),
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NULL DEFAULT ('1'),
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'Converse', N'Site/HomeProductCon', 0, 1, N'converse.jpg', N'metakey', N'Giày Converse chính hãng với lịch sử hình thành và phát triển hơn 100 năm để ngày nay trở thành “Thương hiệu giày thể thao được giới trẻ yêu thích”', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-07-26 13:57:34.240' AS DateTime), 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Vans', N'Site/HomeProductVa', 0, 2, N'vans.jpg', N'metakey', N'Giày Vans chính hãng được đại đa số giới trẻ biết đến là một trong những thương hiệu giày thể thao hàng đầu của thế giới, có sức ảnh hưởng lớn đến thời trang  và các nền văn hóa đường phố: hip-hop, BMX và Skaterboarding.', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (3, N'Palladium', N'Site/HomeProductPa', 0, 3, N'palla.jpg', N'metakey', N'Với Palladium, mọi người sẽ dễ dàng nhận diện được một thiết kế đậm chất quân đội nhưng vô cùng thời trang và cá tính. Sự thay đổi và nâng cấp chất lượng của dòng giày đã khiến sản phẩm trở thành một trong những item không thể thiếu của các tín đồ Hiking, thích sự tự do, phóng khoáng và trải nghiệm.', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-07-25 00:08:26.627' AS DateTime), 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (4, N'Supra', N'Site/HomeProductSu', 0, 4, N'supra.jpg', N'metakey', N'Ắt hẳn các “thần kinh giày” đã không còn xa lạ với những đôi giày SUPRA cổ cao bởi sức nóng của thương hiệu này có ảnh hưởng không nhỏ đến văn hóa ván trượt sneaker và thời trang đường phố của giới trẻ. Trên thực tế những thiết kế của SUPRA dù là cổ điển hay hiện đại vẫn luôn được mọi người đón nhận.', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (5, N'Converse Run Star Hike Keith Haring', N'converse-run-star-hike-keith-haring', 1, 1, N'Con_1.jpg', N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (6, N'Converse Chuck Taylor All Star 1970s Keith Haring ', N'converse-chuck-taylor-all-star-1970s-keith-haring', 1, 2, N'Con_2.jpg', N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (7, N'Converse Chuck Taylor All Star Keith Haring', N'converse-chuck-taylor-all-star-keith-haring', 1, 3, N'Con_3.jpg', N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (8, N'Converse Chuck Taylor All Star Lift Festival', N'converse-chuck-taylor-all-star-lift-festival', 1, 4, N'Con_4.jpg', N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (9, N'Converse Chuck Taylor All Star Lift Canvas', N'converse-chuck-taylor-all-star-lift-canvas', 1, 5, N'Con_5.jpg', N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (10, N'Converse Chuck Taylor All Star Renew Sock Knit', N'converse-chuck-taylor-all-star-renew-sock-knit', 1, 6, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (11, N'Converse Chuck Taylor All Star 1970s Archive Paint Splatter', N'converse-chuck-taylor-all-star-1970s-archive-paint-splatter', 1, 7, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-07-24 22:52:37.467' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (12, N'Converse Chuck Taylor All Star Lift Archive Print ', N'converse-chuck-taylor-all-star-lift-archive-print', 1, 8, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (13, N'Converse Chuck Taylor All Star Move Low Top', N'converse-chuck-taylor-all-star-move-low-top', 1, 9, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (14, N'Converse Chuck Taylor All Star 1970s My Story', N'converse-chuck-taylor-all-star-1970s-my-story', 1, 10, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (15, N'Converse Chuck Taylor All Star Wordmark', N'converse-chuck-taylor-all-star-wordmark', 1, 11, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (16, N'Vans UA Old Skool Style 36 SE Bikes', N'vans-ua-old-skool-style-36-se-bikes', 2, 1, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (17, N'Vans UA Era Bandana', N'vans-ua-era-bandana', 2, 2, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (18, N'Vans UA Old Skool Color Theory Shale Green', N'vans-ua-old-skool-color-theory-shale-green', 2, 3, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (19, N'Palladium Pampa Lite Overlab Neon', N'palladium-pampa-lite-overlab-neon', 3, 1, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (20, N'Palladium Pallabrousse Legion', N'palladium-pallabrousse-legion', 3, 2, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (21, N'Palladium Pampa Sport Cuff WPN ', N'palladium-pampa-sport-cuff-wpn', 3, 3, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (22, N'Palladium Pallakix Dare Exchange', N'palladium-pallakix-dare-exchange', 3, 4, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (23, N'Palladium Pampa Hi Mono Chrome III', N'palladium-pampa-hi-mono-chrome-iii', 3, 5, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (24, N'Palladium Pampa Hi Dare', N'palladium-pampa-hi-dare', 3, 6, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (25, N'Supra Breaker', N'supra-breaker', 4, 1, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (26, N'Supra Lizard', N'supra-lizard', 4, 2, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (27, N'Supra Stacks II VULC', N'supra-stacks-ii-vulc', 4, 3, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (28, N'Supra Aluminum', N'supra-aluminum', 4, 4, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (29, N'Supra Vaider', N'supra-vaider', 4, 5, NULL, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (33, N'Vans UA Classic Slip-On Disruptive', N'vans-ua-classic-slip-on-disruptive', 2, 4, N'Va_4.jpg', N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (34, N'Vans UA Authentic Disruptive', N'vans-ua-authentic-disruptive', 2, 5, N'Va_5.jpg', N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Categorys] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Title], [Detail], [FullName], [Phone], [Email], [UserId], [DateContact], [Updated_By], [Updated_At], [Status]) VALUES (1, N'Tiêu đề liên hệ', N'Nội dung liên hệ', N'Nguyễn Văn An', N'0987654321', N'nguyenvanan@gmail.com', NULL, CAST(N'2021-06-16 13:10:10.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Contacts] ([Id], [Title], [Detail], [FullName], [Phone], [Email], [UserId], [DateContact], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Tiêu đề liên hệ', N'Nội dung liên hệ', N'Nguyễn Văn An', N'0987654321', N'nguyenvanan@gmail.com', NULL, CAST(N'2021-06-16 13:10:10.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Contacts] ([Id], [Title], [Detail], [FullName], [Phone], [Email], [UserId], [DateContact], [Updated_By], [Updated_At], [Status]) VALUES (3, N'Tiêu đề liên hệ', N'Nội dung liên hệ', N'Nguyễn Văn An', N'0987654321', N'nguyenvanan@gmail.com', NULL, CAST(N'2021-06-16 13:10:10.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[Links] ON 

INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (1, N'converse-run-star-hike-keith-haring', N'product', 1)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (2, N'converse-chuck-taylor-all-star-1970s-keith-haring', N'product', 2)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (3, N'converse-chuck-taylor-all-star-keith-haring', N'product', 3)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (4, N'converse-chuck-taylor-all-star-lift-festival', N'product', 4)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (5, N'converse-chuck-taylor-all-star-lift-canvas', N'product', 5)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (6, N'converse-chuck-taylor-all-star-renew-sock-knit', N'product', 6)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (7, N'converse-chuck-taylor-all-star-1970s-archive-paint-splatter', N'product', 7)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (8, N'converse-chuck-taylor-all-star-lift-archive-print', N'product', 8)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (9, N'converse-chuck-taylor-all-star-move-low-top', N'product', 9)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (10, N'converse-chuck-taylor-all-star-1970s-my-story', N'product', 10)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (11, N'converse-chuck-taylor-all-star-wordmark', N'product', 11)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (12, N'vans-ua-old-skool-style-36-se-bikes', N'product', 12)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (13, N'vans-ua-era-bandana', N'product', 13)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (14, N'vans-ua-old-skool-color-theory-shale-green', N'product', 14)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (15, N'palladium-pampa-lite-overlab-neon', N'product', 15)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (16, N'palladium-pallabrousse-legion', N'product', 16)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (17, N'palladium-pampa-sport-cuff-wpn', N'product', 17)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (18, N'palladium-pallakix-dare-exchange', N'product', 18)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (19, N'palladium-pampa-hi-mono-chrome-iii', N'product', 19)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (20, N'palladium-pampa-hi-dare', N'product', 20)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (21, N'supra-breaker', N'product', 21)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (22, N'supra-lizard', N'product', 22)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (23, N'supra-stacks-ii-vulc', N'product', 23)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (24, N'supra-aluminum', N'product', 24)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (25, N'supra-vaider', N'product', 25)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (28, N'vans-ua-classic-slip-on-disruptive', N'product', 31)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (29, N'vans-ua-authentic-disruptive', N'product', 35)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (30, N'converse', N'category', 1)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (31, N'vans', N'category', 2)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (32, N'palladium', N'category', 3)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (33, N'supra', N'category', 4)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (34, N'tin-tuc', N'topic', 1)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (35, N'gioi-thieu', N'page', 1)
INSERT [dbo].[Links] ([Id], [Slug], [TypeLink], [TableId]) VALUES (36, N'gioi-thieu-2', N'page', 2)
SET IDENTITY_INSERT [dbo].[Links] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'Trang chủ', N'#', 0, 1, N'custom', N'mainmenu', NULL, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Giới thiệu', N'gioi-thieu', 0, 2, N'page', N'mainmenu', NULL, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (3, N'Sản phẩm', N'san-pham', 0, 3, N'custom', N'mainmenu', NULL, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (4, N'Tin tức', N'Site/PostTopic', 0, 4, N'topic', N'mainmenu', NULL, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (5, N'Converse', N'converse', 3, 1, N'category', N'mainmenu', 1, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (6, N'Vans', N'vans', 3, 2, N'category', N'mainmenu', 2, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (7, N'Palladium', N'palladium', 3, 3, N'category', N'mainmenu', 3, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (8, N'Supra', N'supra', 3, 4, N'category', N'mainmenu', 4, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [ParentId], [Orders], [MenuType], [Position], [TableId], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (9, N'Liên hệ', N'lien-he', 0, 5, N'custom', N'mainmenu', NULL, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Orderdetails] ON 

INSERT [dbo].[Orderdetails] ([Id], [OrderId], [ProductId], [Quantity], [PriceBuy]) VALUES (1, 1, 1, 2, 348000)
INSERT [dbo].[Orderdetails] ([Id], [OrderId], [ProductId], [Quantity], [PriceBuy]) VALUES (2, 1, 2, 3, 248000)
INSERT [dbo].[Orderdetails] ([Id], [OrderId], [ProductId], [Quantity], [PriceBuy]) VALUES (3, 1, 3, 4, 448000)
INSERT [dbo].[Orderdetails] ([Id], [OrderId], [ProductId], [Quantity], [PriceBuy]) VALUES (4, 1, 4, 4, 148000)
INSERT [dbo].[Orderdetails] ([Id], [OrderId], [ProductId], [Quantity], [PriceBuy]) VALUES (5, 2, 1, 2, 348000)
INSERT [dbo].[Orderdetails] ([Id], [OrderId], [ProductId], [Quantity], [PriceBuy]) VALUES (6, 2, 2, 3, 248000)
INSERT [dbo].[Orderdetails] ([Id], [OrderId], [ProductId], [Quantity], [PriceBuy]) VALUES (7, 2, 3, 4, 448000)
INSERT [dbo].[Orderdetails] ([Id], [OrderId], [ProductId], [Quantity], [PriceBuy]) VALUES (8, 2, 4, 4, 148000)
SET IDENTITY_INSERT [dbo].[Orderdetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Code], [DeliveryName], [DeliveryEmail], [DeliveryPhone], [DeliveryAddress], [Note], [UserId], [DateOrder], [Updated_By], [Updated_At], [Status]) VALUES (1, 123456, N'Nguyễn Văn An', N'nguyenvanan@gmail.com', N'0987654321', N'HCM', NULL, 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), NULL, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([Id], [Code], [DeliveryName], [DeliveryEmail], [DeliveryPhone], [DeliveryAddress], [Note], [UserId], [DateOrder], [Updated_By], [Updated_At], [Status]) VALUES (2, 123456, N'Nguyễn Văn An', N'nguyenvanan@gmail.com', N'0987654321', N'HCM', NULL, 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), NULL, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([Id], [Code], [DeliveryName], [DeliveryEmail], [DeliveryPhone], [DeliveryAddress], [Note], [UserId], [DateOrder], [Updated_By], [Updated_At], [Status]) VALUES (3, 123457, N'Nguyễn Văn An', N'nguyenvanan@gmail.com', N'0987654321', N'HCM', NULL, 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), NULL, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([Id], [Code], [DeliveryName], [DeliveryEmail], [DeliveryPhone], [DeliveryAddress], [Note], [UserId], [DateOrder], [Updated_By], [Updated_At], [Status]) VALUES (4, 123458, N'Nguyễn Văn An', N'nguyenvanan@gmail.com', N'0987654321', N'HCM', NULL, 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), NULL, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, NULL, N'Giới thiệu', N'gioi-thieu', N'Nội dung bài viết', N'gioithieu.png', N'page', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, NULL, N'Giới thiệu 2', N'gioi-thieu-2', N'Nội dung bài viết', N'gioithieu.png', N'page', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (3, NULL, N'Giới thiệu 3', N'gioi-thieu-3', N'Nội dung bài viết', N'gioithieu.png', N'page', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (4, NULL, N'Giới thiệu 4', N'gioi-thieu-4', N'Nội dung bài viết', N'gioithieu.png', N'page', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (5, NULL, N'Giới thiệu 5', N'gioi-thieu-5', N'Nội dung bài viết', N'gioithieu.png', N'page', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (6, 2, N'
Giày Converse Chuck Taylor All Star cổ thấp được săn đón mùa hè này', N'tin-tuc-1', N'Được xem như một item không thể thiếu của những bạn trẻ yêu thích sự năng động, thoải mái và vẫn hợp thời trang. Giày Converse Chuck Taylor All Star cổ thấp với nhiều mẫu mã và kiểu dáng khác nhau luôn luôn được các bạn trẻ săn đón. Hãy cùng Drake VN khám phá những mẫu giày Converse Chuck Taylor cổ thấp độc đáo ngay dưới đây nhé. Nguồn: Sưu ...', N'Post_1.gif', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (7, 2, N'
Chinh phục mọi outfit với các mẫu giày Converse siêu ấn tượng', N'tin-tuc-2', N'Converse từ lâu là một thương hiệu nổi tiếng được rất nhiều người yêu thích vì kiểu dáng thanh lịch, cổ điển của nó. Để giữ vững phong độ đến ngày hôm nay, các nhà thiết kế Converse đã luôn luôn sáng tạo và cho ra nhiều mẫu thiết kế độc đáo và ấn tượng, hợp thời trang hơn. Hãy cùng Drake VN khám phá n...', N'Post_2.gif', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (8, 2, N'Khám phá những đôi giày Converse Chuck Taylor All Star 1970s cực chất', N'tin-tuc-3', N'Để thay đổi phong cách hàng ngày trở nên cá tính và đa dạng hơn thì các bạn đừng nên bỏ qua các mẫu giày Converse đang được nhiều sneakerhead yêu thích nhé. Với nhiều mẫu mã đa dạng khác nhau, Converse luôn luôn đem tới những trải nghiệm tuyệt vời nhất cho khách hàng của mình. Đặc biệt là những đôi giày C...', N'Post_3.gif', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (9, 2, N'Tạo cái nhìn ấn tượng cùng giày sneaker trắng Vans Old Skool classic', N'tin-tuc-4', N'Nói đến dòng giày mang tính biểu tượng của thương hiệu trượt ván không thể không nhắc đến những đôi giày sneaker trắng Vans Old Skool classic. Mang đến sự tinh tế không chỉ là cách phối hợp giày với trang phục mà Old Skool classic lại sở hữu thiết kế đơn giản nhưng vẫn chất lượng và nổi bật. Ngoài thiết kế đẹp mắt, thì đôi Vans Old Skool ...', N'Post_4.gif', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (10, 2, N'
Cùng Drake VN trả lời câu hỏi  “Giày Vans dành cho nam hay nữ” ', N'tin-tuc-5', N'Vans không chỉ đơn thuần là giày, mà còn là người bạn trung thành tuyệt đối với lứa tuổi thanh thiếu niên giúp nâng niu bước chân của những tín đồ ưa chuộng. Đối với một số bạn trẻ, giày Vans không phải là bạn thì cũng là món đồ vật lưu lại những kỷ niệm một thời: lúc chạy nhảy năng động hay những bước chân thảnh thơi. Tuy nhiên, gắn bó keo sơn là ...', N'Post_5.gif', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (11, 0, N'Tin tức 6', N'tin-tuc-6', N'Nội dung bài viết', N'gioithieu.png', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (12, 0, N'Tin tức 7', N'tin-tuc-7', N'Nội dung bài viết', N'gioithieu.png', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (13, 0, N'Tin tức 8', N'tin-tuc-8', N'Nội dung bài viết', N'gioithieu.png', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (14, 0, N'Tin tức 9', N'tin-tuc-9', N'Nội dung bài viết', N'gioithieu.png', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (15, 3, N'Dịch vụ 1', N'dich-vu-1', N'Nội dung bài viết', N'dich-vu-1.jpg', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (16, 3, N'Dịch vụ 2', N'dich-vu-1', N'Nội dung bài viết', N'dich-vu-2.jpg', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([Id], [TopicId], [Title], [Slug], [Detail], [Img], [PostType], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (17, 3, N'Dịch vụ 3', N'dich-vu-1', N'Nội dung bài viết', N'dich-vu-3.jpg', N'post', N'Metakeyword', N'Metadesc', 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-30 16:10:10.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, 1, N'Converse Run Star Hike Keith Haring', N'converse-run-star-hike-keith-haring', N'Thiết kế Run Star Hike mang tone màu Black làm nổi bật những hình ảnh ngộ nghĩnh thuộc phong cách vẽ Botanical Art đầy bắt mắt của Keith Haring. Đặc biệt, gây ấn tượng là sự xuất hiện của chữ ký của Keith Haring xuất hiện trên lưỡi gà và cả trong lót giày. Đôi giày hứa hẹn sẽ mang lại cho bạn trải nghiệm tuyệt vời trên bộ đế chunky răng cưa đầy táo bạo cùng nội thất đáng “đồng tiền bát gạo”.', 2500000, N'Con_1.jpg', N'Converse x Keith Haring', N'Sử dụng chất liệu vải Canvas êm ái, thoáng khí.
Thiết kế đế Chunky gây ấn tượng mạnh bởi sự “hầm hố”, phá cách.
Ứng dụng nghệ thuật tương phản của các tác phẩm Keith Haring nên phần tape có màu đỏ nổi bật trên nền giày đen.
Đệm lót OrthoLite tạo sự thoải mái cho người mang.
Đế ngoài có khóa màu, mặt đế hình răng cưa đặc sắc.', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, 1, N'Converse Chuck Taylor All Star 1970s Keith Haring ', N'converse-chuck-taylor-all-star-1970s-keith-haring', N'Những họa tiết độc đáo, phác họa được những khía cạnh cuộc sống của Keith Haring đã được thể hiện một cách ấn tượng trên thiết kế của Converse x Keith Haring Chuck 70 Bone. Kết hợp đan xen giữa kỹ thuật thêu và in tràn đế, thiết kế lần này đã “thổi một làn gió mới” vào thời trang hiện đại. Converse x Keith Haring Chuck 70 Bone hứa hẹn sẽ giúp bạn trở nên nổi bật hơn cùng những outfit xuống phố của mình.', 2000000, N'Con_2.jpg', N'Converse x Keith Haring', N'Nổi bật với phong cách vẽ Botanical Art đầy ấn tượng cùng kỹ thuật thêu và in tràn đế bắt mắt
Chất liệu Canvas cao cấp nhẹ và bền bỉ.
Đệm lót OrthoLite tạo sự thoải mái cho người sử dụng.
Thiết kế đế cao, dày dặn giúp tăng chiều cao và cải thiện vóc dáng cho người mang.
Mặt đế làm bằng cao su cao cấp với mặt đế vân kim cương đặc trưng được điểm nhấn bằng những vệt đỏ trên nền đen.
Khoen giày được phủ một lớp kim loại hạn chế rỉ sét.', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (3, 1, N'Converse Chuck Taylor All Star Keith Haring', N'converse-chuck-taylor-all-star-keith-haring', N'Converse x Keith Haring Chuck Taylor All Star Optical White mang thiết kế ấn tượng độc đáo với phần upper được phủ toàn bộ họa tiết của Keith Haring vô cùng sinh động. Những hình vẽ con người với nhiều tư thế khác nhau cùng các đường vẽ đỏ sinh động càng làm cho phần họa tiết trở nên nổi bật và thu hút hơn. Đây có thể chỉ là những hình vẽ ngẫu nhiên nhưng nó chứa đựng vô vàn các câu chuyện khác nhau dựa trên sự sáng tạo của nhà thiết kế.', 1600000, N'Con_3.jpg', N'Converse x Keith Haring', N'Upper được phủ toàn bộ họa tiết của Keith Haring vô cùng sinh động
Chất liệu Canvas mềm nhẹ, thoáng khí, mang lại cảm giác thoải mái cho người sử dụng.
Công nghệ in hiện đại mang đến những họa tiết ấn tượng trên toàn bộ phần thân giày.
Phong cách phối màu hiện đại mang lại sự khác biệt cho thiết kế.
Các khoen giày bằng kim loại tránh tình trạng bong tróc khi sử dụng lâu.
Đệm lót OrthoLite cao cấp mang lại sự êm ái mỗi khi di chuyển.', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (4, 1, N'Converse Chuck Taylor All Star Lift Festival', N'converse-chuck-taylor-all-star-lift-festival', N'Converse Lift Festival với thiết kế theo phong cách Washed Color cùng công nghệ in màu loang cực hiện đại, mang bức tranh phủ những gam màu đầy tính nghệ thuật tô điểm cho mẫu giày thêm cá tính để bạn tự tin vui chơi trong mùa lễ hội. Kết cấu đế cao nâng vóc dáng kết hợp cùng Upper được làm từ chất liệu Recycled Poly-Canvas giữ đúng tuyên ngôn về việc chung tay hành động vì môi trường xanh.', 1800000, N'Con_4.jpg', N'Chuck Taylor All Star Lift', N'Thiết kế đế cao dày dặn giúp nâng chiều cao và cải thiện vóc dáng
Khoác chiếc áo mang nghệ thuật hội họa theo phong cách Washed Color cho upper bởi công nghệ in màu loang hiện đại
Thân giày được làm từ chất liệu Recycled Poly-Canvas bằng kỹ thuật tiên tiến đảm bảo độ bền bỉ, linh hoạt
Đệm lót EVA êm ái, gia tăng độ thoải mái cho đôi chân khi mang
Đế giày cao su cao cấp, chắn chắn với mặt đế vân kim cương đặc trưng
Khoen giày phủ kim loại sáng bóng', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (5, 1, N'Converse Chuck Taylor All Star Lift Canvas', N'converse-chuck-taylor-all-star-lift-canvas', N'Mang trở lại phiên bản đế cao trong một diện mạo tối cơ bản, Converse Platform Canvas là sự kết hợp nhuần nhuyễn và hài hòa giữa đế Platform cao su dày dặn và Canvas Upper nhẹ thoáng, bền bỉ. Với những gam màu basic và độ hack dáng không thể xem thường, bạn có thể tự tin diện item này đến những buổi gặp gỡ bạn bè trong những bộ cánh xinh tươi, rạng rỡ nhất.', 1700000, N'Con_5.jpg', N'Chuck Taylor All Star Lift', N'Thiết kế đế Platform cao su dày dặn, với khuôn khổ và đường nét hài hòa
Upper được tạo nên từ chất liệu Canvas, có độ nhẹ thoáng, giảm trọng lượng đáng kể nhưng cũng vô cùng bền bỉ, chắc chắn
Phối màu cơ bản dễ mang, dễ diện, dễ phối đồ
Đệm lót êm ái, tạo sự thoải mái và hỗ trợ di chuyển linh hoạt
Khoen xỏ giày bằng kim loại sáng bóng
Mặt đế vân kim cương tăng ma sát và tạo độ bám, hạn chế trơn trượt', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (6, 1, N'Converse Chuck Taylor All Star Renew Sock Knit', N'converse-chuck-taylor-all-star-renew-sock-knit', N'Converse Chuck Taylor All Star Crate Knit đã trở lại để mang sự cổ điển đến gần hơn với một tương lai không lãng phí. Kiểu dáng Chuck Taylor với phần đế cao su được làm từ Công nghệ Nike Grind kết hợp với xốp Nike và cao su tái chế. Ngoài ra, upper được làm từ chất vải Polyester với công nghệ dệt kỹ thuật tiên tiến, sợi vải được dệt từ 75% poly tái chế và 25% nilon spandex (loại sợi nhân tạo có khả năng co giãn 4 chiều). Trong quá trình dệt có thể sử dụng chính xác lượng sợi cần thiết, đồng thời giảm được tối đa vải thừa đảm bảo tiết kiệm và tránh lãng phí nguyên liệu.', 2200000, N'Con_6.jpg', N'Chuck Taylor All Star', N'Cổ giày được thiết kế ôm sát cổ chân
Bỏ qua chi tiết khoen xỏ giày bằng kim loại nhằm tiết kiệm nguyên liệu
Phối hợp khéo léo giữa gam màu trung tính tạo nên điểm nhấn đặc biệt
Đế giày ứng dụng Công nghệ NikeGrind kết hợp với xốp Nike và cao su tái chế
Thân giày được làm từ chất vải Polyester với công nghệ dệt kỹ thuật tiên tiến với loại sợi nhân tạo có khả năng co giãn 4 chiều.
Mặt đế vân kim cương đặc trưng tạo độ bám và chống trơn trượt hiệu quả
Đệm lót êm ái, tạo độ thoải mái trong từng bước di chuyển
Cấu trúc dây buộc bằng Polyester tái chế 100%', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (7, 1, N'Converse Chuck Taylor All Star 1970s Archive Paint Splatter', N'converse-chuck-taylor-all-star-1970s-archive-paint-splatter', N'Chào hè bằng những thiết kế Converse Archive Paint Splatter, thương hiệu bóng rổ đình đám đã có dịp chinh phục các bạn trẻ đang hướng đến sự mới lạ và phong cách cá tính. Ứng dụng xu hướng Paint Splatter với hình ảnh những tia sơn màu được phun một cách không cần trật tự lên bản in cho thiết kế mới, Converse mang đến item đầy sắc màu để bạn “hết mình” với style trẻ trung, năng động nhất.', 2000000, N'Con_7.jpg', N'Chuck Taylor All Star 1970s', N'Phiên bản Archive Paint Splatter sử dụng bản in được thiết kế độc đáo, khoác lên chiếc áo mới cho những mẫu sneakers bằng công nghệ in hiện đại
Upper với chất liệu vải Canvas bền bỉ, thông dụng
Đế giày cao su trắng ngà đậm chất Vintage được phủ bóng để dễ dàng vệ sinh
Đệm lót OrthoLite cho độ êm ái và thoáng khí
Mặt đế vân kim cương đặc trưng tạo độ bám', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (8, 1, N'Converse Chuck Taylor All Star Lift Archive Print ', N'converse-chuck-taylor-all-star-lift-archive-print', N'Họa tiết da báo kinh điển của làng thời trang đã được mang trở lại trong phiên bản Converse Archive Print hoàn toàn mới. Phủ áo họa tiết hoang dã lên toàn bộ thân giày, các nhà thiết kế đã mang đến một item vô cùng độc đáo cho bạn phong cách cực chất để thệ hiện gout thời trang cá tính.', 1800000, N'Con_8.jpg', N'Chuck Taylor All Star Lift', N'Phiên bản Archive Print sử dụng bản in được thiết kế độc đáo, khoác lên chiếc áo mới cho những mẫu sneakers bằng công nghệ in hiện đại
Upper với chất liệu vải Canvas bền bỉ, thông dụng
Đế Platform dày dặn giúp tăng chiều cao và cải thiện vóc dáng
Đệm lót êm ái với những nâng cấp mang đến cảm giác thoải mái cho đôi chân
Mặt đế vân kim cương đặc trưng tạo độ bám', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (9, 1, N'Converse Chuck Taylor All Star Move Low Top', N'converse-chuck-taylor-all-star-move-low-top', N'Converse Chuck Taylor All Star Move đã quay trở lại trước sự mong đợi của các fan với phiên bản Low Top đầy cá tính. Đế Platform dày dặn nhưng được gia giảm trọng lượng nhờ vào chất liệu và công nghệ hiện đại để trở nên tiện nghi hơn. Mẫu sneakers vô cùng trẻ trung giúp nàng tôn dáng và nổi bật hơn, sẽ trở thành “chìa khóa” cho mọi phong cách mix&match khi xuống phố.', 1900000, N'Con_9.jpg', N'Chuck Taylor All Star', N'Thiết kế đế Platform dày dặn giúp nâng chiều cao một cách đáng kể
Giày được gia giảm trọng lượng nhờ công nghệ hiện đại và chất liệu bền nhẹ
Form dáng thấp năng động, tiện nghi
Thân giày được làm từ vải Canvas nhẹ thoáng
Đệm lót OrthoLite cho cảm giác êm ái và thoải mái
Mặt đế vân kim cương giúp tạo độ bám, tăng ma sát và chống trơn trượt', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (10, 1, N'Converse Chuck Taylor All Star 1970s My Story', N'converse-chuck-taylor-all-star-1970s-my-story', N'Converse My Story gây ấn tượng với các thiết kế độc đáo cùng họa tiết “My Story” graphics được in liền mạch đầy ấn tượng. Trên nền giày Canvas, các con chữ như nhảy múa, nối đuôi nhau một cách bất tận, mang đến phong cách mới lạ, thú vị cho người mang. Đặc biệt với phiên bản Chuck 70 cổ cao màu vàng, dòng chữ My Story như được highlight mang đến sắc thái nhấn mạnh càng làm bạn nổi bật hơn giữa đám đông.', 2000000, N'Con_10.jpg', N'Chuck Taylor All Star 1970s', N'Công nghệ in hiện đại với kỹ thuật in Allover tiên tiến mang đến mẫu Graphics “My Story” cực ấn tượng trên thân giày
Công nghệ in tràn đế tạo sự mới lạ, bắt mắt hơn
Phong cách phối màu hiện đại mang đến những trải nghiệm khác biệt cho người dùng
Thân giày được làm từ chất liệu Canvas với những thớ dệt chặt chẽ
Đệm lót Ortholite với những lỗ tạo bọt khí cho cảm giác thông thoáng
Đế giày cao su bền bỉ, chịu được áp lực trước những vận động mạnh
Tem nhãn thể hiện tính di sản với chữ ký của Chuck Taylor
Mặt đế vân kim cương đặc trưng tạo độ bám, tăng ma sát và hạn chế trơn trượt
Các khoen tròn kim loại sáng bóng tạo độ thông thoáng', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (11, 1, N'Converse Chuck Taylor All Star Wordmark', N'converse-chuck-taylor-all-star-wordmark', N'Mang trở lại thiết kế Wordmark, Converse Chuck Taylor All Star Wordmark với tông White gây ấn tượng bởi điểm nhấn họa tiết chữ thương hiệu “Converse” được ứng dụng kỹ thuật đồ họa chữ in đậm nhiều màu sắc. Phối màu đa dạng trên nền trắng làm chủ đạo giúp sản phẩm trở nên “ngọt ngào” và tinh tế hơn hẳn. Không những vậy item còn mang lại sự thoải mái tối đa khi được làm từ những chất liệu cao cấp, bền bỉ.', 1600000, N'Con_11.jpg', N'Chuck Taylor All Star', N'Điểm nhấn Wordmark ứng dụng đồ họa chữ in đậm nhiều màu sắc.
Mang tone nền màu White làm chủ đạo cùng họa tiết chữ thương hiệu nổi bật.
Đế giày sử dụng đệm lót Classic êm ái, thoáng mát.
Đế giày bằng cao su đặc trưng với đường vân kim cương chống trơn trượt
Upper làm từ chất liệu canvas được dệt chắc chắn, tỉ mỉ
Logo thương hiệu bên hông và sau gót giày.
Khoen xỏ giày bằng kim loại được phủ lớp bạc lấp lánh
Đường viền foxing màu đen nổi bật', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (12, 2, N'Vans UA Old Skool Style 36 SE Bikes', N'vans-ua-old-skool-style-36-se-bikes', N'Kỷ niệm những năm tháng đồng hành cùng các BMX Riders trên những chặng đua đầy thử thách, Vans x SE Bikes đã hợp tác để cho ra mắt những mẫu giày dành cho bộ môn đua xe đạp địa hình. Thiết kế mang đậm tính thể thao đường phố với tên của các dòng xe đạp biểu tượng ở midsole, kết hợp cùng kết cấu tiện nghi, linh hoạt nhất, mẫu giày hứa hẹn sẽ đáp ứng được những yêu cầu khắt khe trong vận động để bạn hết mình cho một ngày dài đầy thử thách.', 2300000, N'Va_1.jpg', N'Vans X SE Bikes', N'Thiết kế ấn tượng từ phong cách phối màu đa dạng, trẻ trung
Tên từng dòng xe đạp của SE Bikes và slogan OFF THE WALL được in lần lượt ở midsole mặt ngoài và mặt trong của giày
Họa tiết Checkerboard hiện diện ở má trong và SideStripe ở má ngoài thân giày
Tem nhãn được thiết kế riêng cho BST đính trên lưỡi gà
Upper là sự kết hợp giữa chất liệu Textile và Leather, mang lại sự bền bỉ và vẻ ngoài thời trang
Đế giày cao su bền bỉ, chắc chắn
Đệm lót bên trong êm ái với độ đàn hồi và chịu lực tốt
Mặt đế vân Waffle đặc trưng tạo độ bám, tăng ma sát và giảm trơn trượt hiệu quả', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (13, 2, N'Vans UA Era Bandana', N'vans-ua-era-bandana', N'Với nguồn cảm hứng từ những chiếc khăn Bandana ấn tượng, mẫu giày Vans Era Bandana đã chiếm trọn sự ưa thích của các bạn trẻ qua hoa văn độc đáo, kết hợp giữa họa tiết Paisley và họa tiết đầu lâu được bố trí khắp thân giày. Thiết kế còn gây chú ý với lối phối màu nền theo phong cách Tie Dye đầy mới lạ, đem đến sức hút khó cưỡng để outlook của bạn xinh tươi, rạng rỡ hơn.', 2000000, N'Va_2.jpg', N'VANS ERA', N'Họa tiết đầu lâu và Paisley kết hợp với nguồn cảm hứng từ những chiếc khăn Bandana, đem đến chiếc áo mới cho sản phẩm
Phối màu theo phong cách Tie Dye vô cùng bắt mắt, để bạn dễ dàng chiếm spotlight
Kiểu dáng Era có thiết kế đơn giản với vòng đệm lót ở cổ giày tạo sự êm ái
Lớp Lining màu đen tương phản với vẻ ngoài
Đệm lót êm ái, tạo cảm giác thoải mái khi vận động
Đường foxing đen láy bao quanh tạo điểm nhấn đặc trưng
Đế giày cao su trắng bền bỉ, dày dặn
Mặt đế vân Waffle đặc trưng, tạo độ bám và tăng ma sát, giảm trơn trượt', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (14, 2, N'Vans UA Old Skool Color Theory Shale Green', N'vans-ua-old-skool-color-theory-shale-green', N'Đã đến lúc xóa bỏ sự trùng lặp và đến với thiết kế mới, đơn giản nhưng không kém phần thời trang của Vans Color Theory Shale Green. Phối màu đơn sắc Shale Green nhẹ nhàng, thanh mát, mang tính thời thượng cho sự trẻ trung cùng phong cách năng động, những mẫu Vans mới này sẽ là item định hướng bạn hội nhập với trend đang lên ngôi trong năm nay.', 1750000, N'Va_3.jpg', N'VANS ERA', N'Mang gam màu Shale Green nhẹ nhàng, trẻ trung phù hợp với nhiều phong cách khác nhau
Hình mẫu Era lý tưởng với form dáng cổ thấp đầy năng động, tiện nghi
Thân giày được làm từ chất liệu Textile chặt chẽ
Đế giày cao su dày dặn, bền bỉ
Mặt đế vân Waffle đặc trưng, tạo độ bám và giảm trơn trượt
Đệm lót tạo sự êm ái, thoải mái với độ đàn hồi và chịu lực tốt
Đường foxing đen là điểm nhấn ấn tượng cân bằng tổng thể thiết kế
Tem nhãn Heel Logo trắng đỏ tạo độ bắt mắt, nổi bật', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (15, 3, N'Palladium Pampa Lite Overlab Neon', N'palladium-pampa-lite-overlab-neon', N'Palladium Pampa Lite Overlab Neon dành cho những bạn trẻ năng động và ưa di chuyển, được làm từ sự kết hợp giữa hai chất liệu cao cấp polyester chống thấm nước và sợi vải lưới ballistic mesh. Ngoài ra, đi kèm với đó là phần outsole ứng dụng công nghệ Lite - Tech tiên tiến giúp trọng lượng đôi giày được giảm đi đáng kể. Màu sắc neon rực rỡ cùng với các chi tiết thương hiệu mang đến cho thiết kế một phong cách thời thượng nổi bật, với vẻ ngoài hợp thời trang và tạo sự khác biệt giữa đám đông.', 2400000, N'Pa_1.jpg', N'Pampa Lite Overlab', N'Phần upper sử dụng chất liệu vải lưới chống đạn cực bền chắc - ballistic mesh
Tạo điểm nhấn bằng tape khâu nổi bật dòng chữ “#DareTheUnknown” sau gót giày
Chi tiết “tọa độ địa lý” tạo dấu ấn lịch sử thương hiệu
Bộ đế ngoài ứng dụng công nghệ Lite – Tech làm giảm đi trọng lượng
Bên trong được bố trí bộ đệm IMEVA mềm mại
Họa tiết chữ được in trên lưỡi gà và bên hông thân giày mang âm hưởng quân đội
Dòng chữ “LITE-TECH” được in nổi trên bề mặt outsole.
Logo thương hiệu bên hông nổi bật
Đế ngoài bằng cao su với cấu trúc lục giác dạng tổ ong
Dây giày dạng tròn làm bằng chất liệu polyester', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (16, 3, N'Palladium Pallabrousse Legion', N'palladium-pallabrousse-legion', N'Mang trở lại mẫu giày quân đội nổi tiếng một thời, với cách tiếp cận hiện đại và thân thiện với môi trường hơn, Palladium cùng phiên bản cải tiến Palladium Pallabrousse Legion sẽ dẫn lối bạn đến những vùng đất mới. Ứng dụng form dáng và khuôn mẫu khởi nguồn của dòng giày Pallabrousse, nhà sản xuất đã “thay máu” cho dòng giày cổ điển bằng chất liệu bền bỉ, êm nhẹ và công nghệ đệm lót tiên tiến nhất, đem lại những trải nghiệm mới mẻ trên những cung đường khám phá.', 2500000, N'Pa_2.jpg', N'Pallabrousse', N'Phiên bản cải tiến hiện đại hơn của dòng Pallabrousse cổ điển
Thân giày được làm 100% từ chất liệu Organic Cotton nhẹ thoáng và thân thiện với môi trường
Lớp lót mềm mịn cho đôi chân cảm giác thoải mái
Đệm lót ứng dụng công nghệ Paradrop tiên tiến, mang lại sự êm ái cho những chuyến hành trình không mỏi mệt
Đế giày cao su đúc bền bỉ, chắc chắn với bề mặt là những đường khoét sâu tạo độ bám trên mọi địa hình
Khoen giày được phủ kim loại sáng bóng, óng ánh
Dấu ấn thương hiệu thể hiện trên Patch Logo, tem nhãn may ở lưỡi gà và được in nổi trên mặt đế', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (17, 3, N'Palladium Pampa Sport Cuff WPN ', N'palladium-pampa-sport-cuff-wpn', N'Với chất liệu da chống thấm nước độc đáo và nylon cao cấp mang đến vẻ ngoài bóng bẩy và hiện đại, giúp đôi chân bạn có cảm giác thoải mái và khô ráo. Gam màu đen mạnh mẽ dễ dàng mix-match với bất kì phong cách nào mà bạn yêu thích.', 3000000, N'Pa_3.jpg', N'Palladium Pampa Sport Cuff WPN', N'Đế ngoài chất liệu cao su đúc trọng lượng cực nhẹ
Đệm xốp EVA cao cấp thoải mái
Lớp lót bên trong bằng da cừu với lưỡi gà bằng chất liệu Nylon chống thấm
Phần Upper bằng da chống nước độc đáo
Nhãn hiệu được dệt trên lưỡi gà và trên Eyestay
Logo Palladium bằng cao su đặt bên hông giày
Dây giày dạng tròn với các khoen xỏ hạn chế rỉ sét', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (18, 3, N'Palladium Pallakix Dare Exchange', N'palladium-pallakix-dare-exchange', N'Phiên bản Palladium Pallakix Dare Exchange đến từ dòng giày “tân binh” Pallakix sẽ làm bạn hài lòng từ những chi tiết nhỏ. Mang thông điệp “Tomorrow is bright” về một ngày mai tươi sáng hơn và được “trang bị” icon nút tua nhanh trên thân giày truyền tải nhiều ý nghĩa tích cực. Mẫu giày đậm chất streetwear này sẽ cho bạn sự bất ngờ bởi thiết kế tưởng chừng hầm hố nhưng lại có trọng lượng cực nhẹ đến từ những chất liệu lightweight, mang đến sự thoải mái trong từng sải bước.', 2200000, N'Pa_4.jpg', N'Pallakix', N'Một thiết kế mới đến từ dòng giày “tân binh” Pallakix
Đế giày Chunky dày dặn mang bộ gen của hai dòng giày Pampa và Pallaphoenix kinh điển, với họa tiết dot và sọc xéo đặc trưng trên mud-guard
Thân giày làm từ vải Moleskine với 100% thành phần Cotton nhẹ thoáng
Lining với chất liệu Canvas bền bỉ
Đệm lót EVA mang cấu trúc tổ ong, được làm từ chất liệu nhẹ, có độ đàn hồi và độ thoáng khí
Cao su lightweight cấu tạo nên đế giày dày dặn, giúp giảm rõ rệt trọng lượng so với vẻ ngoài
Patch logo, tem nhãn trên lưỡi gà, logo dưới mặt đế đều mang dấu ấn Palladium', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (19, 3, N'Palladium Pampa Hi Mono Chrome III', N'palladium-pampa-hi-mono-chrome-iii', N'Pampa Hi Mono Chrome với kiểu dáng Pampa truyền thống, thiết kế đế giày cao su đúc có bề mặt gồ ghề đặc trưng của thương hiệu. Tông màu mono với sắc cam nổi bật sẽ giúp bạn có thêm những Outfit thời thượng và cá tính.', 2000000, N'Pa_5.jpg', N'Pampa', N'Kiểu dáng Pampa cổ điển
Thân giày với chất vải Canvas bền chắc
Lưỡi gà được thay bằng chất vải lưới tạo độ thông thoáng
Đế giày cao su đúc bền bỉ
Tape logo Palladium được đính ở cổ giày tăng độ nhận diện thương hiệu
Đệm giày êm ái, giúp người mang di chuyển thoải mái', 1, CAST(N'2021-01-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (20, 3, N'Palladium Pampa Hi Dare', N'palladium-pampa-hi-dare', N'Một sự kết hợp nổi bật giữa thân giày đen với tem logo brand đỏ trên lưỡi gà cùng miếng tape đỏ #DARE và PALLADIUM sau gót giày tạo điểm nhấn. Đặc biệt nhất chính là tuyên bố về chất lượng của dòng giày Palladium bên hông thân giày được thiết kế theo font chữ quân đội cực mạnh mẽ, cá tính. Phần mũi giày được bọc cao su tạo thành một khối với đế giày cho bạn một sự chắc chắn khi di chuyển.', 1900000, N'Pa_6.jpg', N'Palladium Pampa Hi Dare', N'Chất vải Canvas mềm nhẹ ở toàn bộ thân giày mang đến cho bạn sự di chuyển nhẹ nhàng
Lớp cao su riêng bọc ở mũi giày để bảo vệ các đầu ngón chân
Tem logo brand được thiết kế với màu đỏ và dán trên lưỡi gà tạo điểm nhấn
Miếng tape sau gót giày với dòng chữ #DARE và PALLADIUM tạo được phong cách cá tính
Đệm lót giữa với chất liệu EVA tạo được sự thoải mái cho người mang khi di chuyển
Đế giày có các khe rãnh bằng cao su cao cấp, có độ bám nhất định, dễ di chuyển ở mọi địa hình', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (21, 4, N'Supra Breaker', N'supra-breaker', N'Kết hợp khéo léo những mảng màu xanh – vàng – trắng đan xen nhau tạo nên một tổng thể hoàn hảo về mặt màu sắc. Bề mặt thân giày được trang bị những lỗ thoáng khí giúp đôi chân luôn được khô thoáng khi vận động. Mặc khác chi tiết đế với những đường vân có họa tiết đường lượn sóng và hình chữ S xen kẻ nhau có tác dụng tạo độ bám cùng lực kéo hạn chế trơn trượt hỗ trợ di chuyển chinh phục mọi địa hình.', 3000000, N'Su_1.jpg', N'Supra Breaker', N'Thiết kế cổ cao hiện đại được nâng cấp tối ưu
Sự kết hợp độc đáo giữa hai chất liệu da lộn và da Pu mềm mại
Biến tấu đế giày với những họa tiết chữ S và đường lượn sóng có tác dụng tạo lực kéo và độ bám tốt
Bộ đệm lót SUPRAFOAM tiên tiến nổi bật với độ êm nhẹ
Chi tiết dây đai ở lưỡi gà và mu bàn chân giúp giữ cố định khi vận động
Iconic hình vương miệng mang ý nghĩa biểu tượng tạo chất riêng thương hiệu', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (22, 4, N'Supra Lizard', N'supra-lizard', N'Tông màu xanh kết hợp với các chi tiết được nhấn nhá bằng màu đỏ nổi bật xung quanh đế giày cũng như ở phía sau gót giày. Toàn bộ phần thân trước của giày được làm từ chất liệu da lộn với các lỗ thoáng khí nhỏ để bạn cảm nhận được sự thông thoáng, êm ái từ bên trong.', 2200000, N'Su_2.jpg', N'Supra Lizard', N'Thân giày được kết hợp từ chất liệu Suede và Canvas
Phần thân trước được gia cố bền chắc hơn để bạn thoải mái hoạt động
Lưỡi gà được thiết kế mỏng nhẹ để ôm sát bàn chân
Vải lưới được lót bên trong với các lỗ thoáng khí nhỏ
Các chi tiết Deathwish màu đỏ được sử dụng để thiết kế bên ngoài đế giày
Phần đế giày full trắng dạng đúc tạo sự bền chắc, độ bám tốt
Mặt dưới đế sử dụng họa tiết vương miện quen thuộc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (23, 4, N'Supra Stacks II VULC', N'supra-stacks-ii-vulc', N'Thiết kế cổ thấp quen thuộc của dòng Supra Stacks II VULC bằng chất liệu Canvas - Suede mang đến cho người mang một form giày vừa vặn. Điểm khác biệt trong thiết kế này chính là phần đế Vulcanized được wax bằng những tone màu Neon rực rỡ giúp sản phẩm thêm nổi bật hơn.', 1800000, N'Su_3.jpg', N'Supra Stacks II VULC', N'Chất liệu vải Canvas và Suede trên thân giày
Chi tiết logo và các khoen xỏ dây giày có tone màu hồng tím nổi bật
Bề mặt đế giày được phủ lên một lớp những tone màu Neon kết hợp với nhau
Mặt đế giày bên dưới màu hồng có logo brand màu vàng tạo điểm nhấn', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (24, 4, N'Supra Aluminum', N'supra-aluminum', N'Thiết kế Supra cổ cao với tone vàng trendy giúp bạn có được những sự kết hợp outfit vô cùng nổi bật. Quan trọng hơn, với chất liệu Canvas cao cấp cùng đế giày cao su bền bỉ, sản phẩm sẽ tạo được sự êm ái cho người mang dù di chuyển ở bất kì đâu.', 2000000, N'Su_4.jpg', N'Supra Aluminum', N'Thân giày chất liệu vải Canvas
Tone màu vàng rực rỡ, trẻ trung, năng động
Khu vực mắt cá chân được đệm lót bằng xốp và vải lưới
Đế cao su đúc bền chắc có độ bám, chống trơn trượt
Lưỡi gà cao ôm sát cổ chân tao sự thoải mái khi di chuyển
Biến tấu lạ mắt ở khoen giày hình chữ nhật trên cổ giày
Miếng đệm lót êm ái để bạn có thể hoạt động cả ngày dài
Các chi tiết logo thương hiệu SUPRA tạo điểm nhấn cho sản phẩm ở lưỡi gà, gót giày, mặt đế giày, bên hông thân giày và sau đế giày', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (25, 4, N'Supra Vaider', N'supra-vaider', N'Cực chất với thiết kế cổ cao SUPRA kết hợp giữa hai tone màu Xám - Đỏ cùng chất liệu Canvas và Suede cao cấp mang đến cho bạn phong cách thời trang không thể lẫn vào đâu được. Sự nâng cấp ở nội thất bên trong giày cho bạn sự thoải mái, êm nhẹ dù di chuyển trong khoảng thời gian dài ở bất kì địa hình nào.', 2100000, N'Su_5.jpg', N'Supra Vaider', N'Mũi giày được bao bọc bởi da lộn màu đỏ nổi bật trên thân giày trước màu xám
Phần cổ giày, viền lưỡi gà và tem logo màu đỏ đồng bộ tạo điểm nhấn cho sản phẩm
Lưỡi gà và xung quanh cổ giày được đệm lót dày hơn đảm bảo sự êm ái cho người mang, đặc biệt là bảo vệ vùng cổ chân không bị tổn thương
Đế giày bằng cao su trắng viền đen, có độ bền chắc, độ bám tốt để bạn dễ dàng di chuyển ở mọi địa hình
Mặt đế ngoài phủ đỏ có biểu tượng vương miện nổi bật làm tăng thêm giá trị của sản phẩm', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (35, 2, N'Vans UA Authentic Disruptive', N'vans-ua-authentic-disruptive', N'Là một trong những giá trị mang tính cốt lõi nhất, tên thương hiệu Vans nay đã được đem vào BST Vans Disruptive, thể hiện trên chính họa tiết được biến tấu đa sắc màu. Trải đều trên upper là hình ảnh dòng chữ Vans được lặp đi lặp lại nhưng không hề đụng hàng, với mỗi con chữ là một font chữ, một hoa văn, một màu sắc khác biệt, mang đến mẫu giày sinh động cho những ngày hè chu du khắp nơi.', 1600000, N'Va_5.jpg', N'Authentic', N'Mang họa tiết Vans Disruptive biến tấu tên thương hiệu một cách sinh động, đa sắc màu
Thân giày được làm từ chất liệu Textile cao cấp, được dệt tỉ mỉ, có độ thông thoáng khi mang
Kiểu dáng Authentic đơn giản
Đế giày cao su dày dặn, chắc chắn
Đệm lót bên trong có độ đàn hồi, chịu lực tốt
Heel Label trắng đỏ mang tính đặc trưng, tăng độ nhận diện thương hiệu
Mặt đế vân Waffle tăng ma sát, tạo độ bám lên các bề mặt địa hình, hạn chế trơn trượt', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [CatId], [Name], [Slug], [Detail], [PriceBuy], [Img], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (39, 2, N'Vans UA Classic Slip-On Disruptive', N'vans-ua-classic-slip-on-disruptive', N'Là một trong những giá trị mang tính cốt lõi nhất, tên thương hiệu Vans nay đã được đem vào BST Vans Disruptive, thể hiện trên chính họa tiết được biến tấu đa sắc màu. Trải đều trên upper là hình ảnh dòng chữ Vans được lặp đi lặp lại nhưng không hề đụng hàng, với mỗi con chữ là một font chữ, một hoa văn, một màu sắc khác biệt, mang đến mẫu giày sinh động cho những ngày hè chu du khắp nơi.', 1500000, N'Va_4.jpg', N'SLIP-ON', N'Mang họa tiết Vans Disruptive biến tấu tên thương hiệu một cách sinh động, đa sắc màu
Thân giày được làm từ chất liệu Textile cao cấp, được dệt tỉ mỉ, có độ thông thoáng khi mang
Kiểu dáng Slip-On tiện lợi, dễ dàng mang tháo
Đế giày cao su dày dặn, chắc chắn
Có vòng đệm ở cổ giày, giảm ma sát lên vùng cổ chân, tạo tính linh hoạt
Đệm lót bên trong có độ đàn hồi, chịu lực tốt
Heel Label trắng đỏ mang tính đặc trưng, tăng độ nhận diện thương hiệu
Mặt đế vân Waffle tăng ma sát, tạo độ bám lên các bề mặt địa hình, hạn chế trơn trượt', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductSales] ON 

INSERT [dbo].[ProductSales] ([Id], [ProductId], [PriceSale], [DateBegin], [DateEnd]) VALUES (1, 1, 250000, CAST(N'2021-06-17 00:00:00.000' AS DateTime), CAST(N'2021-06-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ProductSales] ([Id], [ProductId], [PriceSale], [DateBegin], [DateEnd]) VALUES (2, 2, 250000, CAST(N'2021-06-17 00:00:00.000' AS DateTime), CAST(N'2021-06-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ProductSales] ([Id], [ProductId], [PriceSale], [DateBegin], [DateEnd]) VALUES (3, 3, 250000, CAST(N'2021-06-17 00:00:00.000' AS DateTime), CAST(N'2021-06-30 00:00:00.000' AS DateTime))
INSERT [dbo].[ProductSales] ([Id], [ProductId], [PriceSale], [DateBegin], [DateEnd]) VALUES (4, 4, 250000, CAST(N'2021-06-17 00:00:00.000' AS DateTime), CAST(N'2021-06-30 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductSales] OFF
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Img], [Position], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'Hình ảnh 1', N'#', N'1.jpg', N'slideshow', 1, 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Img], [Position], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Hình ảnh 2', N'#', N'2.jpg', N'slideshow', 1, 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Img], [Position], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (3, N'Hình ảnh 3', N'#', N'3.jpg', N'slideshow', 1, 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Img], [Position], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (4, N'Hình ảnh 4', N'#', N'4.jpg', N'slideshow', 1, 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Img], [Position], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (5, N'Hình ảnh 5', N'#', N'5.jpg', N'slideshow', 1, 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Img], [Position], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (6, N'Hình ảnh 6', N'#', N'1.jpg', N'slideshow', 1, 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1, CAST(N'2021-06-17 16:10:10.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'Tin tức', N'tin-tuc', 0, 1, N'Tin', N'Tuc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [MetaKey], [MetaDesc], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Tuyển dụng', N'tuyen-dung', 0, 2, N'metakey', N'metadesc', 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Topics] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FullName], [UserName], [Password], [Email], [Phone], [Address], [Img], [Gender], [Roles], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'Quản trị', N'test', N'1', N'admin@gmail.com', N'0987654321', N'HCM', N'admin.png', 1, 1, 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [FullName], [UserName], [Password], [Email], [Phone], [Address], [Img], [Gender], [Roles], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Khách hàng', N'khachhang', N'123456', N'khachhang@gmail.com', N'0987654321', N'HCM', N'khachhang.png', 1, 1, 0, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1, CAST(N'2021-06-16 13:10:10.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
