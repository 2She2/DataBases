USE [master]
GO
/****** Object:  Database [Universities]    Script Date: 24.08.2014 11:40:33 AM ******/
CREATE DATABASE [Universities]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Universities', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Universities.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Universities_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Universities_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Universities] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Universities].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Universities] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Universities] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Universities] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Universities] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Universities] SET ARITHABORT OFF 
GO
ALTER DATABASE [Universities] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Universities] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Universities] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Universities] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Universities] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Universities] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Universities] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Universities] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Universities] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Universities] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Universities] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Universities] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Universities] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Universities] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Universities] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Universities] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Universities] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Universities] SET RECOVERY FULL 
GO
ALTER DATABASE [Universities] SET  MULTI_USER 
GO
ALTER DATABASE [Universities] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Universities] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Universities] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Universities] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Universities] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Universities', N'ON'
GO
USE [Universities]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Course_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Department_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DepartmentsCourses]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentsCourses](
	[Department_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentsCourses] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DepartmentsProfessors]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentsProfessors](
	[Department_ID] [int] NOT NULL,
	[Professor_ID] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentsProfessors] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC,
	[Professor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Faculty_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[Faculty_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FacultiesDepartments]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultiesDepartments](
	[Faculty_ID] [int] NOT NULL,
	[Department_ID] [int] NOT NULL,
 CONSTRAINT [PK_FacultiesDepartments] PRIMARY KEY CLUSTERED 
(
	[Faculty_ID] ASC,
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Person_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonsCourses]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonsCourses](
	[Person_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_PersonsCourses] PRIMARY KEY CLUSTERED 
(
	[Person_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[Professor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[Professor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorsTitles]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorsTitles](
	[Professor_ID] [int] NOT NULL,
	[Title_ID] [int] NOT NULL,
 CONSTRAINT [PK_ProfessorsTitles] PRIMARY KEY CLUSTERED 
(
	[Professor_ID] ASC,
	[Title_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Student_ID] [int] NOT NULL,
	[Faculty_ID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titles]    Script Date: 24.08.2014 11:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[Title_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[Title_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DepartmentsCourses]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentsCourses_Courses] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Courses] ([Course_ID])
GO
ALTER TABLE [dbo].[DepartmentsCourses] CHECK CONSTRAINT [FK_DepartmentsCourses_Courses]
GO
ALTER TABLE [dbo].[DepartmentsCourses]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentsCourses_Departments] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Departments] ([Department_ID])
GO
ALTER TABLE [dbo].[DepartmentsCourses] CHECK CONSTRAINT [FK_DepartmentsCourses_Departments]
GO
ALTER TABLE [dbo].[DepartmentsProfessors]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentsProfessors_Departments] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Departments] ([Department_ID])
GO
ALTER TABLE [dbo].[DepartmentsProfessors] CHECK CONSTRAINT [FK_DepartmentsProfessors_Departments]
GO
ALTER TABLE [dbo].[DepartmentsProfessors]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentsProfessors_Professors] FOREIGN KEY([Professor_ID])
REFERENCES [dbo].[Professors] ([Professor_ID])
GO
ALTER TABLE [dbo].[DepartmentsProfessors] CHECK CONSTRAINT [FK_DepartmentsProfessors_Professors]
GO
ALTER TABLE [dbo].[FacultiesDepartments]  WITH CHECK ADD  CONSTRAINT [FK_FacultiesDepartments_Departments] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Departments] ([Department_ID])
GO
ALTER TABLE [dbo].[FacultiesDepartments] CHECK CONSTRAINT [FK_FacultiesDepartments_Departments]
GO
ALTER TABLE [dbo].[FacultiesDepartments]  WITH CHECK ADD  CONSTRAINT [FK_FacultiesDepartments_Faculties] FOREIGN KEY([Faculty_ID])
REFERENCES [dbo].[Faculties] ([Faculty_ID])
GO
ALTER TABLE [dbo].[FacultiesDepartments] CHECK CONSTRAINT [FK_FacultiesDepartments_Faculties]
GO
ALTER TABLE [dbo].[PersonsCourses]  WITH CHECK ADD  CONSTRAINT [FK_PersonsCourses_Courses] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Courses] ([Course_ID])
GO
ALTER TABLE [dbo].[PersonsCourses] CHECK CONSTRAINT [FK_PersonsCourses_Courses]
GO
ALTER TABLE [dbo].[PersonsCourses]  WITH CHECK ADD  CONSTRAINT [FK_PersonsCourses_Persons] FOREIGN KEY([Person_ID])
REFERENCES [dbo].[Persons] ([Person_ID])
GO
ALTER TABLE [dbo].[PersonsCourses] CHECK CONSTRAINT [FK_PersonsCourses_Persons]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Persons] FOREIGN KEY([Professor_ID])
REFERENCES [dbo].[Persons] ([Person_ID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Persons]
GO
ALTER TABLE [dbo].[ProfessorsTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorsTitles_Professors] FOREIGN KEY([Professor_ID])
REFERENCES [dbo].[Professors] ([Professor_ID])
GO
ALTER TABLE [dbo].[ProfessorsTitles] CHECK CONSTRAINT [FK_ProfessorsTitles_Professors]
GO
ALTER TABLE [dbo].[ProfessorsTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorsTitles_Titles] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[Titles] ([Title_ID])
GO
ALTER TABLE [dbo].[ProfessorsTitles] CHECK CONSTRAINT [FK_ProfessorsTitles_Titles]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Persons] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Persons] ([Person_ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Persons]
GO
USE [master]
GO
ALTER DATABASE [Universities] SET  READ_WRITE 
GO
