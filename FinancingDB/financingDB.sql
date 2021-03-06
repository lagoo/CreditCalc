USE [master]
GO
/****** Object:  Database [Financing]    Script Date: 6/18/2020 5:41:06 PM ******/
CREATE DATABASE [Financing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Financing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Financing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Financing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Financing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Financing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Financing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Financing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Financing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Financing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Financing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Financing] SET ARITHABORT OFF 
GO
ALTER DATABASE [Financing] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Financing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Financing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Financing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Financing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Financing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Financing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Financing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Financing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Financing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Financing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Financing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Financing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Financing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Financing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Financing] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Financing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Financing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Financing] SET  MULTI_USER 
GO
ALTER DATABASE [Financing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Financing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Financing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Financing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Financing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Financing] SET QUERY_STORE = OFF
GO
USE [Financing]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 6/18/2020 5:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[CellPhone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancingInstallments]    Script Date: 6/18/2020 5:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancingInstallments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstallmentNumber] [int] NOT NULL,
	[InstallmentValue] [decimal](18, 4) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[PaymentDate] [datetime2](7) NULL,
	[FinancingId] [int] NOT NULL,
 CONSTRAINT [PK_FinancingInstallments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financings]    Script Date: 6/18/2020 5:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](18, 4) NOT NULL,
	[FinancingType] [varchar](200) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Financings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Name], [UF], [CellPhone]) VALUES (1, N'Iago', N'SP', N'99999999')
INSERT [dbo].[Clients] ([Id], [Name], [UF], [CellPhone]) VALUES (2, N'Mariana', N'SP', N'88888888')
INSERT [dbo].[Clients] ([Id], [Name], [UF], [CellPhone]) VALUES (3, N'Diego', N'SC', N'777777777')
INSERT [dbo].[Clients] ([Id], [Name], [UF], [CellPhone]) VALUES (4, N'Marcio', N'SC', N'6666666666')
INSERT [dbo].[Clients] ([Id], [Name], [UF], [CellPhone]) VALUES (5, N'Wallace', N'RJ', N'5555555555')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[FinancingInstallments] ON 

INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (1, 1, CAST(2021.2857 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (2, 2, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (3, 1, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (4, 7, CAST(2082.0000 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-08-20T03:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (5, 6, CAST(2082.0000 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-07-20T03:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (6, 5, CAST(2082.0000 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-06-20T03:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (7, 4, CAST(2082.0000 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (8, 3, CAST(2082.0000 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (9, 2, CAST(2082.0000 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (10, 1, CAST(2082.0000 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), 11)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (11, 4, CAST(2407.0000 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (12, 3, CAST(2407.0000 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-04-25T03:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (13, 2, CAST(2407.0000 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-03-25T03:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (14, 1, CAST(2407.0000 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-02-25T03:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (15, 8, CAST(1197.7500 AS Decimal(18, 4)), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), NULL, 9)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (16, 7, CAST(1197.7500 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), NULL, 9)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (17, 6, CAST(1197.7500 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), NULL, 9)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (18, 5, CAST(1197.7500 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), NULL, 9)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (19, 4, CAST(1197.7500 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), NULL, 9)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (20, 3, CAST(1197.7500 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), NULL, 9)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (21, 2, CAST(1197.7500 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), NULL, 9)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (22, 1, CAST(1197.7500 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), NULL, 9)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (23, 6, CAST(1987.8333 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), NULL, 8)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (24, 5, CAST(1987.8333 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), NULL, 8)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (25, 3, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (26, 4, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (27, 5, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (28, 6, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (29, 7, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (30, 6, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (31, 5, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (32, 4, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (33, 3, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (34, 2, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (35, 1, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (36, 4, CAST(2396.7500 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (37, 3, CAST(2396.7500 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (38, 2, CAST(2396.7500 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (39, 1, CAST(2396.7500 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), 14)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (40, 4, CAST(1987.8333 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), NULL, 8)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (41, 9, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (42, 7, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (43, 6, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (44, 5, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (45, 4, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (46, 3, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (47, 2, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (48, 1, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (49, 10, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-11-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-11-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (50, 9, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (51, 8, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (52, 7, CAST(696.7000 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (53, 8, CAST(802.8889 AS Decimal(18, 4)), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), 13)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (54, 8, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), 15)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (55, 3, CAST(1987.8333 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), NULL, 8)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (56, 1, CAST(1987.8333 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), NULL, 8)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (57, 4, CAST(1216.7500 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), NULL, 4)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (58, 3, CAST(1216.7500 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), NULL, 4)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (59, 2, CAST(1216.7500 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), NULL, 4)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (60, 1, CAST(1216.7500 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), NULL, 4)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (61, 3, CAST(3334.6667 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), NULL, 3)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (62, 2, CAST(3334.6667 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), NULL, 3)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (63, 1, CAST(3334.6667 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), NULL, 3)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (64, 10, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-11-15T03:00:00.0000000' AS DateTime2), NULL, 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (65, 9, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), NULL, 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (66, 8, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), NULL, 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (67, 7, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), NULL, 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (68, 6, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (69, 5, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (70, 4, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (71, 3, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (72, 2, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (73, 1, CAST(827.8000 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (74, 7, CAST(2021.2857 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (75, 6, CAST(2021.2857 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (76, 5, CAST(2021.2857 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (77, 4, CAST(2021.2857 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (78, 3, CAST(2021.2857 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (79, 2, CAST(2021.2857 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (80, 5, CAST(1216.7500 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), NULL, 4)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (81, 6, CAST(1216.7500 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), NULL, 4)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (82, 7, CAST(1216.7500 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), NULL, 4)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (83, 8, CAST(1216.7500 AS Decimal(18, 4)), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), NULL, 4)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (84, 9, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (85, 8, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (86, 7, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-08-26T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (87, 6, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-07-26T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (88, 5, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-06-26T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (89, 4, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (90, 3, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (91, 2, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (92, 1, CAST(1561.2222 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (93, 7, CAST(1799.4286 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), NULL, 6)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (94, 6, CAST(1799.4286 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), NULL, 6)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (95, 2, CAST(1987.8333 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), NULL, 8)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (96, 5, CAST(1799.4286 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), NULL, 6)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (97, 3, CAST(1799.4286 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), NULL, 6)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (98, 2, CAST(1799.4286 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), NULL, 6)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (99, 1, CAST(1799.4286 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), NULL, 6)
GO
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (100, 8, CAST(784.7500 AS Decimal(18, 4)), CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (101, 7, CAST(784.7500 AS Decimal(18, 4)), CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (102, 6, CAST(784.7500 AS Decimal(18, 4)), CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (103, 5, CAST(784.7500 AS Decimal(18, 4)), CAST(N'2020-06-15T03:00:00.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (104, 4, CAST(784.7500 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (105, 3, CAST(784.7500 AS Decimal(18, 4)), CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (106, 2, CAST(784.7500 AS Decimal(18, 4)), CAST(N'2020-03-15T03:00:00.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (107, 1, CAST(784.7500 AS Decimal(18, 4)), CAST(N'2020-02-15T03:00:00.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (108, 4, CAST(1799.4286 AS Decimal(18, 4)), CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), NULL, 6)
INSERT [dbo].[FinancingInstallments] ([Id], [InstallmentNumber], [InstallmentValue], [DueDate], [PaymentDate], [FinancingId]) VALUES (109, 9, CAST(1177.8889 AS Decimal(18, 4)), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), 15)
SET IDENTITY_INSERT [dbo].[FinancingInstallments] OFF
GO
SET IDENTITY_INSERT [dbo].[Financings] ON 

INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (1, CAST(14149.0000 AS Decimal(18, 4)), N'Habitação', CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (2, CAST(8278.0000 AS Decimal(18, 4)), N'Habitação', CAST(N'2020-11-15T03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (3, CAST(10004.0000 AS Decimal(18, 4)), N'Imobiliario', CAST(N'2020-04-15T03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (4, CAST(9734.0000 AS Decimal(18, 4)), N'Imobiliario', CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (5, CAST(6278.0000 AS Decimal(18, 4)), N'Habitação', CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (6, CAST(12596.0000 AS Decimal(18, 4)), N'Imobiliario', CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (7, CAST(14051.0000 AS Decimal(18, 4)), N'Imobiliario', CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (8, CAST(11927.0000 AS Decimal(18, 4)), N'Habitação', CAST(N'2020-07-15T03:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (9, CAST(9582.0000 AS Decimal(18, 4)), N'Imobiliario', CAST(N'2020-09-15T03:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (10, CAST(9628.0000 AS Decimal(18, 4)), N'Habitação', CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (11, CAST(14574.0000 AS Decimal(18, 4)), N'Imobiliario', CAST(N'2020-08-15T03:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (12, CAST(6967.0000 AS Decimal(18, 4)), N'Imobiliario', CAST(N'2020-11-15T03:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (13, CAST(7226.0000 AS Decimal(18, 4)), N'Habitação', CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (14, CAST(9587.0000 AS Decimal(18, 4)), N'Habitação', CAST(N'2020-05-15T03:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Financings] ([Id], [Value], [FinancingType], [DueDate], [ClientId]) VALUES (15, CAST(10601.0000 AS Decimal(18, 4)), N'Habitação', CAST(N'2020-10-15T03:00:00.0000000' AS DateTime2), 5)
SET IDENTITY_INSERT [dbo].[Financings] OFF
GO
/****** Object:  Index [IX_FinancingInstallments_FinancingId]    Script Date: 6/18/2020 5:41:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_FinancingInstallments_FinancingId] ON [dbo].[FinancingInstallments]
(
	[FinancingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Financings_ClientId]    Script Date: 6/18/2020 5:41:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_Financings_ClientId] ON [dbo].[Financings]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancingInstallments]  WITH CHECK ADD  CONSTRAINT [FK_FinancingInstallments_Financings_FinancingId] FOREIGN KEY([FinancingId])
REFERENCES [dbo].[Financings] ([Id])
GO
ALTER TABLE [dbo].[FinancingInstallments] CHECK CONSTRAINT [FK_FinancingInstallments_Financings_FinancingId]
GO
ALTER TABLE [dbo].[Financings]  WITH CHECK ADD  CONSTRAINT [FK_Financings_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Financings] CHECK CONSTRAINT [FK_Financings_Clients_ClientId]
GO
USE [master]
GO
ALTER DATABASE [Financing] SET  READ_WRITE 
GO
