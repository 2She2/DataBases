USE [master]
GO
/****** Object:  Database [Addresses]    Script Date: 24.08.2014 11:37:11 AM ******/
CREATE DATABASE [Addresses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Addresses', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Addresses.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Addresses_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Addresses_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Addresses] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Addresses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Addresses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Addresses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Addresses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Addresses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Addresses] SET ARITHABORT OFF 
GO
ALTER DATABASE [Addresses] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Addresses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Addresses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Addresses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Addresses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Addresses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Addresses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Addresses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Addresses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Addresses] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Addresses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Addresses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Addresses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Addresses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Addresses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Addresses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Addresses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Addresses] SET RECOVERY FULL 
GO
ALTER DATABASE [Addresses] SET  MULTI_USER 
GO
ALTER DATABASE [Addresses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Addresses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Addresses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Addresses] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Addresses] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Addresses', N'ON'
GO
USE [Addresses]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 24.08.2014 11:37:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address_text] [nvarchar](50) NOT NULL,
	[Town_ID] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 24.08.2014 11:37:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 24.08.2014 11:37:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Continent_ID] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 24.08.2014 11:37:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [nvarchar](50) NOT NULL,
	[Last_name] [nvarchar](50) NOT NULL,
	[Addresses_ID] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 24.08.2014 11:37:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Country_ID] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([ID], [Address_text], [Town_ID]) VALUES (1, N'jk. Mladost, street 1a', 1)
INSERT [dbo].[Addresses] ([ID], [Address_text], [Town_ID]) VALUES (2, N'jk. Boiana, street 2b', 1)
INSERT [dbo].[Addresses] ([ID], [Address_text], [Town_ID]) VALUES (5, N'jk. Vladislavovo, blok 307', 2)
INSERT [dbo].[Addresses] ([ID], [Address_text], [Town_ID]) VALUES (6, N'jk. Chaika, street 3c', 2)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([ID], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continents] ([ID], [Name]) VALUES (2, N'Asia')
INSERT [dbo].[Continents] ([ID], [Name]) VALUES (3, N'NorthAmerica')
INSERT [dbo].[Continents] ([ID], [Name]) VALUES (4, N'Africa')
INSERT [dbo].[Continents] ([ID], [Name]) VALUES (5, N'Australia')
INSERT [dbo].[Continents] ([ID], [Name]) VALUES (6, N'SouthAmerica')
INSERT [dbo].[Continents] ([ID], [Name]) VALUES (7, N'Antarctica')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([ID], [Name], [Continent_ID]) VALUES (1, N'Russia', 1)
INSERT [dbo].[Countries] ([ID], [Name], [Continent_ID]) VALUES (2, N'Germany', 1)
INSERT [dbo].[Countries] ([ID], [Name], [Continent_ID]) VALUES (3, N'Turkey', 1)
INSERT [dbo].[Countries] ([ID], [Name], [Continent_ID]) VALUES (4, N'France', 1)
INSERT [dbo].[Countries] ([ID], [Name], [Continent_ID]) VALUES (5, N'United Kingdom', 1)
INSERT [dbo].[Countries] ([ID], [Name], [Continent_ID]) VALUES (6, N'Italy', 1)
INSERT [dbo].[Countries] ([ID], [Name], [Continent_ID]) VALUES (10, N'Bulgaria', 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([ID], [First_name], [Last_name], [Addresses_ID]) VALUES (1, N'Pesho', N'Peshev', 1)
INSERT [dbo].[Persons] ([ID], [First_name], [Last_name], [Addresses_ID]) VALUES (2, N'Gosho', N'Goshev', 2)
INSERT [dbo].[Persons] ([ID], [First_name], [Last_name], [Addresses_ID]) VALUES (4, N'Sasho', N'Sashev', 5)
INSERT [dbo].[Persons] ([ID], [First_name], [Last_name], [Addresses_ID]) VALUES (5, N'Misho', N'Mishev', 6)
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (1, N'Sofia', 10)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (2, N'Varna', 10)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (3, N'Plovdiv', 10)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (4, N'Burgas', 10)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (5, N'Ruse', 10)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (6, N'Pleven', 10)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (7, N'Blagoevgrad', 10)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (8, N'Moscow', 1)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (9, N'Saint Petersburg', 1)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (10, N'Novosibirsk', 1)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (11, N'Yekaterinburg', 1)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (12, N'Nizhny Novgorod', 1)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (13, N'Berlin', 2)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (14, N'Hamburg', 2)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (15, N'Munich', 2)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (16, N'Cologne', 2)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (17, N'Frankfurt', 2)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (18, N'Stuttgart', 2)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (19, N'Dortmund', 2)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (20, N'Istanbul', 3)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (21, N'Ankara', 3)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (22, N'Izmir', 3)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (23, N'Bursa', 3)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (24, N'Paris', 4)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (25, N'Lyon', 4)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (26, N'Marseille', 4)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (27, N'Toulouse', 4)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (28, N'Lille', 4)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (29, N'Bordeaux', 4)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (30, N'Nice', 4)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (31, N'London', 5)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (32, N'Birmingham', 5)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (33, N'Glasgow', 5)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (34, N'Liverpool', 5)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (35, N'Bristol', 5)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (36, N'Sheffield', 5)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (37, N'Manchester', 5)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (38, N'Rome', 6)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (39, N'Milan', 6)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (40, N'Naples', 6)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (41, N'Turin', 6)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (42, N'Palermo', 6)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (43, N'Genoa', 6)
INSERT [dbo].[Towns] ([ID], [Name], [Country_ID]) VALUES (44, N'Bologna', 6)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([Town_ID])
REFERENCES [dbo].[Towns] ([ID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([Continent_ID])
REFERENCES [dbo].[Continents] ([ID])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Addresses] FOREIGN KEY([Addresses_ID])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [Addresses] SET  READ_WRITE 
GO
