USE [master]
GO
/****** Object:  Database [railwaymanagement]    Script Date: 24-04-2018 06:33:27 ******/
CREATE DATABASE [railwaymanagement]


-- CONTAINMENT = NONE
 --ON  PRIMARY 
--( NAME = N'railwaymanagement', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\railwaymanagement.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 --LOG ON 
--( NAME = N'railwaymanagement_log', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\railwaymanagement_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--GO
--ALTER DATABASE [railwaymanagement] SET COMPATIBILITY_LEVEL = 90
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))


begin
EXEC [railwaymanagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [railwaymanagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [railwaymanagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [railwaymanagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [railwaymanagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [railwaymanagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [railwaymanagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [railwaymanagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [railwaymanagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [railwaymanagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [railwaymanagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [railwaymanagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [railwaymanagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [railwaymanagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [railwaymanagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [railwaymanagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [railwaymanagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [railwaymanagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [railwaymanagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [railwaymanagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [railwaymanagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [railwaymanagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [railwaymanagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [railwaymanagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [railwaymanagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [railwaymanagement] SET  MULTI_USER 
GO
ALTER DATABASE [railwaymanagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [railwaymanagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [railwaymanagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [railwaymanagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [railwaymanagement]
GO
/****** Object:  StoredProcedure [dbo].[aspgetstation]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[aspgetstation]
 @term nvarchar(50)
 as
 BEGIN
 Select station_name
 from station_add
 where station_name like @term +'%'
 END

GO
/****** Object:  StoredProcedure [dbo].[getstation]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getstation]
@station varchar(20)
as
BEGIN 
select station 
from train_code
where station like @station +'%'
END


GO
/****** Object:  Table [dbo].[admin]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[username] [varchar](30) NULL,
	[password] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[booking]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[passanger] [varchar](20) NULL,
	[date] [date] NULL,
	[train] [int] NULL,
	[class] [varchar](20) NULL,
	[pnr] [varchar](50) NULL,
	[entry_date] [varchar](20) NULL,
	[age] [int] NULL,
	[berth] [varchar](20) NULL,
	[status] [varchar](20) NULL,
	[gender] [varchar](20) NULL,
	[aadhar] [varchar](20) NULL,
	[train_name] [varchar](20) NULL,
	[time] [varchar](10) NULL,
	[transaction_id] [varchar](10) NULL,
 CONSTRAINT [PK_booking_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feedback](
	[name] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[s_message] [varchar](20) NULL,
	[y_message] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[food_service]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[food_service](
	[receipt_id] [int] NULL,
	[booked_date] [varchar](30) NULL,
	[train_number] [int] NULL,
	[date_of_delivery] [varchar](30) NULL,
	[time_of_delivery] [varchar](20) NULL,
	[food_type] [varchar](30) NULL,
	[seat_no] [int] NULL,
	[total] [int] NULL,
	[transaction_id] [int] NULL,
	[food] [varchar](50) NULL,
	[price] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[non_vegfoods]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[non_vegfoods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[foods] [varchar](50) NOT NULL,
	[price] [varchar](20) NULL,
 CONSTRAINT [PK_non_vegfoods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nonveg_food]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nonveg_food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[food] [varchar](50) NULL,
	[food1] [varchar](50) NULL,
	[food2] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payment]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payment](
	[Total_amount] [varchar](50) NULL,
	[bank] [varchar](50) NULL,
	[card_name] [varchar](50) NULL,
	[card_type] [varchar](20) NULL,
	[card_no] [int] NULL,
	[pnr] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[register]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[register](
	[first_name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NULL,
	[user_id] [varchar](20) NOT NULL,
	[confirm_password] [varchar](20) NULL,
	[phon_no] [varchar](20) NULL,
	[email_id] [varchar](20) NULL,
	[gender] [varchar](20) NULL,
	[age] [int] NULL,
	[state] [varchar](20) NULL,
	[pin_code] [int] NULL,
 CONSTRAINT [PK_register_1] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[station_add]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[station_add](
	[station_code] [varchar](20) NOT NULL,
	[station_name] [varchar](20) NOT NULL,
	[station_location] [varchar](20) NULL,
 CONSTRAINT [PK_station_add] PRIMARY KEY CLUSTERED 
(
	[station_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[train_code]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[train_code](
	[time] [time](7) NULL,
	[train_number] [int] NOT NULL,
	[no] [int] IDENTITY(1,1) NOT NULL,
	[station] [varchar](20) NOT NULL,
 CONSTRAINT [PK_train_code] PRIMARY KEY CLUSTERED 
(
	[no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[train_detail1]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[train_detail1](
	[t_number] [int] NOT NULL,
	[t_name] [varchar](20) NOT NULL,
	[t_source] [varchar](20) NULL,
	[t_destination] [varchar](20) NULL,
	[t_1ac] [int] NULL,
	[t_2ac] [int] NULL,
	[t_3ac] [int] NULL,
	[t_sl] [int] NULL,
	[monday] [bit] NULL,
	[tuesday] [bit] NULL,
	[wednesday] [bit] NULL,
	[thursday] [bit] NULL,
	[friday] [bit] NULL,
	[saturday] [bit] NULL,
	[sunday] [bit] NULL,
	[time] [varchar](20) NULL,
 CONSTRAINT [PK_train_detail1] PRIMARY KEY CLUSTERED 
(
	[t_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[veg_food]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[veg_food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[food] [varchar](50) NOT NULL,
	[price] [varchar](20) NULL,
 CONSTRAINT [PK_veg_food] PRIMARY KEY CLUSTERED 
(
	[food] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[veg_food1]    Script Date: 24-04-2018 06:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[veg_food1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[food] [varchar](50) NULL,
	[food1] [varchar](50) NULL,
	[food2] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[admin] ([username], [password]) VALUES (N'ismail', N'ismail')
SET IDENTITY_INSERT [dbo].[booking] ON 

INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (1, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (3, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (4, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (5, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (6, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (7, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (8, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (9, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (10, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (11, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (12, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (13, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (14, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (15, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (16, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (17, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (18, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (19, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (20, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (21, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (22, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (23, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (24, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (25, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (26, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (27, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (28, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (29, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (30, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (31, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (32, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (33, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (34, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (35, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (36, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (37, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (38, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (39, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (40, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (41, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (42, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (43, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (44, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (45, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (46, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (47, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (48, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (49, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (50, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (51, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (52, N'heelna', CAST(0xF33D0B00 AS Date), 12202, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (53, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (54, N'heelna', CAST(0xD73D0B00 AS Date), 12202, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (55, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (56, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (57, N'heelna', CAST(0x123E0B00 AS Date), 12202, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (58, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (59, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (60, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (61, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (62, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (63, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (64, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (65, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (66, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (67, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (68, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (69, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (70, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (71, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (72, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (73, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (74, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (75, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (76, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (77, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (78, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (79, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (80, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (81, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (82, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (83, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (84, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (85, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (86, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (87, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (88, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (89, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (90, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (91, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (92, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (93, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (94, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (95, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (96, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (97, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (98, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (99, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (100, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (101, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (102, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (103, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (104, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (105, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (106, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (107, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (108, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (109, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (110, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (111, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (112, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (113, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (114, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (115, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (116, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (117, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (118, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (119, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (120, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (121, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (122, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (123, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (124, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (125, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (126, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (127, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (128, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (129, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (130, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (131, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (132, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (133, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (134, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (135, N'heelna', CAST(0x123E0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (136, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (137, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (138, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (139, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (140, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (141, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (142, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (143, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (144, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (145, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (146, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (147, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (148, N'heelna', CAST(0xF33D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (149, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (150, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (151, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (152, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (153, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (154, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (155, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (156, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (157, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (158, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (159, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (160, N'heelna', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (161, N'zzzzzz', CAST(0xD73D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (162, N'zzzzzz', CAST(0xF33D0B00 AS Date), 12203, N'3AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (172, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (173, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (174, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (175, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (176, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (177, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (178, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (179, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (180, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (181, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (182, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (183, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (184, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (185, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (186, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (187, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (188, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (189, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (190, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (191, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (192, N'gold', CAST(0x123E0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (193, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (194, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (195, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (196, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (197, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (198, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (199, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (200, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (201, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (202, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (203, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (204, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (205, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (206, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (207, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (208, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (209, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (210, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (211, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (212, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (213, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (214, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (215, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (216, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (217, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (218, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (219, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (220, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (221, N'gold', CAST(0x123E0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (222, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (223, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (224, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (225, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (226, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (227, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (228, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'1AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (229, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (230, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (231, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (232, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (233, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (234, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (235, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (236, N'gold', CAST(0xD73D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (237, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (238, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (239, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (240, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (241, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (242, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (243, N'gold', CAST(0xF33D0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (244, N'gold', CAST(0x123E0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (245, N'gold', CAST(0x123E0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (246, N'gold', CAST(0x123E0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (247, N'gold', CAST(0x123E0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (248, N'gold', CAST(0x123E0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (249, N'gold', CAST(0x123E0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (250, N'gold', CAST(0x123E0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (251, N'gold', CAST(0x123E0B00 AS Date), 12201, N'2AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (267, N'wqewqe', CAST(0xD73D0B00 AS Date), 12201, N'1AC', N'6981537402', N'10-04-2018', 11, N'LOWER', N'CNF', N'male', N'2132132131', N'LTT', NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (306, N'xc', CAST(0xF33D0B00 AS Date), 12203, N'1AC', N'0426813759', N'12-04-2018', 22, N'UPPER', N'CNF', N'male', N'42423', N'Delhi Fast', N'07:42:00', N'345657568')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (311, N'mugha', CAST(0x5B950A00 AS Date), 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (312, N'DILDARNAGER', CAST(0x5B950A00 AS Date), 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (330, N'lbrahim', CAST(0x123E0B00 AS Date), 12201, N'SL', N'3759146082', N'15-04-2018', 23, N'LOWER', N'CNF', N'male', N'345435', N'LTT', N'07:44:00', N'3534534666')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (331, N'haleem', CAST(0x123E0B00 AS Date), 12201, N'SL', N'3759146082', N'15-04-2018', 55, N'LOWER', N'CNF', N'male', N'345345353234', N'LTT', N'07:44:00', N'3534534666')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (332, N'shamsun', CAST(0x123E0B00 AS Date), 12201, N'SL', N'3759146082', N'15-04-2018', 41, N'LOWER', N'CNF', N'female', N'345435', N'LTT', N'07:44:00', N'3534534666')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (333, N'asd', CAST(0xD73D0B00 AS Date), 12203, N'SL', N'6471935028', N'15-04-2018', 343, N'UPPER', N'CNF', N'male', N'4335345', N'Delhi Fast', N'07:42:00', N'4353543435')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (334, N'b', CAST(0xD73D0B00 AS Date), 12203, N'SL', N'6471935028', N'15-04-2018', 32, N'UPPER', N'CNF', N'male', N'24324242', N'Delhi Fast', N'07:42:00', N'4353543435')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (335, N'c', CAST(0xD73D0B00 AS Date), 12203, N'SL', N'6471935028', N'15-04-2018', 33, N'UPPER', N'CNF', N'male', N'45345', N'Delhi Fast', N'07:42:00', N'4353543435')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (337, N'safasf', CAST(0xD73D0B00 AS Date), 12203, N'SL', N'2148603579', N'15-04-2018', 33, N'No preferene', N'CNF', N'male', N'334422', N'Delhi Fast', N'07:42:00', N'35535344')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (338, N'asdasd', CAST(0xD73D0B00 AS Date), 12201, N'1AC', N'9815370246', N'15-04-2018', 222, N'LOWER', N'CNF', N'male', N'234234234234', N'LTT', N'07:44:00', N'23423423')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (339, N'asdsada', CAST(0xD73D0B00 AS Date), 12201, N'1AC', N'9815370246', N'15-04-2018', 22, N'LOWER', N'CNF', N'male', N'234234', N'LTT', N'07:44:00', N'23423423')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (340, N'asdsadasd', CAST(0xD73D0B00 AS Date), 12201, N'1AC', N'9815370246', N'15-04-2018', 33, N'LOWER', N'CNF', N'male', N'234234', N'LTT', N'07:44:00', N'23423423')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (341, N'asdasd', CAST(0xD73D0B00 AS Date), 12201, N'1AC', N'9815370246', N'15-04-2018', 33, N'LOWER', N'CNF', N'male', N'23423423', N'LTT', N'07:44:00', N'23423423')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (342, N'sdfs', CAST(0xD73D0B00 AS Date), 12201, N'SL', N'2047698153', N'15-04-2018', 33, N'LOWER', N'CNF', N'male', N'34534543', N'LTT', N'07:44:00', N'234242')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (343, N'sdfsdf', CAST(0xD73D0B00 AS Date), 12201, N'SL', N'2047698153', N'15-04-2018', 33, N'LOWER', N'CNF', N'male', N'345435435', N'LTT', N'07:44:00', N'234242')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (344, N'sdfssdf', CAST(0xD73D0B00 AS Date), 12201, N'SL', N'2047698153', N'15-04-2018', 33, N'LOWER', N'CNF', N'male', N'4354353', N'LTT', N'07:44:00', N'234242')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (345, N'sdfsd', CAST(0xD73D0B00 AS Date), 12201, N'SL', N'2047698153', N'15-04-2018', 33, N'LOWER', N'CNF', N'male', N'345', N'LTT', N'07:44:00', N'234242')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (410, N'f', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'4268103759', N'19-04-2018', 1, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (412, N'w', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'4268103759', N'19-04-2018', 3, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (413, N'a', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'4268103759', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'4', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (414, N'z', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'4268103759', N'19-04-2018', 5, N'LOWER', N'CNF', N'male', N'5', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (415, N'f', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'2547693180', N'19-04-2018', 1, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (417, N'w', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'2547693180', N'19-04-2018', 3, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (418, N'a', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'2547693180', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'4', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (419, N'z', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'2547693180', N'19-04-2018', 5, N'LOWER', N'CNF', N'male', N'5', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (420, N'f', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'1937582046', N'19-04-2018', 1, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (422, N'w', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'1937582046', N'19-04-2018', 3, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (423, N'a', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'1937582046', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'4', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (424, N'z', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'1937582046', N'19-04-2018', 5, N'LOWER', N'CNF', N'male', N'5', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (425, N'f', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'4860257193', N'19-04-2018', 1, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (427, N'w', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'4860257193', N'19-04-2018', 3, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (428, N'a', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'4860257193', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'4', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (429, N'z', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'4860257193', N'19-04-2018', 5, N'LOWER', N'CNF', N'male', N'5', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (430, N'f', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'9375042681', N'19-04-2018', 1, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (432, N'w', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'9375042681', N'19-04-2018', 3, N'LOWER', N'CNF', N'male', N'3', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (433, N'a', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'9375042681', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'4', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (434, N'z', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'9375042681', N'19-04-2018', 5, N'LOWER', N'CNF', N'male', N'5', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (435, N'rdgre', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9264807153', N'19-04-2018', 1, N'LOWER', N'CNF', N'male', N'56', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (436, N'h', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9264807153', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'56', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (438, N's', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9264807153', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'56', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (439, N'z', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9264807153', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'65', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (440, N'rdgre', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9204685371', N'19-04-2018', 1, N'LOWER', N'CNF', N'male', N'56', N'Delhi Fast', N'07:42:00', N'4354353')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (441, N'h', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9204685371', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'56', N'Delhi Fast', N'07:42:00', N'4354353')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (443, N's', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9204685371', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'56', N'Delhi Fast', N'07:42:00', N'4354353')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (444, N'z', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9204685371', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'65', N'Delhi Fast', N'07:42:00', N'4354353')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (445, N's', CAST(0xD73D0B00 AS Date), 12203, N'SL', N'0824769315', N'19-04-2018', 2, N'LOWER', N'CNF', N'male', N'7', N'Delhi Fast', N'07:42:00', N'876')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (447, N's', CAST(0xD73D0B00 AS Date), 12203, N'SL', N'0824769315', N'19-04-2018', 4, N'LOWER', N'CNF', N'male', N'7', N'Delhi Fast', N'07:42:00', N'876')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (448, N'f', CAST(0xD73D0B00 AS Date), 12203, N'SL', N'0824769315', N'19-04-2018', 5, N'LOWER', N'CNF', N'male', N'7', N'Delhi Fast', N'07:42:00', N'876')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (449, N'v', CAST(0xD73D0B00 AS Date), 12203, N'SL', N'0824769315', N'19-04-2018', 6, N'LOWER', N'CNF', N'male', N'7', N'Delhi Fast', N'07:42:00', N'876')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (458, N'good', CAST(0xD73D0B00 AS Date), 12203, N'3AC', N'9315870426', N'19-04-2018', 5, N'MIDDLE', N'CNF', N'male', N'2423', N'Delhi Fast', N'07:42:00', N'345345')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (460, N's', CAST(0xD73D0B00 AS Date), 12203, N'3AC', N'9315870426', N'19-04-2018', 3, N'MIDDLE', N'CNF', N'male', N'342234', N'Delhi Fast', N'07:42:00', N'345345')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (461, N'ihgj', CAST(0xD73D0B00 AS Date), 12202, N'1AC', N'7153920486', N'19-04-2018', 56, N'No preferene', N'CNF', N'male', N'5656', N'PATNA EXPRESS', N'07:42:00', N'6565')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (462, N'jj', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'9214360857', N'20-04-2018', 45, N'LOWER', N'CNF', N'male', N'68876876', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (463, N'ismail', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'9264803571', N'20-04-2018', 21, N'MIDDLE', N'CNF', N'male', N'5', N'LTT', N'07:44:00', N'463424334')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (464, N'ismail5', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'9264803571', N'20-04-2018', 22, N'LOWER', N'CNF', N'male', N'45', N'LTT', N'07:44:00', N'463424334')
GO
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (465, N'ismail4', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'9264803571', N'20-04-2018', 42, N'MIDDLE', N'CNF', N'male', N'5', N'LTT', N'07:44:00', N'463424334')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (466, N'ismail3', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'9264803571', N'20-04-2018', 45, N'LOWER', N'CNF', N'male', N'6', N'LTT', N'07:44:00', N'463424334')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (467, N'ismail2', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'9264803571', N'20-04-2018', 23, N'MIDDLE', N'CNF', N'male', N'7', N'LTT', N'07:44:00', N'463424334')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (1462, N'f', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'6082479315', N'20-04-2018', 8, N'LOWER', N'CNF', N'male', N'67', N'LTT', N'07:44:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (1463, N'g', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'6082479315', N'20-04-2018', 7, N'LOWER', N'CNF', N'male', N'7676', N'LTT', N'07:44:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (1464, N'h', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'6082479315', N'20-04-2018', 8, N'LOWER', N'CNF', N'male', N'7676', N'LTT', N'07:44:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (1465, N'n', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'6082479315', N'20-04-2018', 7, N'LOWER', N'CNF', N'male', N'67', N'LTT', N'07:44:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (1466, N'm', CAST(0xD73D0B00 AS Date), 12201, N'3AC', N'6082479315', N'20-04-2018', 8, N'LOWER', N'CNF', N'male', N'76', N'LTT', N'07:44:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2464, N'sdfsdf', CAST(0xF33D0B00 AS Date), 12203, N'SL', N'2148603579', N'21-04-2018', 21, N'UPPER', N'CNF', N'male', N'2321323', N'Delhi Fast', N'07:42:00', N'213213')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2468, N'asdasd', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'6482037591', N'21-04-2018', 21, N'UPPER', N'CNF', N'male', N'34543534', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2469, N'dgrdsf', CAST(0x123E0B00 AS Date), 12203, N'SL', N'6032597184', N'21-04-2018', 21, N'LOWER', N'CNF', N'female', N'455456567', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2470, N'gfdc', CAST(0xD73D0B00 AS Date), 12203, N'3AC', N'3759146082', N'21-04-2018', 22, N'UPPER', N'CNF', N'female', N'6574653453', N'Delhi Fast', N'07:42:00', N'45645')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2474, N'ismail', CAST(0x123E0B00 AS Date), 12201, N'1AC', N'6587042913', N'21-04-2018', 22, N'SIDE LOWER', N'CNF', N'male', N'4567567655', N'LTT', N'07:44:00', N'7897897878')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2475, N'heena', CAST(0x123E0B00 AS Date), 12201, N'1AC', N'6587042913', N'21-04-2018', 21, N'MIDDLE', N'CNF', N'female', N'43534534223', N'LTT', N'07:44:00', N'7897897878')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2476, N'ibrahim', CAST(0x123E0B00 AS Date), 12201, N'1AC', N'6587042913', N'21-04-2018', 25, N'LOWER', N'CNF', N'male', N'45435345', N'LTT', N'07:44:00', N'7897897878')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2477, N'shamsun', CAST(0x123E0B00 AS Date), 12201, N'1AC', N'6587042913', N'21-04-2018', 40, N'LOWER', N'CNF', N'female', N'3452423', N'LTT', N'07:44:00', N'7897897878')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2478, N'haleem', CAST(0x123E0B00 AS Date), 12201, N'1AC', N'6587042913', N'21-04-2018', 55, N'LOWER', N'CNF', N'male', N'23424234234', N'LTT', N'07:44:00', N'7897897878')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2480, N'ismail', CAST(0xD73D0B00 AS Date), 12203, N'3AC', N'1537092648', N'23-04-2018', 21, N'UPPER', N'CNF', N'male', N'3453534', N'Delhi Fast', N'07:42:00', N'234234')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2481, N'cxv', CAST(0xF33D0B00 AS Date), 12203, N'2AC', N'4810375962', N'23-04-2018', 55, N'SIDE LOWER', N'CNF', N'male', N'34543543', N'Delhi Fast', N'07:42:00', N'')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2486, N'gfh', CAST(0xF33D0B00 AS Date), 12203, N'3AC', N'2698103754', N'23-04-2018', 76, N'LOWER', N'CNF', N'male', N'676', N'Delhi Fast', N'07:42:00', N'4564646')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2487, N'ismail', CAST(0xD73D0B00 AS Date), 12203, N'2AC', N'1937546082', N'23-04-2018', 66, N'MIDDLE', N'CNF', N'male', N'5464566', N'Delhi Fast', N'07:42:00', N'456456')
INSERT [dbo].[booking] ([id], [passanger], [date], [train], [class], [pnr], [entry_date], [age], [berth], [status], [gender], [aadhar], [train_name], [time], [transaction_id]) VALUES (2488, N'fghf', CAST(0xD73D0B00 AS Date), 12203, N'2AC', N'1936587042', N'23-04-2018', 23, N'MIDDLE', N'CNF', N'male', N'2342342', N'Delhi Fast', N'07:42:00', N'324234')
SET IDENTITY_INSERT [dbo].[booking] OFF
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (60824, N'15-04-2018', 12202, N'02/03/2018', N'23:24', N'Vegetarian', 25, 600, 159753, N'Hot Yellow Curry with Vegetables', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (60824, N'15-04-2018', 12202, N'02/03/2018', N'23:24', N'Vegetarian', 25, 600, 159753, N' Makhni Paneer ', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (60824, N'15-04-2018', 12202, N'02/03/2018', N'23:24', N'Vegetarian', 25, 600, 159753, N' Masala Bhindi', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (60824, N'15-04-2018', 12202, N'02/03/2018', N'23:24', N'Vegetarian', 25, 600, 159753, N' Pommes Gratin', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (60824, N'15-04-2018', 12202, N'02/03/2018', N'23:24', N'Vegetarian', 25, 600, 159753, N' Vegetarian Burritos', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (42698, N'19-04-2018', 0, N'', N'', N'Vegetarian', 0, 500, 2234, N'Hot Yellow Curry with Vegetables', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (42698, N'19-04-2018', 0, N'', N'', N'Vegetarian', 0, 500, 2234, N' Makhni Paneer ', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (42698, N'19-04-2018', 0, N'', N'', N'Vegetarian', 0, 500, 2234, N' Masala Bhindi', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (42698, N'19-04-2018', 0, N'', N'', N'Vegetarian', 0, 500, 2234, N' Pommes Gratin', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (43608, N'21-04-2018', 12202, N'03/03/2018', N'16:44', N'Vegetarian', 59, 500, 234343234, N'Hot Yellow Curry with Vegetables', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (43608, N'21-04-2018', 12202, N'03/03/2018', N'16:44', N'Vegetarian', 59, 500, 234343234, N' Makhni Paneer ', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (43608, N'21-04-2018', 12202, N'03/03/2018', N'16:44', N'Vegetarian', 59, 500, 234343234, N' Masala Bhindi', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (43608, N'21-04-2018', 12202, N'03/03/2018', N'16:44', N'Vegetarian', 59, 500, 234343234, N' Pommes Gratin', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (10375, N'23-04-2018', 21212, N'03/03/2018', N'23:32', N'Non-Vegetarian', 3223, 500, 3333323, N'CHICKEN CHILLY(GRAVY)', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (10375, N'23-04-2018', 21212, N'03/03/2018', N'23:32', N'Non-Vegetarian', 3223, 500, 3333323, N'NULLGARLIC CHICKEN(GRAVY)', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (10375, N'23-04-2018', 21212, N'03/03/2018', N'23:32', N'Non-Vegetarian', 3223, 500, 3333323, N'CHICKEN MANCHURIAN(GRAVY)', N'100 RS')
INSERT [dbo].[food_service] ([receipt_id], [booked_date], [train_number], [date_of_delivery], [time_of_delivery], [food_type], [seat_no], [total], [transaction_id], [food], [price]) VALUES (10375, N'23-04-2018', 21212, N'03/03/2018', N'23:32', N'Non-Vegetarian', 3223, 500, 3333323, N'SWEET &amp; SOUR CHICKEN', N'100 RS')
SET IDENTITY_INSERT [dbo].[non_vegfoods] ON 

INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (1, N'CHICKEN CHILLY(GRAVY)', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (2, N'NULLGARLIC CHICKEN(GRAVY)', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (3, N'CHICKEN MANCHURIAN(GRAVY)', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (4, N'SWEET & SOUR CHICKEN', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (5, N'GINGER CHICKEN(GRAVY)', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (6, N'GINGER CHICKEN IN HONEY SAUCE', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (7, N'HONG KONG CHICKEN', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (8, N'CHICKEN IN GREEN GARLIC SAUCE', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (9, N'ROASTED LAMB IN HONEY SAUCE', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (10, N'LAMB WITH BLACK PEPPER SAUCE', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (11, N'SLICED LAMB WITH MUSHROOM', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (12, N'DICED LAMB SCHEZWAN', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (13, N'FRIED PRAWNS IN RED & GREEN PEPPER', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (14, N'	FISH MANCHURIAN GRAVY', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (15, N'	CHICKEN WITH BABY CORN & MUSHROOM', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (16, N'PRAWNS MANCHURIAN GRAVY', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (17, N'	GINGER PRAWNS(GRAVY)', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (18, N'	SWEET & SOUR PRAWNS', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (19, N'PRAWNS IN GARLIC SAUCE', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (20, N'FISH IN SCHEZWAN SAUCE', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (21, N'	SWEET & SOUR PRAWNS', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (22, N'CHICKEN SUPREME', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (23, N'NULLSHOWLIN CHICKEN', N'100 RS')
INSERT [dbo].[non_vegfoods] ([id], [foods], [price]) VALUES (24, N'CHICKEN', N'100 RS')
SET IDENTITY_INSERT [dbo].[non_vegfoods] OFF
SET IDENTITY_INSERT [dbo].[nonveg_food] ON 

INSERT [dbo].[nonveg_food] ([id], [food], [food1], [food2]) VALUES (1, N'CHICKEN CHILLY(GRAVY)', N'	
GARLIC CHICKEN(GRAVY)', N'CHICKEN MANCHURIAN(GRAVY)')
INSERT [dbo].[nonveg_food] ([id], [food], [food1], [food2]) VALUES (2, N'SWEET & SOUR CHICKEN', N'
GINGER CHICKEN(GRAVY)', N'GINGER CHICKEN IN HONEY SAUCE')
INSERT [dbo].[nonveg_food] ([id], [food], [food1], [food2]) VALUES (3, N'	
HONG KONG CHICKEN', N'CHICKEN IN GREEN GARLIC SAUCE', N'ROASTED LAMB IN HONEY SAUCE')
INSERT [dbo].[nonveg_food] ([id], [food], [food1], [food2]) VALUES (4, N'LAMB WITH BLACK PEPPER SAUCE', N'SLICED LAMB WITH MUSHROOM', N'DICED LAMB SCHEZWAN')
INSERT [dbo].[nonveg_food] ([id], [food], [food1], [food2]) VALUES (5, N'	
FRIED PRAWNS IN RED & GREEN PEPPER', N'FISH MANCHURIAN GRAVY', N'	
CHICKEN WITH BABY CORN & MUSHROOM')
INSERT [dbo].[nonveg_food] ([id], [food], [food1], [food2]) VALUES (6, N'PRAWNS MANCHURIAN GRAVY', N'GINGER PRAWNS(GRAVY)', N'SWEET & SOUR PRAWNS')
INSERT [dbo].[nonveg_food] ([id], [food], [food1], [food2]) VALUES (7, N'PRAWNS IN GARLIC SAUCE', N'FISH IN SCHEZWAN SAUCE', N'SWEET & SOUR PRAWNS ')
INSERT [dbo].[nonveg_food] ([id], [food], [food1], [food2]) VALUES (8, N'CHICKEN SUPREME', N'SHOWLIN CHICKEN', N'CHICKEN IN OYSTER SAUCE')
SET IDENTITY_INSERT [dbo].[nonveg_food] OFF
INSERT [dbo].[payment] ([Total_amount], [bank], [card_name], [card_type], [card_no], [pnr]) VALUES (N'fd', N'dfgg', N'dgdf', N'Debit Card', 2323242, N'9214360857')
INSERT [dbo].[payment] ([Total_amount], [bank], [card_name], [card_type], [card_no], [pnr]) VALUES (N'fd', N'dfgg', N'dgdf', N'Debit Card', 2323242, N'3608247915')
INSERT [dbo].[payment] ([Total_amount], [bank], [card_name], [card_type], [card_no], [pnr]) VALUES (N'', N'', N'', N'', 0, N'9815370246')
INSERT [dbo].[payment] ([Total_amount], [bank], [card_name], [card_type], [card_no], [pnr]) VALUES (N'1190', N'axis', N'ghgjh', N'Debit Card', 4534534, N'4860257193')
INSERT [dbo].[payment] ([Total_amount], [bank], [card_name], [card_type], [card_no], [pnr]) VALUES (N'595', N'axis', N'ismail', N'Credit Card', 3453, N'1486032579')
INSERT [dbo].[payment] ([Total_amount], [bank], [card_name], [card_type], [card_no], [pnr]) VALUES (N'2334', N'fdgdf', N'dfgdg', N'Debit Card', 23423, N'5921486073')
INSERT [dbo].[payment] ([Total_amount], [bank], [card_name], [card_type], [card_no], [pnr]) VALUES (N'43543', N'sdfs', N'sdfsdf', N'Credit Card', 3242, N'2046981537')
INSERT [dbo].[register] ([first_name], [last_name], [user_id], [confirm_password], [phon_no], [email_id], [gender], [age], [state], [pin_code]) VALUES (N'heena', N'miyan', N'heena', N'heena', N'8286674913', N'iosdvjaswed@iofchfh', N'Female', 22, N'maharahtra', 116549498)
INSERT [dbo].[register] ([first_name], [last_name], [user_id], [confirm_password], [phon_no], [email_id], [gender], [age], [state], [pin_code]) VALUES (N'ismail', N'ismail', N'ismail', N'ismail', N'213123131', N'gdffs@gsdf', N'Male', 22, N'sgshfh', 12312)
INSERT [dbo].[register] ([first_name], [last_name], [user_id], [confirm_password], [phon_no], [email_id], [gender], [age], [state], [pin_code]) VALUES (N'ismails', N'miyan', N'ismail1', N'loop', N'8286674913', N'afsdsad@adf', N'Male', 55, N'ddfg', 34345345)
INSERT [dbo].[register] ([first_name], [last_name], [user_id], [confirm_password], [phon_no], [email_id], [gender], [age], [state], [pin_code]) VALUES (N'ismails', N'miyan', N'ismail2', N'loop', N'8286674913', N'afsdsad@adf', N'Male', 55, N'ddfg', 34345345)
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'6', N'AGRA', N'UP')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'122', N'ALLAHBAD', N'UTTER PRADESH')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'4', N'BHOPAL', N'MP')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'122', N'DILDARNAGER', N'UTTER PRADESH')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'122', N'GAZIPUR', N'UTTER PRADESH')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'3', N'IGATPURI', N'maharashtra')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'12', N'kalyan', N'mumbai')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'3', N'KASARA', N'maharashtra')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'12', N'kayan', N'mumbai')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'dfgdf', N'loop', N'fdfd')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'122', N'MIRZAPUR', N'UTTER PRADESH')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'122', N'MUGHALSARAI', N'UTTER PRADESH')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'1', N'MUMBAI', N'maharashtra')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'6', N'NIZAMUDDIN', N'DELHI')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'5', N'NOEDA', N'MP')
INSERT [dbo].[station_add] ([station_code], [station_name], [station_location]) VALUES (N'PNU', N'PUNE', N'MAHARASHTRA')
SET IDENTITY_INSERT [dbo].[train_code] ON 

INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700E0EED1400000 AS Time), 12201, 17, N'kalyan')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700E0EED1400000 AS Time), 12201, 19, N'ALLAHBAD')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700E0EED1400000 AS Time), 12201, 20, N'MUGHALSARAI')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700E0EED1400000 AS Time), 12201, 21, N'MIRZAPUR')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700E0EED1400000 AS Time), 12201, 22, N'DILDARNAGER')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700E0EED1400000 AS Time), 12201, 23, N'GAZIPUR')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12203, 25, N'MUMBAI')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12203, 28, N'kasara')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12203, 29, N'IGATPURI')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12203, 30, N'BHOPAL')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12203, 31, N'AGRA')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12203, 33, N'ALLAHBAD')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12203, 34, N'NIZAMUDDIN')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12203, 36, N'kalyan')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12202, 1033, N'kalyan')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12202, 1034, N'kasara')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12202, 1035, N'igatpuri')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12202, 1039, N'kalyan')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x070054688A400000 AS Time), 12202, 1041, N'DILDARNAGER')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700026489010000 AS Time), 13202, 1042, N'kalyan')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700B0EB0E0A0000 AS Time), 13202, 1043, N'KASARA')
INSERT [dbo].[train_code] ([time], [train_number], [no], [station]) VALUES (CAST(0x0700B617AB0E0000 AS Time), 13202, 1044, N'IGATPURI')
SET IDENTITY_INSERT [dbo].[train_code] OFF
INSERT [dbo].[train_detail1] ([t_number], [t_name], [t_source], [t_destination], [t_1ac], [t_2ac], [t_3ac], [t_sl], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday], [sunday], [time]) VALUES (1211, N'LTT', N'qw', N'wq', 2, 2, 2, 2, 0, 0, 1, 0, 1, 0, 0, N'02:01 AM')
INSERT [dbo].[train_detail1] ([t_number], [t_name], [t_source], [t_destination], [t_1ac], [t_2ac], [t_3ac], [t_sl], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday], [sunday], [time]) VALUES (12201, N'LTT', N'kurla', N'patna', 3, 2, 3, 2, 1, 1, 1, 1, 1, 1, 1, N'07:43 AM')
INSERT [dbo].[train_detail1] ([t_number], [t_name], [t_source], [t_destination], [t_1ac], [t_2ac], [t_3ac], [t_sl], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday], [sunday], [time]) VALUES (12202, N'PATNA EXPRESS', N'MUMBAI', N'PATNA', 3, 3, 3, 5, 0, 0, 1, 0, 0, 1, 1, N'05:55 AM')
INSERT [dbo].[train_detail1] ([t_number], [t_name], [t_source], [t_destination], [t_1ac], [t_2ac], [t_3ac], [t_sl], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday], [sunday], [time]) VALUES (12203, N'Delhi Fast', N'mumbai', N'delhi', 4, 3, 2, 4, 0, 1, 0, 0, 0, 1, 0, N'12:44 PM')
INSERT [dbo].[train_detail1] ([t_number], [t_name], [t_source], [t_destination], [t_1ac], [t_2ac], [t_3ac], [t_sl], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday], [sunday], [time]) VALUES (13201, N'LTT mumbai', N' kurla', N'patna', 4, 3, 3, 4, 0, 1, 0, 1, 0, 1, 1, N'12:01 AM')
INSERT [dbo].[train_detail1] ([t_number], [t_name], [t_source], [t_destination], [t_1ac], [t_2ac], [t_3ac], [t_sl], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday], [sunday], [time]) VALUES (13202, N'LTT PATNA', N'KURLA', N'PATNA', 4, 4, 5, 10, 1, 1, 1, 1, 1, 1, 1, N'11:07 PM')
SET IDENTITY_INSERT [dbo].[veg_food] ON 

INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (11, N' Bean-Centered Dishes', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (13, N' Eggplant Parmesan', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (2, N' Makhni Paneer ', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (3, N' Masala Bhindi', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (10, N' Matar Ka Dulma', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (18, N' Pizza', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (4, N' Pommes Gratin', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (5, N' Vegetarian Burritos', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (20, N'Bagel and Cream Cheese', NULL)
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (8, N'Dum Paneer Kali Mirch', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (19, N'Grilled Cheese', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (1, N'Hot Yellow Curry with Vegetables', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (16, N'Pasta', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (17, N'Peanut Butter and Jelly', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (7, N'Penne A La Vodka', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (12, N'Tofu', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (14, N'Tofu Scramble', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (9, N'Vegetarian Khow Suey', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (6, N'Vegetarian Nargisi Kofta', N'100 RS')
INSERT [dbo].[veg_food] ([id], [food], [price]) VALUES (15, N'Veggie Burger', N'100 RS')
SET IDENTITY_INSERT [dbo].[veg_food] OFF
SET IDENTITY_INSERT [dbo].[veg_food1] ON 

INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (1, N'DICED VEG SCHEZWAN', N'
VEG MANCHURIAN(GRAVY)', N'MUSHROOM MANCHURIAN(GRAVY)')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (2, N'PANEER CHILLY(GRAVY)', N'SWEET & SOUR VEGETABLES', N'VEG CASHEWNUT')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (3, N'VEG CHOW CHOW', N'
VEG BALL SCHEZWAN', N'VEG IN HOT GREEN SAUCE')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (4, N'VEG BALL SCHEZWAN', N'	
MUSHROOM & BABYCORNIN HOT GREEN SAUCE', N'	
MUSHROOM CHILLY(GRAVY)')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (5, N'VEG PINEAPPLE CASHEWNUT', N'VEG FRIED RICE', N'MUSHROOM FRIED RICE')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (6, N'
VEG PEKING FRIED RICE', N'VEG SCHEZWAN FRIED RICE', N'VEG HAKKA NOODLES')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (7, N'VEG AMERICAN CHOPSEY', N'VEG CHEWMEIN', N'VEG TRIPLE SCHEZWAN FRIED RICE')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (8, N'SPINACH (PALAK) FRIED RICE', N'	
PAN FRIED NOODLES VEG', N'VEG STEWED RICE ')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (9, N'VEG POT RICE', N'SPECIAL THAI FRIED RICE VEG', N'
VEG BIRYANI')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (10, N'VEG PULAV', N'KASHMIRI PULAV', N'PANEER PULAV')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (11, N'GREEN PEAS PULAV', N'JEERA FRIED RICE', N'STEAMED RICE')
INSERT [dbo].[veg_food1] ([id], [food], [food1], [food2]) VALUES (12, N'DAL KHICHADI', N'KHICHADI PULAV', N'
BIRYANI RICE')
SET IDENTITY_INSERT [dbo].[veg_food1] OFF
ALTER TABLE [dbo].[train_code]  WITH CHECK ADD  CONSTRAINT [FK_train_code_station_add] FOREIGN KEY([station])
REFERENCES [dbo].[station_add] ([station_name])
GO
ALTER TABLE [dbo].[train_code] CHECK CONSTRAINT [FK_train_code_station_add]
GO
ALTER TABLE [dbo].[train_code]  WITH CHECK ADD  CONSTRAINT [FK_train_code_train_detail1] FOREIGN KEY([train_number])
REFERENCES [dbo].[train_detail1] ([t_number])
GO
ALTER TABLE [dbo].[train_code] CHECK CONSTRAINT [FK_train_code_train_detail1]
GO
USE [master]
GO
ALTER DATABASE [railwaymanagement] SET  READ_WRITE 
GO
