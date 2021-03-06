USE [master]
GO
/****** Object:  Database [CIE2Practice]    Script Date: 20-03-2022 10:35:30 PM ******/
CREATE DATABASE [CIE2Practice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CIE2Practice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CIE2Practice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CIE2Practice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CIE2Practice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CIE2Practice] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CIE2Practice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CIE2Practice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CIE2Practice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CIE2Practice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CIE2Practice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CIE2Practice] SET ARITHABORT OFF 
GO
ALTER DATABASE [CIE2Practice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CIE2Practice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CIE2Practice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CIE2Practice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CIE2Practice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CIE2Practice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CIE2Practice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CIE2Practice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CIE2Practice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CIE2Practice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CIE2Practice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CIE2Practice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CIE2Practice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CIE2Practice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CIE2Practice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CIE2Practice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CIE2Practice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CIE2Practice] SET RECOVERY FULL 
GO
ALTER DATABASE [CIE2Practice] SET  MULTI_USER 
GO
ALTER DATABASE [CIE2Practice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CIE2Practice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CIE2Practice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CIE2Practice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CIE2Practice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CIE2Practice] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CIE2Practice', N'ON'
GO
ALTER DATABASE [CIE2Practice] SET QUERY_STORE = OFF
GO
USE [CIE2Practice]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 20-03-2022 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[resume] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLeave]    Script Date: 20-03-2022 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeave](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reason] [text] NOT NULL,
	[fromdate] [date] NOT NULL,
	[todate] [date] NOT NULL,
	[leavetype] [varchar](50) NOT NULL,
	[empid] [int] NOT NULL,
 CONSTRAINT [PK_tblLeave] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([id], [name], [email], [password], [resume]) VALUES (1, N'Abhishek Choksi', N'19bmiit032@gmail.com', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'201906100110032.pdf')
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLeave] ON 

INSERT [dbo].[tblLeave] ([id], [reason], [fromdate], [todate], [leavetype], [empid]) VALUES (1, N'Covid''19', CAST(N'2022-03-20' AS Date), CAST(N'2022-03-25' AS Date), N'Casual', 1)
INSERT [dbo].[tblLeave] ([id], [reason], [fromdate], [todate], [leavetype], [empid]) VALUES (2, N'Merrage', CAST(N'2022-03-25' AS Date), CAST(N'2022-03-30' AS Date), N'Sick', 1)
SET IDENTITY_INSERT [dbo].[tblLeave] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_Display_EmployeeByEmailIDAndPassword]    Script Date: 20-03-2022 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Display_EmployeeByEmailIDAndPassword]
	@EmailID  VARCHAR(50),
	@Password VARCHAR(50)
AS
	SELECT * FROM tblEmployee WHERE email=@EmailID AND password=@Password
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Leave]    Script Date: 20-03-2022 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_Leave]
	@Reason text,
	@FromDate date,
	@ToDate date,
	@LeaveType varchar(50),
	@EmpID int
AS
BEGIN
	DECLARE @ID int
	SET @ID = 0

	INSERT INTO tblLeave (reason,fromdate,todate,leavetype,empid) VALUES  (@Reason,@FromDate,@ToDate,@LeaveType,@EmpID) SET @ID = SCOPE_IDENTITY()

	SELECT @ID AS LastInsertedID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Register_Employee]    Script Date: 20-03-2022 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Register_Employee]
	@Name varchar(50),
	@EmailID varchar(50),
	@Password varchar(50),
	@Resume varchar(50)
AS
BEGIN
	DECLARE @Count int
	DECLARE @RetrunCode int

	SELECT @Count = COUNT(email) FROM tblEmployee WHERE email=@EmailID
	
	IF @Count > 0
	BEGIN
		SET @RetrunCode = -1
	END
	ELSE
	BEGIN
		SET @RetrunCode = 1
		INSERT INTO tblEmployee (name,email,password,resume) VALUES (@Name,@EmailID,@Password,@Resume)
	END
	
	SELECT @RetrunCode AS RetunVal
END
GO
USE [master]
GO
ALTER DATABASE [CIE2Practice] SET  READ_WRITE 
GO
