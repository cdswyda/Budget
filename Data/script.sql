USE [Budget]
GO
/****** Object:  Trigger [GetWallArea]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GetWallArea]'))
DROP TRIGGER [dbo].[GetWallArea]
GO
/****** Object:  Trigger [tr_GetRoomTotal1]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_GetRoomTotal1]'))
DROP TRIGGER [dbo].[tr_GetRoomTotal1]
GO
/****** Object:  Trigger [tr_GetRoomTotal]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_GetRoomTotal]'))
DROP TRIGGER [dbo].[tr_GetRoomTotal]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecialItem_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialItem]'))
ALTER TABLE [dbo].[SpecialItem] DROP CONSTRAINT [FK_SpecialItem_House]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room]'))
ALTER TABLE [dbo].[Room] DROP CONSTRAINT [FK_Room_House]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message] DROP CONSTRAINT [FK_Message_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message] DROP CONSTRAINT [FK_Message_House]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Room]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_Room]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_House_User1]') AND parent_object_id = OBJECT_ID(N'[dbo].[House]'))
ALTER TABLE [dbo].[House] DROP CONSTRAINT [FK_House_User1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_House_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[House]'))
ALTER TABLE [dbo].[House] DROP CONSTRAINT [FK_House_User]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[SpecialItem]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialItem]') AND type in (N'U'))
DROP TABLE [dbo].[SpecialItem]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room]') AND type in (N'U'))
DROP TABLE [dbo].[Room]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Message]') AND type in (N'U'))
DROP TABLE [dbo].[Message]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
DROP TABLE [dbo].[Item]
GO
/****** Object:  Table [dbo].[House]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[House]') AND type in (N'U'))
DROP TABLE [dbo].[House]
GO
/****** Object:  UserDefinedFunction [dbo].[GetRoomTotal]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRoomTotal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetRoomTotal]
GO
USE [master]
GO
/****** Object:  Database [Budget]    Script Date: 2016/11/17 22:58:33 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Budget')
DROP DATABASE [Budget]
GO
/****** Object:  Database [Budget]    Script Date: 2016/11/17 22:58:33 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Budget')
BEGIN
CREATE DATABASE [Budget]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Budget', FILENAME = N'D:\Data\Budget.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Budget_log', FILENAME = N'D:\Data\Budget_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Chinese_PRC_CI_AS
END

GO
ALTER DATABASE [Budget] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Budget].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Budget] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Budget] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Budget] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Budget] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Budget] SET ARITHABORT OFF 
GO
ALTER DATABASE [Budget] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Budget] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Budget] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Budget] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Budget] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Budget] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Budget] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Budget] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Budget] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Budget] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Budget] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Budget] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Budget] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Budget] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Budget] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Budget] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Budget] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Budget] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Budget] SET  MULTI_USER 
GO
ALTER DATABASE [Budget] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Budget] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Budget] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Budget] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Budget] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Budget]
GO
/****** Object:  UserDefinedFunction [dbo].[GetRoomTotal]    Script Date: 2016/11/17 22:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRoomTotal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[GetRoomTotal](@roomid int)
returns numeric(10,2)
as
begin
	declare @itemsTotal numeric(10,2);
	select @itemsTotal=sum([Total]) 
		from [Item]
		where [RoomID]=@roomid;

	return @itemstotal;
end' 
END

GO
/****** Object:  Table [dbo].[House]    Script Date: 2016/11/17 22:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[House]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[House](
	[HouseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Designer] [int] NOT NULL,
	[Owner] [int] NOT NULL,
	[Address] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Area] [numeric](10, 2) NOT NULL,
	[height] [numeric](10, 2) NOT NULL,
	[Time] [datetime] NULL CONSTRAINT [DF_House_Time]  DEFAULT (getdate()),
	[State] [int] NOT NULL CONSTRAINT [DF_House_State]  DEFAULT ((0)),
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2016/11/17 22:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[Name] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Units] [int] NOT NULL,
	[Price] [numeric](10, 2) NOT NULL,
	[Quantity] [numeric](10, 2) NOT NULL,
	[Total]  AS ([Price]*[Quantity]) PERSISTED,
	[Note] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2016/11/17 22:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Message]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Time] [datetime] NULL CONSTRAINT [DF_Message_Time]  DEFAULT (getdate()),
	[State] [int] NOT NULL CONSTRAINT [DF_Message_State]  DEFAULT ((0)),
	[Note] [text] COLLATE Chinese_PRC_CI_AS NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2016/11/17 22:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[RoomName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Length] [numeric](10, 2) NOT NULL,
	[Width] [numeric](10, 2) NOT NULL,
	[DoorArea] [numeric](10, 2) NOT NULL CONSTRAINT [DF_Room_DoorArea]  DEFAULT ((0)),
	[WindowArea] [numeric](10, 2) NOT NULL CONSTRAINT [DF_Room_WindowArea]  DEFAULT ((0)),
	[WallArea] [numeric](10, 2) NULL,
	[Area]  AS ([Length]*[Width]) PERSISTED,
	[Total] [numeric](10, 2) NOT NULL CONSTRAINT [DF_Room_Total]  DEFAULT ((0.00)),
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpecialItem]    Script Date: 2016/11/17 22:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SpecialItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[Name] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Units] [int] NOT NULL,
	[Price] [numeric](10, 2) NOT NULL,
	[Quantity] [numeric](10, 2) NOT NULL,
	[Total]  AS ([Price]*[Quantity]),
	[Note] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NOT NULL,
 CONSTRAINT [PK_SpecialItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[User]    Script Date: 2016/11/17 22:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[PassWord] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL CONSTRAINT [DF_User_PassWord]  DEFAULT ((123456)),
	[Type] [int] NOT NULL,
	[Name] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([HouseID], [Name], [Designer], [Owner], [Address], [Area], [height], [Time], [State]) VALUES (1, N'�˺�С��', 1, 2, N'�����к�̨���˺�·', CAST(147.60 AS Numeric(10, 2)), CAST(2.70 AS Numeric(10, 2)), CAST(N'2016-05-19 19:51:35.647' AS DateTime), 1)
INSERT [dbo].[House] ([HouseID], [Name], [Designer], [Owner], [Address], [Area], [height], [Time], [State]) VALUES (2, N'��������', 1, 6, N'�����к�̨���˺�·xxxx', CAST(125.36 AS Numeric(10, 2)), CAST(2.60 AS Numeric(10, 2)), CAST(N'2016-06-13 17:31:47.050' AS DateTime), 0)
INSERT [dbo].[House] ([HouseID], [Name], [Designer], [Owner], [Address], [Area], [height], [Time], [State]) VALUES (6, N'��������', 1, 2, N'�����к�̨���캺���xxx��', CAST(157.60 AS Numeric(10, 2)), CAST(3.10 AS Numeric(10, 2)), CAST(N'2016-06-13 22:30:40.250' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[House] OFF
SET ANSI_PADDING ON
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (1, 1, N'������ƽ', 2, CAST(25.00 AS Numeric(10, 2)), CAST(28.00 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (2, 1, N'����ǽ', 3, CAST(1500.00 AS Numeric(10, 2)), CAST(1.00 AS Numeric(10, 2)), N'ľ���ǣ�ʯ������ͣ�ʯ���ӷ촦����������ֽ��������')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (19, 2, N'������ƽ', 2, CAST(25.00 AS Numeric(10, 2)), CAST(25.00 AS Numeric(10, 2)), N'ˮ��ɳ��')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (20, 1, N'ǽ���齺��', 2, CAST(25.00 AS Numeric(10, 2)), CAST(45.34 AS Numeric(10, 2)), N'������������.��ĥƽ��.ˢ�����齺��.��Ϳ�������2Ԫ/�O.�� ��ǽƤ����2Ԫ/�O��(����ʿ�齺��---��Ͱ)')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (21, 1, N'�����齺��', 2, CAST(30.00 AS Numeric(10, 2)), CAST(20.50 AS Numeric(10, 2)), N'������������.��ĥƽ��.ˢ�����齺��.��Ϳ�������2Ԫ/�O.�� ��ǽƤ����2Ԫ/�O��(����ʿ�齺��---��Ͱ)')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (22, 1, N'����ǽ�ƴ�', 1, CAST(100.00 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), N'ľ���ǣ�ʯ��壬ʯ���ӷ촦����ֻ������ǽ��һ�ߣ�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (23, 1, N'����', 3, CAST(300.00 AS Numeric(10, 2)), CAST(1.00 AS Numeric(10, 2)), N'ľ�����ף�������壬���ᣬ�˹��Ѽ����ϡ�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (24, 2, N'������', 3, CAST(1400.00 AS Numeric(10, 2)), CAST(1.00 AS Numeric(10, 2)), N'ľ�����ף�����壬����������룬���������������Ž��������֡�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (25, 2, N'���', 3, CAST(2000.00 AS Numeric(10, 2)), CAST(1.00 AS Numeric(10, 2)), N'ľ�����ף����������飬����ᣨ�������������ȣ�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (26, 2, N'�����齺��', 2, CAST(30.00 AS Numeric(10, 2)), CAST(11.88 AS Numeric(10, 2)), N'������������.��ĥƽ��.ˢ�����齺��.��Ϳ�������2Ԫ/�O.�� ��ǽƤ����2Ԫ/�O��(����ʿ�齺��---��Ͱ)')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (27, 2, N'ǽ���齺��', 2, CAST(25.00 AS Numeric(10, 2)), CAST(34.96 AS Numeric(10, 2)), N'������������.��ĥƽ��.ˢ�����齺��.��Ϳ�������2Ԫ/�O.�� ��ǽƤ����2Ԫ/�O��(����ʿ�齺��---��Ͱ)')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (28, 3, N'��������', 2, CAST(70.00 AS Numeric(10, 2)), CAST(6.00 AS Numeric(10, 2)), N'���ᣬ�˹������ϡ�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (29, 3, N'����', 2, CAST(400.00 AS Numeric(10, 2)), CAST(3.00 AS Numeric(10, 2)), N'ľ�����ף���������壬�˹�����������𣩡�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (30, 3, N'��װ��', 6, CAST(1000.00 AS Numeric(10, 2)), CAST(1.00 AS Numeric(10, 2)), N'ʵľ�ţ����ᣬ�˹��Ѽ����ϡ����������ߺ���𣩡�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (31, 3, N'ʯ����', 1, CAST(20.00 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), N'��Ʒʯ���ߣ��˹��ѣ�����')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (32, 3, N'�����齺��', 2, CAST(30.00 AS Numeric(10, 2)), CAST(14.80 AS Numeric(10, 2)), N'������������.��ĥƽ��.ˢ�����齺��.��Ϳ�������2Ԫ/�O.�� ��ǽƤ����2Ԫ/�O��(����ʿ�齺��---��Ͱ)')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (33, 3, N'ǽ���齺��', 2, CAST(25.00 AS Numeric(10, 2)), CAST(37.48 AS Numeric(10, 2)), N'������������.��ĥƽ��.ˢ�����齺��.��Ϳ�������2Ԫ/�O.�� ��ǽƤ����2Ԫ/�O��(����ʿ�齺��---��Ͱ)')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (34, 3, N'������ƽ', 2, CAST(25.00 AS Numeric(10, 2)), CAST(14.80 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (35, 4, N'������ש', 2, CAST(40.00 AS Numeric(10, 2)), CAST(6.72 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (36, 4, N'ǽ����ש', 2, CAST(45.00 AS Numeric(10, 2)), CAST(25.92 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (37, 4, N'����', 2, CAST(120.00 AS Numeric(10, 2)), CAST(6.72 AS Numeric(10, 2)), N'ľ���Ǵ�ܣ�ɣ����������������˹���')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (38, 4, N'����̨', 2, CAST(300.00 AS Numeric(10, 2)), CAST(8.00 AS Numeric(10, 2)), N'�ִܸ�����̨��˫�����������������������')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (39, 5, N'����', 2, CAST(280.00 AS Numeric(10, 2)), CAST(5.52 AS Numeric(10, 2)), N'������Ǵ�ܣ���Ʒ���ɵ������˹������ϣ������ƾ�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (40, 5, N'����', 1, CAST(400.00 AS Numeric(10, 2)), CAST(3.60 AS Numeric(10, 2)), N'ľ�����ף���Ʒ���ţ�������ܰ壬�˹������ϣ��������')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (41, 5, N'����', 1, CAST(380.00 AS Numeric(10, 2)), CAST(3.00 AS Numeric(10, 2)), N'��ˮľ�����ף���Ʒ�����ţ�����ʯ̨�棬����ˮ�ۡ���ͷ�����')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (42, 5, N'������ש', 2, CAST(40.00 AS Numeric(10, 2)), CAST(5.52 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (43, 5, N'ǽ����ש', 2, CAST(40.00 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (44, 6, N'������ש', 2, CAST(40.00 AS Numeric(10, 2)), CAST(2.16 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (45, 6, N'ǽ����ש', 2, CAST(40.00 AS Numeric(10, 2)), CAST(14.20 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (46, 6, N'�ѺϽ���', 3, CAST(320.00 AS Numeric(10, 2)), CAST(1.00 AS Numeric(10, 2)), N'��Ʒ�ѺϽ��ţ���װ��')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (47, 6, N'ǽ�����ˮ', 2, CAST(120.00 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), N'��Ʒ��ˮ���ϣ���ˮ��ɰ�����ϡ�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (48, 7, N'������ƽ', 2, CAST(25.00 AS Numeric(10, 2)), CAST(12.96 AS Numeric(10, 2)), N'1��2.5ˮ��ɳ����40MM���ڵĺ�ȣ��������ְ�������ƽ����㡣ÿ����10MM���շ�4Ԫ/�O.����ɳ��ˮ�ࣩ')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (49, 7, N'ǽ���齺��', 2, CAST(25.00 AS Numeric(10, 2)), CAST(38.88 AS Numeric(10, 2)), N'������������.��ĥƽ��.ˢ�����齺��.��Ϳ�������2Ԫ/�O.�� ��ǽƤ����2Ԫ/�O��(����ʿ�齺��---��Ͱ)')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (50, 7, N'�����齺��', 2, CAST(30.00 AS Numeric(10, 2)), CAST(12.96 AS Numeric(10, 2)), N'������������.��ĥƽ��.ˢ�����齺��.��Ϳ�������2Ԫ/�O.�� ��ǽƤ����2Ԫ/�O��(����ʿ�齺��---��Ͱ)')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (51, 7, N'ʯ����', 1, CAST(20.00 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), N'��Ʒʯ���ߣ��˹��ѣ�����')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (52, 7, N'��װ��', 3, CAST(1000.00 AS Numeric(10, 2)), CAST(1.00 AS Numeric(10, 2)), N'ʵľ�ţ����ᣬ�˹��Ѽ����ϡ����������ߺ���𣩡�')
INSERT [dbo].[Item] ([ItemID], [RoomID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (53, 7, N'���¹�', 2, CAST(400.00 AS Numeric(10, 2)), CAST(3.40 AS Numeric(10, 2)), N'ľ�����ף���������壬�˹�����������𣩡�')
SET IDENTITY_INSERT [dbo].[Item] OFF
SET ANSI_PADDING OFF
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([ID], [HouseID], [UserID], [Time], [State], [Note]) VALUES (1, 1, 1, CAST(N'2016-05-14 21:43:52.387' AS DateTime), 0, N' ����������')
INSERT [dbo].[Message] ([ID], [HouseID], [UserID], [Time], [State], [Note]) VALUES (2, 1, 1, CAST(N'2016-06-13 03:31:32.877' AS DateTime), 0, N'�����ĵĵĵĵ�')
INSERT [dbo].[Message] ([ID], [HouseID], [UserID], [Time], [State], [Note]) VALUES (119, 6, 1, CAST(N'2016-06-14 06:40:58.783' AS DateTime), 0, N'��ô�����������۱�')
SET IDENTITY_INSERT [dbo].[Message] OFF
SET ANSI_PADDING ON
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (1, 1, N'����', CAST(5.00 AS Numeric(10, 2)), CAST(4.10 AS Numeric(10, 2)), CAST(1.80 AS Numeric(10, 2)), CAST(2.00 AS Numeric(10, 2)), CAST(45.34 AS Numeric(10, 2)), CAST(4748.50 AS Numeric(10, 2)))
INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (2, 1, N'�鷿', CAST(3.60 AS Numeric(10, 2)), CAST(3.30 AS Numeric(10, 2)), CAST(2.30 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(34.96 AS Numeric(10, 2)), CAST(5255.40 AS Numeric(10, 2)))
INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (3, 1, N'����', CAST(4.00 AS Numeric(10, 2)), CAST(3.70 AS Numeric(10, 2)), CAST(1.80 AS Numeric(10, 2)), CAST(2.30 AS Numeric(10, 2)), CAST(37.48 AS Numeric(10, 2)), CAST(4651.00 AS Numeric(10, 2)))
INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (4, 1, N'��̨', CAST(4.20 AS Numeric(10, 2)), CAST(1.60 AS Numeric(10, 2)), CAST(2.40 AS Numeric(10, 2)), CAST(3.00 AS Numeric(10, 2)), CAST(25.92 AS Numeric(10, 2)), CAST(4641.60 AS Numeric(10, 2)))
INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (5, 1, N'����', CAST(2.40 AS Numeric(10, 2)), CAST(2.30 AS Numeric(10, 2)), CAST(2.00 AS Numeric(10, 2)), CAST(0.80 AS Numeric(10, 2)), CAST(22.58 AS Numeric(10, 2)), CAST(5066.40 AS Numeric(10, 2)))
INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (6, 1, N'������', CAST(1.80 AS Numeric(10, 2)), CAST(1.20 AS Numeric(10, 2)), CAST(1.40 AS Numeric(10, 2)), CAST(0.60 AS Numeric(10, 2)), CAST(14.20 AS Numeric(10, 2)), CAST(1574.40 AS Numeric(10, 2)))
INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (7, 1, N'����', CAST(3.60 AS Numeric(10, 2)), CAST(3.60 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(38.88 AS Numeric(10, 2)), CAST(4324.80 AS Numeric(10, 2)))
INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (8, 2, N'����', CAST(4.00 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(2.30 AS Numeric(10, 2)), CAST(3.60 AS Numeric(10, 2)), CAST(40.90 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)))
INSERT [dbo].[Room] ([RoomID], [HouseID], [RoomName], [Length], [Width], [DoorArea], [WindowArea], [WallArea], [Total]) VALUES (10, 2, N'����', CAST(3.60 AS Numeric(10, 2)), CAST(2.80 AS Numeric(10, 2)), CAST(2.00 AS Numeric(10, 2)), CAST(2.60 AS Numeric(10, 2)), CAST(28.68 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)))
SET IDENTITY_INSERT [dbo].[Room] OFF
SET ANSI_PADDING OFF
SET IDENTITY_INSERT [dbo].[SpecialItem] ON 

INSERT [dbo].[SpecialItem] ([ItemID], [HouseID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (1, 1, N'��������', 2, CAST(20.00 AS Numeric(10, 2)), CAST(145.00 AS Numeric(10, 2)), N'����װ�޻�е���������')
INSERT [dbo].[SpecialItem] ([ItemID], [HouseID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (2, 1, N'ˮ�����', 3, CAST(4000.00 AS Numeric(10, 2)), CAST(1.00 AS Numeric(10, 2)), N'�շ�ˮ�ܣ���ɵ��£��˹��͸���')
INSERT [dbo].[SpecialItem] ([ItemID], [HouseID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (3, 1, N'��ש', 4, CAST(135.00 AS Numeric(10, 2)), CAST(70.00 AS Numeric(10, 2)), N'800*800 ��ɲ����׹�ש�����ذ�שPG8248C')
INSERT [dbo].[SpecialItem] ([ItemID], [HouseID], [Name], [Units], [Price], [Quantity], [Note]) VALUES (4, 1, N'ǽש', 7, CAST(350.00 AS Numeric(10, 2)), CAST(20.00 AS Numeric(10, 2)), N'600*298 ��ɲ���YF633401')
SET IDENTITY_INSERT [dbo].[SpecialItem] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Phone], [PassWord], [Type], [Name]) VALUES (1, N'15291646133', N'123456', 0, N'����ƽ')
INSERT [dbo].[User] ([UserID], [Phone], [PassWord], [Type], [Name]) VALUES (2, N'13641534674', N'123456', 1, N'����')
INSERT [dbo].[User] ([UserID], [Phone], [PassWord], [Type], [Name]) VALUES (6, N'123456', N'123456', 1, N'����')
INSERT [dbo].[User] ([UserID], [Phone], [PassWord], [Type], [Name]) VALUES (7, N'1234567', N'123456', 1, N'����x')
INSERT [dbo].[User] ([UserID], [Phone], [PassWord], [Type], [Name]) VALUES (8, N'1254', N'123456', 1, N'����')
SET IDENTITY_INSERT [dbo].[User] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_House_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[House]'))
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_User] FOREIGN KEY([Designer])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_House_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[House]'))
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_House_User1]') AND parent_object_id = OBJECT_ID(N'[dbo].[House]'))
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_User1] FOREIGN KEY([Owner])
REFERENCES [dbo].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_House_User1]') AND parent_object_id = OBJECT_ID(N'[dbo].[House]'))
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_User1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Room]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Room]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Room]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_House] FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_House]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Message_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Message]'))
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room]'))
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_House] FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room]'))
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_House]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecialItem_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialItem]'))
ALTER TABLE [dbo].[SpecialItem]  WITH CHECK ADD  CONSTRAINT [FK_SpecialItem_House] FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecialItem_House]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialItem]'))
ALTER TABLE [dbo].[SpecialItem] CHECK CONSTRAINT [FK_SpecialItem_House]
GO
/****** Object:  Trigger [dbo].[tr_GetRoomTotal]    Script Date: 2016/11/17 22:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_GetRoomTotal]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[tr_GetRoomTotal] 
on [dbo].[Item]
after insert,update
as
begin
	declare @roomid int;
	select @roomid=[RoomID] from inserted;
	if(@roomid in (select [RoomID] from [Room]))
	begin
		update [room] 
			set [Total]=[dbo].[GetRoomTotal](@roomid) 
			where [RoomID]=@roomid;
	end
end' 
GO
/****** Object:  Trigger [dbo].[tr_GetRoomTotal1]    Script Date: 2016/11/17 22:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_GetRoomTotal1]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[tr_GetRoomTotal1] 
on [dbo].[Item]
after delete
as
begin
	declare @roomid int;
	select @roomid=[RoomID] from deleted;
	if(@roomid in (select [RoomID] from [Room]))
	begin
		update [room] 
			set [Total]=[dbo].[GetRoomTotal](@roomid) 
			where [RoomID]=@roomid;
	end
end' 
GO
/****** Object:  Trigger [dbo].[GetWallArea]    Script Date: 2016/11/17 22:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GetWallArea]'))
EXEC dbo.sp_executesql @statement = N'CREATE trigger [dbo].[GetWallArea] on [dbo].[Room] after insert,update 
as
begin
	--��ȡ�߶�
	declare @gaodu numeric(10,2);
	declare @chang numeric(10,2);
	declare @kuan numeric(10,2);
	declare @men numeric(10,2);
	declare @chuang numeric(10,2);
	declare @roomID int;

	--��ȡ�߶�
	select @gaodu=(select height 
						from House 
						where HouseID=
							(select HouseID from inserted)
					)
	--��ȡ�������š���
	select @chang=[Length],@kuan=[Width],@men=[DoorArea],@chuang=[WindowArea],@roomID=[Roomid] from inserted;
	--����ǽ�����
	update [Room] 
	set [WallArea]=2*(@chang+@kuan)*@gaodu-@men-@chuang 
	where [RoomID]=@roomID;
end
' 
GO
USE [master]
GO
ALTER DATABASE [Budget] SET  READ_WRITE 
GO
