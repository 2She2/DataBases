USE [master]
GO
/****** Object:  Database [Dictionary]    Script Date: 24.08.2014 12:36:01 PM ******/
CREATE DATABASE [Dictionary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dictionary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Dictionary.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Dictionary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Dictionary_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Dictionary] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dictionary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dictionary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dictionary] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dictionary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dictionary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dictionary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dictionary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dictionary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dictionary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dictionary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dictionary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dictionary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dictionary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dictionary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dictionary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dictionary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dictionary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dictionary] SET RECOVERY FULL 
GO
ALTER DATABASE [Dictionary] SET  MULTI_USER 
GO
ALTER DATABASE [Dictionary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dictionary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dictionary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dictionary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Dictionary] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dictionary', N'ON'
GO
USE [Dictionary]
GO
/****** Object:  Table [dbo].[Antonyms]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Antonyms](
	[Word_ID] [int] NOT NULL,
	[Antonym_ID] [int] NOT NULL,
 CONSTRAINT [PK_Antonyms] PRIMARY KEY CLUSTERED 
(
	[Word_ID] ASC,
	[Antonym_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Explanations]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Explanations](
	[Explanation_ID] [int] NOT NULL,
	[Explanation] [nvarchar](50) NOT NULL,
	[Language_ID] [int] NOT NULL,
 CONSTRAINT [PK_Explanations] PRIMARY KEY CLUSTERED 
(
	[Explanation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Language_ID] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Language_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartOfSpeeches]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartOfSpeeches](
	[PartOfSpeech_ID] [int] NOT NULL,
	[Word_ID] [int] NOT NULL,
 CONSTRAINT [PK_PartOfSpeeches] PRIMARY KEY CLUSTERED 
(
	[PartOfSpeech_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Translations]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[Word_ID] [int] NOT NULL,
	[Translation_ID] [int] NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[Word_ID] ASC,
	[Translation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[Word_ID] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
	[Language_ID] [int] NOT NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[Word_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WordsExplanations]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordsExplanations](
	[Words_ID] [int] NOT NULL,
	[Explanation_ID] [int] NOT NULL,
 CONSTRAINT [PK_WordsExplanations] PRIMARY KEY CLUSTERED 
(
	[Words_ID] ASC,
	[Explanation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WordsHypernyms]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordsHypernyms](
	[Hypernym_ID] [int] NOT NULL,
	[Word_ID] [int] NOT NULL,
 CONSTRAINT [PK_WordsHypernyms] PRIMARY KEY CLUSTERED 
(
	[Hypernym_ID] ASC,
	[Word_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WordsSynonyms]    Script Date: 24.08.2014 12:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordsSynonyms](
	[Word_ID] [int] NOT NULL,
	[Synonym_ID] [int] NOT NULL,
 CONSTRAINT [PK_WordsSynonyms] PRIMARY KEY CLUSTERED 
(
	[Word_ID] ASC,
	[Synonym_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([Language_ID], [Language]) VALUES (1, N'Bulgarian')
INSERT [dbo].[Languages] ([Language_ID], [Language]) VALUES (2, N'English')
INSERT [dbo].[Languages] ([Language_ID], [Language]) VALUES (3, N'Chinese')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([Word_ID], [Word], [Language_ID]) VALUES (1, N'Здравей', 1)
INSERT [dbo].[Words] ([Word_ID], [Word], [Language_ID]) VALUES (2, N'Ляво', 1)
INSERT [dbo].[Words] ([Word_ID], [Word], [Language_ID]) VALUES (3, N'House', 2)
INSERT [dbo].[Words] ([Word_ID], [Word], [Language_ID]) VALUES (4, N'Yard', 2)
INSERT [dbo].[Words] ([Word_ID], [Word], [Language_ID]) VALUES (5, N'afsfsd', 3)
INSERT [dbo].[Words] ([Word_ID], [Word], [Language_ID]) VALUES (6, N'xcbcvbcv', 3)
SET IDENTITY_INSERT [dbo].[Words] OFF
INSERT [dbo].[WordsSynonyms] ([Word_ID], [Synonym_ID]) VALUES (1, 1)
INSERT [dbo].[WordsSynonyms] ([Word_ID], [Synonym_ID]) VALUES (3, 2)
INSERT [dbo].[WordsSynonyms] ([Word_ID], [Synonym_ID]) VALUES (4, 3)
INSERT [dbo].[WordsSynonyms] ([Word_ID], [Synonym_ID]) VALUES (4, 4)
ALTER TABLE [dbo].[Antonyms]  WITH CHECK ADD  CONSTRAINT [FK_Antonyms_Words] FOREIGN KEY([Word_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[Antonyms] CHECK CONSTRAINT [FK_Antonyms_Words]
GO
ALTER TABLE [dbo].[Antonyms]  WITH CHECK ADD  CONSTRAINT [FK_Antonyms_Words1] FOREIGN KEY([Antonym_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[Antonyms] CHECK CONSTRAINT [FK_Antonyms_Words1]
GO
ALTER TABLE [dbo].[Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Explanations_Languages1] FOREIGN KEY([Language_ID])
REFERENCES [dbo].[Languages] ([Language_ID])
GO
ALTER TABLE [dbo].[Explanations] CHECK CONSTRAINT [FK_Explanations_Languages1]
GO
ALTER TABLE [dbo].[PartOfSpeeches]  WITH CHECK ADD  CONSTRAINT [FK_PartOfSpeeches_Words] FOREIGN KEY([Word_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[PartOfSpeeches] CHECK CONSTRAINT [FK_PartOfSpeeches_Words]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Words] FOREIGN KEY([Word_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Words]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Words1] FOREIGN KEY([Translation_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Words1]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages] FOREIGN KEY([Language_ID])
REFERENCES [dbo].[Languages] ([Language_ID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages]
GO
ALTER TABLE [dbo].[WordsExplanations]  WITH CHECK ADD  CONSTRAINT [FK_WordsExplanations_Explanations] FOREIGN KEY([Explanation_ID])
REFERENCES [dbo].[Explanations] ([Explanation_ID])
GO
ALTER TABLE [dbo].[WordsExplanations] CHECK CONSTRAINT [FK_WordsExplanations_Explanations]
GO
ALTER TABLE [dbo].[WordsExplanations]  WITH CHECK ADD  CONSTRAINT [FK_WordsExplanations_Words] FOREIGN KEY([Words_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[WordsExplanations] CHECK CONSTRAINT [FK_WordsExplanations_Words]
GO
ALTER TABLE [dbo].[WordsHypernyms]  WITH CHECK ADD  CONSTRAINT [FK_WordsHypernyms_Words] FOREIGN KEY([Hypernym_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[WordsHypernyms] CHECK CONSTRAINT [FK_WordsHypernyms_Words]
GO
ALTER TABLE [dbo].[WordsHypernyms]  WITH CHECK ADD  CONSTRAINT [FK_WordsHypernyms_Words1] FOREIGN KEY([Word_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[WordsHypernyms] CHECK CONSTRAINT [FK_WordsHypernyms_Words1]
GO
ALTER TABLE [dbo].[WordsSynonyms]  WITH CHECK ADD  CONSTRAINT [FK_WordsSynonyms_Words] FOREIGN KEY([Word_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[WordsSynonyms] CHECK CONSTRAINT [FK_WordsSynonyms_Words]
GO
ALTER TABLE [dbo].[WordsSynonyms]  WITH CHECK ADD  CONSTRAINT [FK_WordsSynonyms_Words1] FOREIGN KEY([Synonym_ID])
REFERENCES [dbo].[Words] ([Word_ID])
GO
ALTER TABLE [dbo].[WordsSynonyms] CHECK CONSTRAINT [FK_WordsSynonyms_Words1]
GO
USE [master]
GO
ALTER DATABASE [Dictionary] SET  READ_WRITE 
GO
