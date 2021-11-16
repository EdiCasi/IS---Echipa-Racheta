USE [ChallengeYouDatabase]
GO
/****** Object:  StoredProcedure [dbo].[getPost]    Script Date: 11/15/2021 9:56:45 PM ******/
DROP PROCEDURE [dbo].[getPost]
GO
/****** Object:  StoredProcedure [dbo].[createPost]    Script Date: 11/15/2021 9:56:45 PM ******/
DROP PROCEDURE [dbo].[createPost]
GO
/****** Object:  StoredProcedure [dbo].[getStatuses]    Script Date: 11/15/2021 1:58:03 PM ******/
DROP PROCEDURE [dbo].[getStatuses]
GO
/****** Object:  StoredProcedure [dbo].[changeUsername]    Script Date: 11/15/2021 1:58:03 PM ******/
DROP PROCEDURE [dbo].[changeUsername]
GO
/****** Object:  StoredProcedure [dbo].[changeStatus]    Script Date: 11/15/2021 1:58:03 PM ******/
DROP PROCEDURE [dbo].[changeStatus]
GO
/****** Object:  StoredProcedure [dbo].[changePassword]    Script Date: 11/15/2021 1:58:03 PM ******/
DROP PROCEDURE [dbo].[changePassword]
GO
/****** Object:  StoredProcedure [dbo].[changeEmail]    Script Date: 11/15/2021 1:58:03 PM ******/
DROP PROCEDURE [dbo].[changeEmail]
GO
ALTER TABLE [dbo].[Reaction] DROP CONSTRAINT [FK_USER_REACTION]
GO
ALTER TABLE [dbo].[Reaction] DROP CONSTRAINT [FK_POST_REACTION]
GO
ALTER TABLE [dbo].[Post] DROP CONSTRAINT [FK_USER_POST]
GO
ALTER TABLE [dbo].[PlatformUser] DROP CONSTRAINT [FK_USER_STATUS]
GO
ALTER TABLE [dbo].[Friendship] DROP CONSTRAINT [FK_USER_FRIENDSHIP2]
GO
ALTER TABLE [dbo].[Friendship] DROP CONSTRAINT [FK_USER_FRIENDSHIP1]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_USER_COMMENT]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_POST_COMMENT]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/15/2021 1:58:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
DROP TABLE [dbo].[Status]
GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 11/15/2021 1:58:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reaction]') AND type in (N'U'))
DROP TABLE [dbo].[Reaction]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 11/15/2021 1:58:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Post]') AND type in (N'U'))
DROP TABLE [dbo].[Post]
GO
/****** Object:  Table [dbo].[PlatformUser]    Script Date: 11/15/2021 1:58:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlatformUser]') AND type in (N'U'))
DROP TABLE [dbo].[PlatformUser]
GO
/****** Object:  Table [dbo].[Friendship]    Script Date: 11/15/2021 1:58:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Friendship]') AND type in (N'U'))
DROP TABLE [dbo].[Friendship]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/15/2021 1:58:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
DROP TABLE [dbo].[Comment]
GO
USE [master]
GO
/****** Object:  Database [ChallengeYouDatabase]    Script Date: 11/15/2021 1:58:03 PM ******/
DROP DATABASE [ChallengeYouDatabase]
GO
/****** Object:  Database [ChallengeYouDatabase]    Script Date: 11/15/2021 1:58:03 PM ******/
CREATE DATABASE [ChallengeYouDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChallengeYouDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChallengeYouDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChallengeYouDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChallengeYouDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChallengeYouDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChallengeYouDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChallengeYouDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChallengeYouDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChallengeYouDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChallengeYouDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChallengeYouDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [ChallengeYouDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [ChallengeYouDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChallengeYouDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChallengeYouDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChallengeYouDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChallengeYouDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChallengeYouDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChallengeYouDatabase', N'ON'
GO
ALTER DATABASE [ChallengeYouDatabase] SET QUERY_STORE = OFF
GO
USE [ChallengeYouDatabase]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[postId] [int] NULL,
	[creationDate] [date] NULL,
	[commentText] [varchar](500) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friendship]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friendship](
	[friendshipId] [int] IDENTITY(1,1) NOT NULL,
	[freind1Id] [int] NULL,
	[friend2Id] [int] NULL,
	[creationDate] [date] NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_Friendship] PRIMARY KEY CLUSTERED 
(
	[friendshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlatformUser]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlatformUser](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[username] [varchar](20) NULL,
	[pass] [varchar](20) NULL,
	[statusId] [int] NULL,
 CONSTRAINT [PK_PlatformUser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[creationDate] [date] NULL,
	[title] [varchar](20) NULL,
	[contentPost] [varbinary](max) NULL,
	[description] [varchar](1000) NULL,
	[reactions] [int] NULL,
	[postType] [varchar](20) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reaction](
	[reactionId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[postId] [int] NULL,
	[reactionType] [varchar](10) NULL,
 CONSTRAINT [PK_Reaction] PRIMARY KEY CLUSTERED 
(
	[reactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [varchar](20) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PlatformUser] ON 

INSERT [dbo].[PlatformUser] ([userId], [email], [username], [pass], [statusId]) VALUES (1, N'edi.herciu@gmail.com', N'Mirel', N'222222', 3)
SET IDENTITY_INSERT [dbo].[PlatformUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [statusName]) VALUES (1, N'Available')
INSERT [dbo].[Status] ([id], [statusName]) VALUES (2, N'Away')
INSERT [dbo].[Status] ([id], [statusName]) VALUES (3, N'Do not disturb')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_POST_COMMENT] FOREIGN KEY([postId])
REFERENCES [dbo].[Post] ([postId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_POST_COMMENT]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_USER_COMMENT] FOREIGN KEY([userId])
REFERENCES [dbo].[PlatformUser] ([userId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_USER_COMMENT]
GO
ALTER TABLE [dbo].[Friendship]  WITH CHECK ADD  CONSTRAINT [FK_USER_FRIENDSHIP1] FOREIGN KEY([freind1Id])
REFERENCES [dbo].[PlatformUser] ([userId])
GO
ALTER TABLE [dbo].[Friendship] CHECK CONSTRAINT [FK_USER_FRIENDSHIP1]
GO
ALTER TABLE [dbo].[Friendship]  WITH CHECK ADD  CONSTRAINT [FK_USER_FRIENDSHIP2] FOREIGN KEY([friend2Id])
REFERENCES [dbo].[PlatformUser] ([userId])
GO
ALTER TABLE [dbo].[Friendship] CHECK CONSTRAINT [FK_USER_FRIENDSHIP2]
GO
ALTER TABLE [dbo].[PlatformUser]  WITH CHECK ADD  CONSTRAINT [FK_USER_STATUS] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[PlatformUser] CHECK CONSTRAINT [FK_USER_STATUS]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_USER_POST] FOREIGN KEY([userId])
REFERENCES [dbo].[PlatformUser] ([userId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_USER_POST]
GO
ALTER TABLE [dbo].[Reaction]  WITH CHECK ADD  CONSTRAINT [FK_POST_REACTION] FOREIGN KEY([postId])
REFERENCES [dbo].[Post] ([postId])
GO
ALTER TABLE [dbo].[Reaction] CHECK CONSTRAINT [FK_POST_REACTION]
GO
ALTER TABLE [dbo].[Reaction]  WITH CHECK ADD  CONSTRAINT [FK_USER_REACTION] FOREIGN KEY([reactionId])
REFERENCES [dbo].[PlatformUser] ([userId])
GO
ALTER TABLE [dbo].[Reaction] CHECK CONSTRAINT [FK_USER_REACTION]
GO
/****** Object:  StoredProcedure [dbo].[changeEmail]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[changeEmail] @userId int,@email varchar(30)
AS
BEGIN
	UPDATE PlatformUser
	SET email=@email
	WHERE userId=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[changePassword]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[changePassword] @userId int,@password varchar(30)
AS
BEGIN
	UPDATE PlatformUser
	SET pass=@password
	WHERE userId=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[changeStatus]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[changeStatus] @userId int,@statusId int
AS
BEGIN
	UPDATE PlatformUser
	SET statusId=@statusId
	WHERE userId=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[changeUsername]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[changeUsername] @userId int,@username varchar(30)
AS
BEGIN
	UPDATE PlatformUser
	SET username=@username
	WHERE userId=@userId;
END
GO
/****** Object:  StoredProcedure [dbo].[getStatuses]    Script Date: 11/15/2021 1:58:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getStatuses]
AS
BEGIN
	SELECT id,statusName 
	FROM Status
END
GO
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 11/15/2021 9:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUser] @username varchar(30),@password varchar(30)
AS
BEGIN
	SELECT userId, email, username, statusId
	FROM  dbo.PlatformUser
	WHERE username=@username AND pass=@password
END
GO
/****** Object:  StoredProcedure [dbo].[getUserById]    Script Date: 11/15/2021 9:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUserById] @userId int
AS
BEGIN
	SELECT userId, email, username, statusId
	FROM  dbo.PlatformUser
	WHERE userId=@userId
END
GO
/****** Object:  StoredProcedure [dbo].[createPost]    Script Date: 11/15/2021 9:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createPost] @userId int, @creationDate date, @title varchar(20), @contentPost varbinary(MAX), @description varchar(1000), @reactions int, @postType varchar(20)
AS
BEGIN
	INSERT dbo.Post(userId,creationDate,title,contentPost,description,reactions,postType)
	VALUES (@userId,@creationDate,@title,@contentPost,@description,@reactions,@postType)
END
GO
/****** Object:  StoredProcedure [dbo].[getPost]    Script Date: 11/15/2021 9:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPost] @userId int
AS
BEGIN
	SELECT postId, userId, creationDate, title, contentPost, description, reactions, postType
	FROM  dbo.Post
	WHERE userId=@userId
END
GO
USE [master]
GO
ALTER DATABASE [ChallengeYouDatabase] SET  READ_WRITE 
GO
