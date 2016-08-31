USE [master]
GO
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'MNIS_V2')
ALTER DATABASE [MNIS_V2] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'MNIS_V2')
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'MNIS_V2'
GO
USE [master]
GO
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'MNIS_V2')
DROP DATABASE [MNIS_V2]
GO
USE [master]
GO
CREATE DATABASE [MNIS_V2] 
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MNIS_V2].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [MNIS_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MNIS_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MNIS_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MNIS_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MNIS_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [MNIS_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MNIS_V2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MNIS_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MNIS_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MNIS_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MNIS_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MNIS_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MNIS_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MNIS_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MNIS_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MNIS_V2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MNIS_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MNIS_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MNIS_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MNIS_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MNIS_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MNIS_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MNIS_V2] SET  READ_WRITE 
GO
ALTER DATABASE [MNIS_V2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MNIS_V2] SET  MULTI_USER 
GO
ALTER DATABASE [MNIS_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MNIS_V2] SET DB_CHAINING OFF 
GO