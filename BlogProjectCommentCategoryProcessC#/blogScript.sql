USE [BlogBlogBlog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9.01.2024 00:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategories]    Script Date: 9.01.2024 00:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_BlogCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 9.01.2024 00:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9.01.2024 00:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 9.01.2024 00:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9.01.2024 00:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Surname] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240108174826_createDb', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240108174938_createDb2', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240108175026_createDb3', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240108175059_createDb4', N'6.0.24')
GO
SET IDENTITY_INSERT [dbo].[BlogCategories] ON 

INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (3, 5, 2)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (5, 5, 4)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (6, 6, 2)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (7, 6, 3)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (8, 6, 4)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (10, 4, 1)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (11, 4, 2)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (12, 4, 3)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (13, 8, 1)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (14, 8, 2)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (15, 8, 3)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (18, 9, 1)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (19, 9, 2)
INSERT [dbo].[BlogCategories] ([Id], [BlogId], [CategoryId]) VALUES (20, 9, 3)
SET IDENTITY_INSERT [dbo].[BlogCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [CreateDate], [Image], [ShortDescription], [UserId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (4, CAST(N'2024-01-08T23:18:27.1966408' AS DateTime2), NULL, N'Bayram', 1, N'Bayram', N'Bayram', 1, 0)
INSERT [dbo].[Blogs] ([Id], [CreateDate], [Image], [ShortDescription], [UserId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (5, CAST(N'2023-12-01T00:00:00.0000000' AS DateTime2), NULL, N'Sinema', 1, N'Sinema', N'Sinema', 1, 0)
INSERT [dbo].[Blogs] ([Id], [CreateDate], [Image], [ShortDescription], [UserId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (6, CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), NULL, N'Bursa', 1, N'Bursa', N'Bursa', 1, 0)
INSERT [dbo].[Blogs] ([Id], [CreateDate], [Image], [ShortDescription], [UserId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (8, CAST(N'2024-01-08T23:36:29.8488982' AS DateTime2), NULL, N'b', 1, N'b', N'a', 1, 1)
INSERT [dbo].[Blogs] ([Id], [CreateDate], [Image], [ShortDescription], [UserId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (9, CAST(N'2024-01-09T00:09:22.0168403' AS DateTime2), NULL, N'b', 1, N'b', N'ss', 1, 0)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description], [IsStatus], [IsDelete]) VALUES (1, N'Aile', N'Aile', 1, 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [IsStatus], [IsDelete]) VALUES (2, N'Gezi', N'Gezi', 1, 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [IsStatus], [IsDelete]) VALUES (3, N'Anı', N'Anı', 1, 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [IsStatus], [IsDelete]) VALUES (4, N'Eğlence', N'Eğlence', 1, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [UserId], [BlogId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (1, 1, 4, N'yorum1', N'yorum1', 1, 0)
INSERT [dbo].[Comments] ([Id], [UserId], [BlogId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (2, 1, 5, N'yorum2', N'yorum2', 1, 0)
INSERT [dbo].[Comments] ([Id], [UserId], [BlogId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (3, 1, 5, N'yorum3', N'yorum3', 1, 0)
INSERT [dbo].[Comments] ([Id], [UserId], [BlogId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (4, 1, 6, N'yorum4', N'yorum4', 1, 0)
INSERT [dbo].[Comments] ([Id], [UserId], [BlogId], [Name], [Description], [IsStatus], [IsDelete]) VALUES (5, 1, 8, N'yorum5', N'yorum5', 1, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Surname], [Username], [Email], [Password], [Image], [IsStatus], [IsDelete]) VALUES (1, N'betul', N'dasci', N'betuldasci', N'betul@gmail.com', N'betul', NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[BlogCategories]  WITH CHECK ADD  CONSTRAINT [FK_BlogCategories_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogCategories] CHECK CONSTRAINT [FK_BlogCategories_Blogs_BlogId]
GO
ALTER TABLE [dbo].[BlogCategories]  WITH CHECK ADD  CONSTRAINT [FK_BlogCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogCategories] CHECK CONSTRAINT [FK_BlogCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Users_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Blogs_BlogId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
