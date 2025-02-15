USE [master]
GO

/****** Object:  Database [Indispo]    Script Date: 15/03/2024 10:27:33 ******/
CREATE DATABASE [Indispo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Indispo', FILENAME = N'C:\Program Files\Microsoft SQL Server\data directories\Indispo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Indispo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\data directories\Indispo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Indispo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Indispo] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Indispo] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Indispo] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Indispo] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Indispo] SET ARITHABORT OFF 
GO

ALTER DATABASE [Indispo] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [Indispo] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Indispo] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Indispo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Indispo] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Indispo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Indispo] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Indispo] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Indispo] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Indispo] SET  ENABLE_BROKER 
GO

ALTER DATABASE [Indispo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Indispo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Indispo] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Indispo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Indispo] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Indispo] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Indispo] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Indispo] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Indispo] SET  MULTI_USER 
GO

ALTER DATABASE [Indispo] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Indispo] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Indispo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Indispo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Indispo] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Indispo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Indispo] SET QUERY_STORE = ON
GO

ALTER DATABASE [Indispo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [Indispo] SET  READ_WRITE 
GO





-- ajout des tables







USE [Indispo]
GO

/****** Object:  Table [dbo].[absence]    Script Date: 15/03/2024 12:23:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[absence](
	[id_absence] [int] IDENTITY(1,1) NOT NULL,
	[date_debut] [varchar](150) NULL,
	[date_fin] [varchar](150) NULL,
	[id_motif] [int] NULL,
	[exercice] [int] NULL,
	[mat_employe] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_absence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[absence]  WITH CHECK ADD FOREIGN KEY([id_motif])
REFERENCES [dbo].[direction] ([id_direction])
GO

ALTER TABLE [dbo].[absence]  WITH CHECK ADD FOREIGN KEY([mat_employe])
REFERENCES [dbo].[employe] ([matricule])
GO

