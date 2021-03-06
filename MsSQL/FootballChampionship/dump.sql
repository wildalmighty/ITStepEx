USE [master]
GO
/****** Object:  Database [FootballLeague]    Script Date: 19-Nov-16 12:44:39 ******/
CREATE DATABASE [FootballLeague]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FootballLeague', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FootballLeague.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FootballLeague_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FootballLeague_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FootballLeague] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FootballLeague].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FootballLeague] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FootballLeague] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FootballLeague] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FootballLeague] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FootballLeague] SET ARITHABORT OFF 
GO
ALTER DATABASE [FootballLeague] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FootballLeague] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FootballLeague] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FootballLeague] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FootballLeague] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FootballLeague] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FootballLeague] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FootballLeague] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FootballLeague] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FootballLeague] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FootballLeague] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FootballLeague] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FootballLeague] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FootballLeague] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FootballLeague] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FootballLeague] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FootballLeague] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FootballLeague] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FootballLeague] SET  MULTI_USER 
GO
ALTER DATABASE [FootballLeague] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FootballLeague] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FootballLeague] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FootballLeague] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FootballLeague] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FootballLeague', N'ON'
GO
ALTER DATABASE [FootballLeague] SET QUERY_STORE = OFF
GO
USE [FootballLeague]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FootballLeague]
GO
/****** Object:  Schema [Championship]    Script Date: 19-Nov-16 12:44:39 ******/
CREATE SCHEMA [Championship]
GO
/****** Object:  Schema [Club]    Script Date: 19-Nov-16 12:44:39 ******/
CREATE SCHEMA [Club]
GO
/****** Object:  Schema [Division]    Script Date: 19-Nov-16 12:44:39 ******/
CREATE SCHEMA [Division]
GO
/****** Object:  Table [Championship].[Divisions]    Script Date: 19-Nov-16 12:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Championship].[Divisions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Divisions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Championship].[Referees]    Script Date: 19-Nov-16 12:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Championship].[Referees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Club].[Managers]    Script Date: 19-Nov-16 12:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Club].[Managers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ClubId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Club].[Players]    Script Date: 19-Nov-16 12:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Club].[Players](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Salary] [int] NULL,
	[ClubId] [int] NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Division].[Clubs]    Script Date: 19-Nov-16 12:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Division].[Clubs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DivisionId] [int] NULL,
 CONSTRAINT [PK_Clubs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Division].[Matches]    Script Date: 19-Nov-16 12:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Division].[Matches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HomeClubId] [int] NOT NULL,
	[GuestClubId] [int] NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[HomeGoals] [smallint] NULL,
	[GuestGoals] [smallint] NULL,
	[FinalSign] [char](1) NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Division].[MatchScorers]    Script Date: 19-Nov-16 12:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Division].[MatchScorers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatchId] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
	[Minute] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [Championship].[Divisions] ON 

INSERT [Championship].[Divisions] ([Id], [Name]) VALUES (1, N'А Професионална футболна група')
INSERT [Championship].[Divisions] ([Id], [Name]) VALUES (2, N'Б Професионална футболна група')
SET IDENTITY_INSERT [Championship].[Divisions] OFF
SET IDENTITY_INSERT [Championship].[Referees] ON 

INSERT [Championship].[Referees] ([Id], [FirstName], [LastName]) VALUES (1, N'Теодора', N'Щерева')
INSERT [Championship].[Referees] ([Id], [FirstName], [LastName]) VALUES (2, N'Иван', N'Иванов')
SET IDENTITY_INSERT [Championship].[Referees] OFF
SET IDENTITY_INSERT [Club].[Managers] ON 

INSERT [Club].[Managers] ([Id], [FirstName], [LastName], [ClubId]) VALUES (1, N'Калин', N'Захариев', 1)
INSERT [Club].[Managers] ([Id], [FirstName], [LastName], [ClubId]) VALUES (2, N'Мария', N'Павлова', 1)
SET IDENTITY_INSERT [Club].[Managers] OFF
SET IDENTITY_INSERT [Club].[Players] ON 

INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (1, N'Петър', N'Маринов', NULL, 1)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (2, N'Николай', N'Дросев', NULL, 1)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (3, N'Иван', N'Керезов', NULL, 1)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (4, N'Крис', N'Йорданов', NULL, 1)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (5, N'Дани', N'Лазаров', NULL, 1)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (6, N'Диян', N'Георгиев', NULL, 2)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (7, N'Стоян', N'Петров', NULL, 2)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (8, N'Мартин', N'Кожухаров', NULL, 2)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (9, N'Симеон', N'Радев', NULL, 2)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (10, N'Васил', N'Тодоров', NULL, 2)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (11, N'Марин', N'Маринов', NULL, 3)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (12, N'Панчо', N'Владигеров', NULL, 3)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (13, N'Петко', N'Стоянов', NULL, 3)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (14, N'Иван', N'Кьосев', NULL, 3)
INSERT [Club].[Players] ([Id], [FirstName], [LastName], [Salary], [ClubId]) VALUES (15, N'Красимир', N'Чинтов', NULL, 3)
SET IDENTITY_INSERT [Club].[Players] OFF
SET IDENTITY_INSERT [Division].[Clubs] ON 

INSERT [Division].[Clubs] ([Id], [Name], [DivisionId]) VALUES (1, N'Пантерите', 1)
INSERT [Division].[Clubs] ([Id], [Name], [DivisionId]) VALUES (2, N'Тигрите', 1)
INSERT [Division].[Clubs] ([Id], [Name], [DivisionId]) VALUES (3, N'Гепардите', 1)
INSERT [Division].[Clubs] ([Id], [Name], [DivisionId]) VALUES (4, N'Кокошките', 2)
SET IDENTITY_INSERT [Division].[Clubs] OFF
SET IDENTITY_INSERT [Division].[Matches] ON 

INSERT [Division].[Matches] ([Id], [HomeClubId], [GuestClubId], [StartDate], [HomeGoals], [GuestGoals], [FinalSign]) VALUES (1, 1, 2, CAST(N'2016-10-10T18:00:00' AS SmallDateTime), 2, 1, N'1')
INSERT [Division].[Matches] ([Id], [HomeClubId], [GuestClubId], [StartDate], [HomeGoals], [GuestGoals], [FinalSign]) VALUES (2, 2, 1, CAST(N'2016-10-17T18:00:00' AS SmallDateTime), 3, 0, N'1')
INSERT [Division].[Matches] ([Id], [HomeClubId], [GuestClubId], [StartDate], [HomeGoals], [GuestGoals], [FinalSign]) VALUES (3, 3, 2, CAST(N'2016-11-04T17:00:00' AS SmallDateTime), 1, 3, N'2')
INSERT [Division].[Matches] ([Id], [HomeClubId], [GuestClubId], [StartDate], [HomeGoals], [GuestGoals], [FinalSign]) VALUES (4, 2, 3, CAST(N'2016-11-11T17:00:00' AS SmallDateTime), 1, 1, N'X')
INSERT [Division].[Matches] ([Id], [HomeClubId], [GuestClubId], [StartDate], [HomeGoals], [GuestGoals], [FinalSign]) VALUES (5, 1, 3, CAST(N'2016-12-10T16:00:00' AS SmallDateTime), 0, 1, N'2')
INSERT [Division].[Matches] ([Id], [HomeClubId], [GuestClubId], [StartDate], [HomeGoals], [GuestGoals], [FinalSign]) VALUES (7, 3, 1, CAST(N'2016-12-17T16:00:00' AS SmallDateTime), 2, 1, N'1')
SET IDENTITY_INSERT [Division].[Matches] OFF
SET IDENTITY_INSERT [Division].[MatchScorers] ON 

INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (1, 1, 2, 3)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (2, 1, 1, 38)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (3, 1, 7, 78)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (4, 2, 7, 23)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (5, 2, 9, 45)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (6, 2, 8, 90)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (7, 3, 11, 11)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (8, 3, 7, 19)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (9, 3, 8, 43)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (10, 3, 7, 74)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (11, 4, 13, 64)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (12, 4, 7, 88)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (13, 5, 12, 53)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (14, 7, 3, 7)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (15, 7, 11, 15)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (16, 7, 11, 17)
INSERT [Division].[MatchScorers] ([Id], [MatchId], [PlayerId], [Minute]) VALUES (17, 7, 11, 81)
SET IDENTITY_INSERT [Division].[MatchScorers] OFF
ALTER TABLE [Club].[Managers]  WITH CHECK ADD  CONSTRAINT [FK__Managers__ClubId__276EDEB3] FOREIGN KEY([ClubId])
REFERENCES [Division].[Clubs] ([Id])
GO
ALTER TABLE [Club].[Managers] CHECK CONSTRAINT [FK__Managers__ClubId__276EDEB3]
GO
ALTER TABLE [Club].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Clubs] FOREIGN KEY([ClubId])
REFERENCES [Division].[Clubs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Club].[Players] CHECK CONSTRAINT [FK_Players_Clubs]
GO
ALTER TABLE [Division].[Clubs]  WITH CHECK ADD  CONSTRAINT [FK_Clubs_Clubs] FOREIGN KEY([DivisionId])
REFERENCES [Championship].[Divisions] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Division].[Clubs] CHECK CONSTRAINT [FK_Clubs_Clubs]
GO
ALTER TABLE [Division].[Matches]  WITH CHECK ADD  CONSTRAINT [FK__Matches__GuestCl__31EC6D26] FOREIGN KEY([GuestClubId])
REFERENCES [Division].[Clubs] ([Id])
GO
ALTER TABLE [Division].[Matches] CHECK CONSTRAINT [FK__Matches__GuestCl__31EC6D26]
GO
ALTER TABLE [Division].[Matches]  WITH CHECK ADD  CONSTRAINT [FK__Matches__HomeClu__30F848ED] FOREIGN KEY([HomeClubId])
REFERENCES [Division].[Clubs] ([Id])
GO
ALTER TABLE [Division].[Matches] CHECK CONSTRAINT [FK__Matches__HomeClu__30F848ED]
GO
ALTER TABLE [Division].[MatchScorers]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [Club].[Players] ([Id])
GO
/****** Object:  StoredProcedure [Club].[GetPoints]    Script Date: 19-Nov-16 12:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Club].[GetPoints](@date smalldatetime)

AS
BEGIN

	SELECT c.Id, c.Name,
	 -- WINS
	 SUM(CASE WHEN 		
			(m.HomeGoals > m.GuestGoals AND c.Id = m.HomeClubId) -- HOME WIN!
			OR 		
			(m.GuestGoals > m.HomeGoals AND c.Id = m.GuestClubId) -- GUEST WIN!
		THEN 1 ELSE 0 
		END) as 'Wins',
	 -- Draws
	 SUM(
		CASE WHEN 
			m.HomeGoals = m.GuestGoals
		THEN 1 ELSE 0 
		END) as 'Draws',
	-- LOSES
	 SUM(
		CASE WHEN 
			(m.HomeGoals > m.GuestGoals AND c.Id = m.GuestClubId)
			OR 
			(m.GuestGoals > m.HomeGoals AND c.Id = m.HomeClubId)
		THEN 1 ELSE 0 
		END) as 'Loses',
	 COUNT(*) as 'All',
	 -- Points
	 SUM(
		CASE WHEN 
			(m.HomeGoals > m.GuestGoals AND c.Id = m.HomeClubId) -- HOME WIN!
			OR 
			(m.GuestGoals > m.HomeGoals AND c.Id = m.GuestClubId) -- GUEST WIN!
		THEN 3 ELSE 0 
		END)
	 +
	 SUM(
		CASE WHEN 
			m.HomeGoals = m.GuestGoals
		THEN 1 ELSE 0 
		END) as 'Points'

	 FROM Division.Matches AS m
	 JOIN Division.Clubs AS c ON (c.Id = m.HomeClubId OR c.Id = m.GuestClubId)
	 WHERE StartDate < @date
	 GROUP BY c.Name, c.Id
	 ORDER BY Wins DESC, Draws DESC, Name

END

GO
USE [master]
GO
ALTER DATABASE [FootballLeague] SET  READ_WRITE 
GO
