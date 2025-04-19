USE [master]
GO
/****** Object:  Database [Reporting]    Script Date: 2024/08/06 21:22:09 ******/
CREATE DATABASE [Reporting]
 CONTAINMENT = NONE
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Reporting] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Reporting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Reporting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Reporting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Reporting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Reporting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Reporting] SET ARITHABORT OFF 
GO
ALTER DATABASE [Reporting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Reporting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Reporting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Reporting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Reporting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Reporting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Reporting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Reporting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Reporting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Reporting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Reporting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Reporting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Reporting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Reporting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Reporting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Reporting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Reporting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Reporting] SET RECOVERY FULL 
GO
ALTER DATABASE [Reporting] SET  MULTI_USER 
GO
ALTER DATABASE [Reporting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Reporting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Reporting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Reporting] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Reporting] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Reporting] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Reporting', N'ON'
GO
ALTER DATABASE [Reporting] SET QUERY_STORE = OFF
GO
USE [Reporting]
GO

/****** Object:  Table [dbo].[DashboardApiTokens]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardApiTokens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [text] NOT NULL,
	[DashboardId] [int] NOT NULL,
	[CreatedByDateTime] [datetime] NOT NULL,
	[CreatedByUserId] [int] NOT NULL,
	[ExpireDateTime] [datetime] NULL,
	[MaximumViewTimes] [int] NULL,
	[CurrentViewTimes] [int] NULL,
	[IP] [nvarchar](1000) NULL,
	[Islocked] [bit] NOT NULL,
	[ImpersonateUserId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DashboardRoles]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DashboardId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedByDateTime] [datetime] NOT NULL,
	[CreatedByUserId] [int] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_DashboardRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dashboards]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dashboards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Dashboard] [varchar](max) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreatedByDateTime] [datetime] NOT NULL,
	[CreatedByUserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ModifiedByDateTime] [datetime] NULL,
	[ModifiedByUserId] [int] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_Dashboards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[CreatedByDateTime] [datetime] NULL,
	[CreatedByUserId] [int] NULL,
	[ScreenName] [nvarchar](max) NULL,
	[IsLocked] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Icon] [nvarchar](100) NULL,
	[DisplayOrder] [int] NULL,
	[IsLocked] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_ReportDocuments]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_ReportDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NULL,
	[ReportDocumentId] [int] NULL,
	[CreatedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[IsLocked] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_SubReports]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_SubReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NULL,
	[SubReportId] [int] NULL,
	[CreatedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[IsLocked] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportColumnRename]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportColumnRename](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NOT NULL,
	[Column] [nvarchar](100) NOT NULL,
	[RenamedTo] [nvarchar](100) NULL,
	[IsLocked] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportDocuments]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Layout] [varbinary](max) NULL,
	[CreatedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[IsLocked] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_ReportDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportDropDownColumns]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportDropDownColumns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NULL,
	[Column] [nvarchar](100) NULL,
	[StoredProcedure] [nvarchar](max) NULL,
	[CreatedByDateTime] [datetime] NULL,
	[CreatedByUserId] [int] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_ReportDropDownColumns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportRoles]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NULL,
	[RoleId] [int] NULL,
	[CreatedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_ReportRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[StoredProcedure] [nvarchar](100) NULL,
	[AddStoredProcedure] [nvarchar](max) NULL,
	[EditStoredProcedure] [nvarchar](max) NULL,
	[DeleteStoredProcedure] [nvarchar](max) NULL,
	[IsDataExportAllowed] [bit] NOT NULL,
	[RowsPerPage] [int] NOT NULL,
	[SQLTimeout] [int] NULL,
	[CreatedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[LastModifiedByDateTime] [datetime] NULL,
	[LastModifiedByUserId] [int] NULL,
	[ShowSubReportAsPopup] [bit] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedByDateTime] [datetime] NULL,
	[CreatedByUserId] [int] NULL,
	[LastModifiedByUserId] [int] NULL,
	[LastModifiedByDateTime] [datetime] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageItem]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IsLocked] [bit] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[Layout] [varbinary](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_StorageItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMenu]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[LinkName] [nvarchar](100) NOT NULL,
	[Link] [nvarchar](100) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
	[IsLocked] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubReportColumnRename]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubReportColumnRename](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubReportId] [int] NOT NULL,
	[Column] [nvarchar](100) NOT NULL,
	[RenamedTo] [nvarchar](100) NULL,
	[IsLocked] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubReportDropDownColumns]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubReportDropDownColumns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubReportId] [int] NULL,
	[Column] [nvarchar](100) NULL,
	[StoredProcedure] [nvarchar](max) NULL,
	[CreatedByDateTime] [datetime] NULL,
	[CreatedByUserId] [int] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_SubReportDropDownColumns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubReports]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[StoredProcedure] [nvarchar](100) NULL,
	[AddStoredProcedure] [nvarchar](max) NULL,
	[EditStoredProcedure] [nvarchar](max) NULL,
	[DeleteStoredProcedure] [nvarchar](max) NULL,
	[IsDataExportAllowed] [bit] NOT NULL,
	[RowsPerPage] [int] NOT NULL,
	[SQLTimeout] [int] NULL,
	[LastModifiedByUserId] [int] NULL,
	[LastModifiedByDateTime] [datetime] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_SubReports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UserIPs]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserIPs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IP] [nvarchar](1000) NOT NULL,
	[CreatedByDateTime] [datetime] NOT NULL,
	[CreatedByUserId] [int] NOT NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_UserIPs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[EventTypeId] [nvarchar](50) NULL,
	[IP] [nvarchar](1000) NULL,
	[CreatedByDateTime] [datetime] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[CreatedByUserId] [int] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserCaption] [nvarchar](50) NOT NULL,
	[ExpireDate] [datetime] NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastModifiedByUserId] [int] NULL,
	[LastModifiedByDateTime] [datetime] NULL,
	[IsAdmin] [bit] NULL,
	[UpdatePassword] [bit] NULL,
	[IsLocked] [bit] NULL,
	[LastPasswordModifiedByDateTime] [datetime] NULL,
	[LastPasswordModifiedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NOT NULL,
	[CreatedByUserId] [int]  NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerticalReportRoles]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerticalReportRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NULL,
	[RoleId] [int] NULL,
	[CreatedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_VerticalReportRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerticalReports]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerticalReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[StoredProcedure] [nvarchar](100) NULL,
	[RowsPerPage] [int] NOT NULL,
	[SQLTimeout] [int] NULL,
	[ReportCategoryId] [int] NULL,
	[CreatedByUserId] [int] NULL,
	[CreatedByDateTime] [datetime] NULL,
	[LastModifiedByDateTime] [datetime] NULL,
	[LastModifiedByUserId] [int] NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_VertialReports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XPObjectType]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPObjectType](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeName] [nvarchar](254) NULL,
	[AssemblyName] [nvarchar](254) NULL,
 CONSTRAINT [PK_XPObjectType] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DashboardRoles] ON 
GO

SET IDENTITY_INSERT [dbo].[DashboardRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Dashboards] ON 
GO

SET IDENTITY_INSERT [dbo].[Dashboards] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([Id], [Name], [Icon], [DisplayOrder], [IsLocked]) VALUES (10, N'Reports', N'~/Content/Images/Menu/report.png', 2, NULL)
GO
INSERT [dbo].[Menu] ([Id], [Name], [Icon], [DisplayOrder], [IsLocked]) VALUES (11, N'VerticalReport', N'~/Content/Images/Menu/report.png', 8, NULL)
GO
INSERT [dbo].[Menu] ([Id], [Name], [Icon], [DisplayOrder], [IsLocked]) VALUES (1, N'Settings', N'~/Content/Images/Menu/settings.png', 1, NULL)
GO
INSERT [dbo].[Menu] ([Id], [Name], [Icon], [DisplayOrder], [IsLocked]) VALUES (2, N'User Settings', N'~/Content/Images/Menu/user-settings.png', 1, NULL)
GO
INSERT [dbo].[Menu] ([Id], [Name], [Icon], [DisplayOrder], [IsLocked]) VALUES (5, N'ErrorLog', N'~/Content/Images/Menu/warning.png', 6, NULL)
GO
INSERT [dbo].[Menu] ([Id], [Name], [Icon], [DisplayOrder], [IsLocked]) VALUES (6, N'MyProfile', N'~/Content/Images/Menu/user.png', 4, 0)
GO
INSERT [dbo].[Menu] ([Id], [Name], [Icon], [DisplayOrder], [IsLocked]) VALUES (9, N'How To Use...', N'~/Content/Images/Learning.png', 7, NULL)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Report_SubReports] ON 
GO

GO
SET IDENTITY_INSERT [dbo].[Report_SubReports] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportDocuments] ON 
GO

GO
SET IDENTITY_INSERT [dbo].[ReportDocuments] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportRoles] ON 
GO

GO
SET IDENTITY_INSERT [dbo].[ReportRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Reports] ON 
GO

GO
SET IDENTITY_INSERT [dbo].[Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[StorageItem] ON 
GO

GO
SET IDENTITY_INSERT [dbo].[StorageItem] OFF
GO
SET IDENTITY_INSERT [dbo].[SubMenu] ON 
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (27, 1, N'Menu', N'~/MenuSetUp', 1, NULL, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (29, 1, N'Role', N'~/RoleSetup', 1, 1, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (30, 1, N'Report Document', N'~/ReportDocumentSetup', 1, 1, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (1, 1, N'Report  ', N'~/ReportSetup', 1, 2, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (2, 1, N'Sub Report ', N'~/SubReportSetup', 1, 1, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (24, 9, N'How To Use', N'~/SystemDocumentation', 0, NULL, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (4, 1, N'User', N'~/User', 1, NULL, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (10, 5, N'ErrorLog', N'~/ErrorLog', 1, NULL, 1)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (11, 6, N'MyProfile', N'~/MyProfile', 0, NULL, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (12, 1, N'Vertical Report', N'~/VerticalReportSetup', 1, 4, NULL)
GO
INSERT [dbo].[SubMenu] ([Id], [MenuId], [LinkName], [Link], [IsAdmin], [DisplayOrder], [IsLocked]) VALUES (19, 1, N'Dashboard', N'~/DashboardSetup', 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[SubMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[SubReports] ON 
GO

SET IDENTITY_INSERT [dbo].[SubReports] OFF
GO

SET IDENTITY_INSERT [dbo].[UserRoles] ON 
GO

SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO

SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[XPObjectType] ON 
GO
SET IDENTITY_INSERT [dbo].[XPObjectType] OFF
GO
/****** Object:  Index [UC_DRoles]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[DashboardRoles] ADD  CONSTRAINT [UC_DRoles] UNIQUE NONCLUSTERED 
(
	[DashboardId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_DashboardName]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[Dashboards] ADD  CONSTRAINT [UC_DashboardName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Menu_Name]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [UC_Menu_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_ReportReportDocument]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[Report_ReportDocuments] ADD  CONSTRAINT [UC_ReportReportDocument] UNIQUE NONCLUSTERED 
(
	[ReportDocumentId] ASC,
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_ReportSubReport]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[Report_SubReports] ADD  CONSTRAINT [UC_ReportSubReport] UNIQUE NONCLUSTERED 
(
	[SubReportId] ASC,
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_ReportColumnRename]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[ReportColumnRename] ADD  CONSTRAINT [UC_ReportColumnRename] UNIQUE NONCLUSTERED 
(
	[ReportId] ASC,
	[Column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_ReportDocumentName]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[ReportDocuments] ADD  CONSTRAINT [UC_ReportDocumentName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_ReportDocuments]    Script Date: 2024/08/06 21:22:10 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_ReportDocuments] ON [dbo].[ReportDocuments]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_ReportDropDownColumns]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[ReportDropDownColumns] ADD  CONSTRAINT [UC_ReportDropDownColumns] UNIQUE NONCLUSTERED 
(
	[ReportId] ASC,
	[Column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UCReport_Roles]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[ReportRoles] ADD  CONSTRAINT [UCReport_Roles] UNIQUE NONCLUSTERED 
(
	[ReportId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_ReportName]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[Reports] ADD  CONSTRAINT [UC_ReportName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Name]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [UC_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_StorageItem]    Script Date: 2024/08/06 21:22:10 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_StorageItem] ON [dbo].[StorageItem]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Sub_Menu_LinkName]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[SubMenu] ADD  CONSTRAINT [UC_Sub_Menu_LinkName] UNIQUE NONCLUSTERED 
(
	[LinkName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_SubReportColumnRename]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[SubReportColumnRename] ADD  CONSTRAINT [UC_SubReportColumnRename] UNIQUE NONCLUSTERED 
(
	[SubReportId] ASC,
	[Column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_SubReportDropDownColumns]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[SubReportDropDownColumns] ADD  CONSTRAINT [UC_SubReportDropDownColumns] UNIQUE NONCLUSTERED 
(
	[SubReportId] ASC,
	[Column] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_SubReportName]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[SubReports] ADD  CONSTRAINT [UC_SubReportName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Roles]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [UC_Roles] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_CallByName]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UC_CallByName] UNIQUE NONCLUSTERED 
(
	[UserCaption] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Email]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UC_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UCVerticalReport_Roles]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[VerticalReportRoles] ADD  CONSTRAINT [UCVerticalReport_Roles] UNIQUE NONCLUSTERED 
(
	[ReportId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_VerticalReportName]    Script Date: 2024/08/06 21:22:10 ******/
ALTER TABLE [dbo].[VerticalReports] ADD  CONSTRAINT [UC_VerticalReportName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [iTypeName_XPObjectType]    Script Date: 2024/08/06 21:22:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iTypeName_XPObjectType] ON [dbo].[XPObjectType]
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dashboards] ADD  CONSTRAINT [DF_Dashboards_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Reports] ADD  CONSTRAINT [DF_Reports_RowsPerPage]  DEFAULT ((25)) FOR [RowsPerPage]
GO
ALTER TABLE [dbo].[SubReports] ADD  CONSTRAINT [DF_SubReports_RowsPerPage]  DEFAULT ((25)) FOR [RowsPerPage]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UpdatePassword]  DEFAULT ((1)) FOR [UpdatePassword]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedByDateDate]  DEFAULT (getdate()) FOR [CreatedByDateTime]
GO
ALTER TABLE [dbo].[VerticalReports] ADD  CONSTRAINT [DF_VerticalReports_RowsPerPage]  DEFAULT ((25)) FOR [RowsPerPage]
GO
ALTER TABLE [dbo].[DashboardRoles]  WITH CHECK ADD  CONSTRAINT [FK_Dashboard_Id] FOREIGN KEY([DashboardId])
REFERENCES [dbo].[Dashboards] ([ID])
GO
ALTER TABLE [dbo].[DashboardRoles] CHECK CONSTRAINT [FK_Dashboard_Id]
GO
ALTER TABLE [dbo].[Report_ReportDocuments]  WITH CHECK ADD  CONSTRAINT [FK__Report_ReportDocuments__CreatedByUserID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Report_ReportDocuments] CHECK CONSTRAINT [FK__Report_ReportDocuments__CreatedByUserID]
GO
ALTER TABLE [dbo].[Report_ReportDocuments]  WITH CHECK ADD  CONSTRAINT [FK__Report_ReportDocuments__ReportDocumentID] FOREIGN KEY([ReportDocumentId])
REFERENCES [dbo].[ReportDocuments] ([Id])
GO
ALTER TABLE [dbo].[Report_ReportDocuments] CHECK CONSTRAINT [FK__Report_ReportDocuments__ReportDocumentID]
GO
ALTER TABLE [dbo].[Report_ReportDocuments]  WITH CHECK ADD  CONSTRAINT [FK__Report_ReportDocuments__ReportID] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Reports] ([Id])
GO
ALTER TABLE [dbo].[Report_ReportDocuments] CHECK CONSTRAINT [FK__Report_ReportDocuments__ReportID]
GO
ALTER TABLE [dbo].[Report_SubReports]  WITH CHECK ADD  CONSTRAINT [FK__Report_SubReports__CreatedByUserID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Report_SubReports] CHECK CONSTRAINT [FK__Report_SubReports__CreatedByUserID]
GO
ALTER TABLE [dbo].[Report_SubReports]  WITH CHECK ADD  CONSTRAINT [FK__Report_SubReports__ReportID] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Reports] ([Id])
GO
ALTER TABLE [dbo].[Report_SubReports] CHECK CONSTRAINT [FK__Report_SubReports__ReportID]
GO
ALTER TABLE [dbo].[Report_SubReports]  WITH CHECK ADD  CONSTRAINT [FK__Report_SubReports__SubReportID] FOREIGN KEY([SubReportId])
REFERENCES [dbo].[SubReports] ([Id])
GO
ALTER TABLE [dbo].[Report_SubReports] CHECK CONSTRAINT [FK__Report_SubReports__SubReportID]
GO
ALTER TABLE [dbo].[ReportDropDownColumns]  WITH CHECK ADD  CONSTRAINT [FK__ReportDropDownColumns__ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Reports] ([Id])
GO
ALTER TABLE [dbo].[ReportDropDownColumns] CHECK CONSTRAINT [FK__ReportDropDownColumns__ReportId]
GO
ALTER TABLE [dbo].[ReportDropDownColumns]  WITH CHECK ADD  CONSTRAINT [FK__ReportDropDownColumns__USERID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReportDropDownColumns] CHECK CONSTRAINT [FK__ReportDropDownColumns__USERID]
GO
ALTER TABLE [dbo].[ReportRoles]  WITH CHECK ADD  CONSTRAINT [FK__ReportRoles__ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Reports] ([Id])
GO
ALTER TABLE [dbo].[ReportRoles] CHECK CONSTRAINT [FK__ReportRoles__ReportId]
GO
ALTER TABLE [dbo].[ReportRoles]  WITH CHECK ADD  CONSTRAINT [FK__ReportRoles__ROLEID] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[ReportRoles] CHECK CONSTRAINT [FK__ReportRoles__ROLEID]
GO
ALTER TABLE [dbo].[ReportRoles]  WITH CHECK ADD  CONSTRAINT [FK__ReportRoles__USERID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReportRoles] CHECK CONSTRAINT [FK__ReportRoles__USERID]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK__Reports__USERID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK__Reports__USERID]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK__Roles__USERID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK__Roles__USERID]
GO
ALTER TABLE [dbo].[SubReportDropDownColumns]  WITH CHECK ADD  CONSTRAINT [FK__SubReportDropDownColumns__SubReportId] FOREIGN KEY([SubReportId])
REFERENCES [dbo].[SubReports] ([Id])
GO
ALTER TABLE [dbo].[SubReportDropDownColumns] CHECK CONSTRAINT [FK__SubReportDropDownColumns__SubReportId]
GO
ALTER TABLE [dbo].[SubReportDropDownColumns]  WITH CHECK ADD  CONSTRAINT [FK__SubReportDropDownColumns__USERID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SubReportDropDownColumns] CHECK CONSTRAINT [FK__SubReportDropDownColumns__USERID]
GO
ALTER TABLE [dbo].[UserIPs]  WITH CHECK ADD  CONSTRAINT [FK__UserIPs__CreatedByUserId] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserIPs] CHECK CONSTRAINT [FK__UserIPs__CreatedByUserId]
GO
ALTER TABLE [dbo].[UserIPs]  WITH CHECK ADD  CONSTRAINT [FK__UserIPs__UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserIPs] CHECK CONSTRAINT [FK__UserIPs__UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserRoles__CreatedByUserId] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK__UserRoles__CreatedByUserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserRoles__RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK__UserRoles__RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserRoles__UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK__UserRoles__UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__CreatedByUserId] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__CreatedByUserId]
GO
ALTER TABLE [dbo].[VerticalReportRoles]  WITH CHECK ADD  CONSTRAINT [FK__VerticalReportRoles__ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[VerticalReports] ([Id])
GO
ALTER TABLE [dbo].[VerticalReportRoles] CHECK CONSTRAINT [FK__VerticalReportRoles__ReportId]
GO
ALTER TABLE [dbo].[VerticalReportRoles]  WITH CHECK ADD  CONSTRAINT [FK__VerticalReportRoles__ROLEID] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[VerticalReportRoles] CHECK CONSTRAINT [FK__VerticalReportRoles__ROLEID]
GO
ALTER TABLE [dbo].[VerticalReportRoles]  WITH CHECK ADD  CONSTRAINT [FK__VerticalReportRoles__USERID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[VerticalReportRoles] CHECK CONSTRAINT [FK__VerticalReportRoles__USERID]
GO
ALTER TABLE [dbo].[VerticalReports]  WITH CHECK ADD  CONSTRAINT [FK__VerticalReports__USERID] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[VerticalReports] CHECK CONSTRAINT [FK__VerticalReports__USERID]
GO
/****** Object:  StoredProcedure [dbo].[stp_DashboardApiTokens_Add]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE  [dbo].[stp_DashboardApiTokens_Add] 
   @userid int = 0,
  	@token text,
	@MaximumViewTimes  int = null,
	@ExpireDateTime datetime = null,
    @IP nvarchar(max) = null,
	@ImpersonateUserId int = null,
	@DashboardId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	insert into DashboardApiTokens (DashboardId,Token,MaximumViewTimes,ExpireDateTime,[IP],ImpersonateUserId,CreatedByUserId,CreatedByDateTime,Islocked) 
	                           values (@DashboardId,@Token,@MaximumViewTimes,@ExpireDateTime,@IP,@ImpersonateUserId,@userid,getdate(),0)
         

END
GO
/****** Object:  StoredProcedure [dbo].[stp_DashboardApiTokens_Update]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_DashboardApiTokens_Update]  
  
	@id  int,
	@token text,
	@maximumViewTimes  int = null,
	@expireDateTime datetime = null,
    @IP nvarchar(max) = null,
	@userid  int,
	@ImpersonateUserId int = null
AS
BEGIN
 
	SET NOCOUNT ON;

  
      update   DashboardApiTokens  set 
	          [token] = @token,
			  [MaximumViewTimes] = @maximumViewTimes ,
			  [expireDateTime] = @expireDateTime,
			  [IP] = @IP,
			  ImpersonateUserId = @ImpersonateUserId
	  where id = @id  and isnull(islocked,0) != 1
  

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Dashboards_Add]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Dashboards_Add]  
  
	@UserId  int,
	@Name nvarchar(225),
	@IsActive bit,
	@Dashboard nvarchar(max)
 
AS
BEGIN
 
	SET NOCOUNT ON;

	insert into Dashboards ([Name], [Dashboard],[CreatedByDateTime],[CreatedByUserId],[IsActive],[ModifiedByDateTime],[ModifiedByUserId])
           values (@Name,@Dashboard ,GETDATE(),@userid,1,null,null)
 
 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Dashboards_Delete]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Dashboards_Delete]  
  
	@id  int,
	@userid int
 
AS
BEGIN
 
	SET NOCOUNT ON;
	
    delete  DashboardRoles    where DashboardId = @Id and isnull(islocked,0) != 1 
    delete  Dashboards   where id = @id  and isnull(islocked,0) != 1
  

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Dashboards_GetById]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Dashboards_GetById]  
		 	        @id int,
					@userid int
                    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 select * from Dashboards where id = @id

 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Dashboards_GetByUserId]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Dashboards_GetByUserId]  
  
	@UserId  int
 
AS
BEGIN
 
	SET NOCOUNT ON;

	if exists(select 1 from Users u where u.IsAdmin = 1 and u.Id = @UserId)
	begin

	  	 select *, 
	       cast (1 as bit) as CanEdit 
	      from Dashboards  d 
		    where IsActive = 1
		  order by [Name]
	end
	else 
	begin

	 select distinct *,
	        case when exists( select 1   from DashboardRoles drc  inner join UserRoles urc on urc.RoleId = drc.RoleId and urc.UserId = @UserId and drc.DashboardId = d.ID and drc.CanEdit = 1 )
			 then  cast (1 as bit) else  cast (0 as bit) end as CanEdit
		from Dashboards  d 
	          where  IsActive = 1 and d.ID in (select dashboardid from DashboardRoles dr  inner join UserRoles ur on ur.RoleId = dr.RoleId and ur.UserId = @UserId )
		  order by [Name]
	End

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Dashboards_GetDafaultByUserId]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Dashboards_GetDafaultByUserId]  
		 	     
					@userid int
                    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 select top 1 * from Dashboards where (id =  (select top 1 DashboardId from DashboardRoles dr inner join Roles r on r.Id = dr.RoleId join UserRoles ur on ur.RoleId = r.Id and ur.UserId = @userid ) or exists (select id from users where  id= @userid and IsAdmin = 1))
	  and Dashboard is not null

 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Dashboards_Update]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Dashboards_Update]  
  
	@id  int,
	@name nvarchar(100),
	@userid int,
	@isactive  bit
 
AS
BEGIN
 
	SET NOCOUNT ON;

 

 update   Dashboards  set [name] = @name, ModifiedByUserId = @userid, ModifiedByDateTime = GetDate(),
            isactive = @isactive where id = @id  and isnull(islocked,0) != 1
 
  
 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Menu_GetByUserId]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[stp_Menu_GetByUserId]  
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	select distinct * from 
	(

    select m.Id,
	       mg.Name as MenuGroup,
		   m.LinkName,
		   m.Link,
		   mg.Icon as ImageUrl,
		   mg.DisplayOrder
	  from SubMenu m
	      inner join Menu mg on mg.Id = m.MenuId
		  where exists(select 1 from Users us where id = @UserId and  us.IsAdmin = 1) or m.IsAdmin = 0

	 union

	 select r.Id,
	       mg.Name as MenuGroup,
		   r.Name,
		   concat('~/ReportData?id=', r.Id),
		   mg.Icon as ImageUrl,
		   mg.DisplayOrder
       from Menu mg CROSS JOIN
	    Reports r
		    inner join [ReportRoles] rr on rr.ReportId = r.Id
		    inner join UserRoles ur on ur.RoleId = rr.RoleId
			where ur.UserId = @UserId and r.IsActive = 1 and mg.Id = 10

			union

	  select 
	       r.Id,
	        mg.Name as MenuGroup,
		   r.Name,
		   concat('~/VerticalReportData?id=', r.Id),
		   mg.Icon as ImageUrl,
		   mg.DisplayOrder
		   from Menu mg CROSS JOIN
	         VerticalReports r
		    inner join [VerticalReportRoles] rr on rr.ReportId = r.Id
		    inner join UserRoles ur on ur.RoleId = rr.RoleId
			where ur.UserId = @UserId   and r.IsActive = 1 and mg.id = 11
		   
	)sub 
	 order by sub.DisplayOrder


END
GO
/****** Object:  StoredProcedure [dbo].[stp_Reports_Add]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Reports_Add]  
		 	        @Name nvarchar(255),
                    @StoredProcedure nvarchar(max), 
                    @IsActive nvarchar(max),
                    @IsDataExportAllowed nvarchar(max) ,
                    @SQLTimeout nvarchar(max) ,
                    @RowsPerPage nvarchar(max) ,
                    @UserId nvarchar(max),
					@CreatedDateTime nvarchar(max),
					@ShowSubReportAsPopup bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 insert into Reports 
	 ( 
	                [Name],
                    StoredProcedure,
                    IsActive, 
                    IsDataExportAllowed, 
                    SQLTimeout, 
                    RowsPerPage, 
                    CreatedByUserId,
					CreatedByDateTime,
					ShowSubReportAsPopup)
	 values ( 
	 	            @Name,
                    @StoredProcedure,
                    @IsActive,  
                    @IsDataExportAllowed, 
                    @SQLTimeout, 
                    @RowsPerPage, 
                    @UserId,
					@CreatedDateTime,
					@ShowSubReportAsPopup)

 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Reports_Delete]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Reports_Delete]  
	 @Id int,
	 @userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  delete from Report_SubReports     where ReportId = @Id and isnull(islocked,0) != 1
	  delete from ReportRoles           where ReportId = @Id and isnull(islocked,0) != 1
	  delete from ReportDropDownColumns where ReportId = @Id and isnull(islocked,0) != 1
	  delete from ReportColumnRename    where ReportId = @Id and isnull(islocked,0) != 1
	  delete from Reports               where id = @Id       and isnull(islocked,0) != 1

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Reports_Update]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Reports_Update]  
		 	        @Name nvarchar(max),
                    @StoredProcedure nvarchar(max), 
                    @IsActive nvarchar(max),
                    @IsDataExportAllowed nvarchar(max) ,
                    @SQLTimeout nvarchar(max) ,
                    @RowsPerPage nvarchar(max) ,
                    @UserId nvarchar(max),
					@Id int,
					@ShowSubReportAsPopup bit 
		 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Reports 
	   set
	                [Name] =  @Name,
                    StoredProcedure =  @StoredProcedure,
                    IsActive =  @IsActive ,
                    IsDataExportAllowed = @IsDataExportAllowed ,
                    SQLTimeout =  @SQLTimeout,
                    RowsPerPage =  @RowsPerPage,
					LastModifiedByUserId = @UserId,
					LastModifiedByDateTime = GETDATE(),
					ShowSubReportAsPopup = 	@ShowSubReportAsPopup  
			 where id = @Id  and isnull(islocked,0) != 1
	 

 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_SubReports_Add]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_SubReports_Add]  
		 	        @Name nvarchar(max),
                    @StoredProcedure nvarchar(max), 
                    @IsActive nvarchar(max),
                    @IsDataExportAllowed nvarchar(max) ,
                    @SQLTimeout nvarchar(max) ,
                    @RowsPerPage nvarchar(max) ,
                    @UserId nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 insert into SubReports 
	 ( 
	                [Name],
                    StoredProcedure,
                    IsActive, 
                    IsDataExportAllowed, 
                    SQLTimeout, 
                    RowsPerPage, 
                    CreatedByUserId,
					CreatedByDateTime)
	 values ( 
	 	            @Name,
                    @StoredProcedure,
                    @IsActive, 
                    @IsDataExportAllowed, 
                    @SQLTimeout, 
                    @RowsPerPage, 
                    @UserId,
					Getdate())

 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_SubReports_Update]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_SubReports_Update]  
		 	        @Name nvarchar(max),
                    @StoredProcedure nvarchar(max), 
                    @IsActive nvarchar(max),
                    @IsDataExportAllowed nvarchar(max) ,
                    @SQLTimeout nvarchar(max) ,
                    @RowsPerPage nvarchar(max) ,
                    @UserId nvarchar(max),
					@Id nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SubReports 
	   set
	                [Name] =  @Name,
                    StoredProcedure =  @StoredProcedure,
                    IsActive =  @IsActive ,
                    IsDataExportAllowed = @IsDataExportAllowed ,
                    SQLTimeout =  @SQLTimeout,
                    RowsPerPage =  @RowsPerPage,
					LastModifiedByUserId = @UserId,
					LastModifiedByDateTime = GETDATE()
			 where id = @Id  and isnull(islocked,0) != 1
	 

 

END
GO


 
CREATE   PROCEDURE [dbo].[stp_Users_Delete]  
	 @Id nvarchar(max),
	 @userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 delete    UserRoles   where UserId = @id  and isnull(islocked,0) != 1;
	 delete    UserIPs where UserId = @id  and isnull(islocked,0) != 1;
	 delete    UserLogins where UserId = @id  and isnull(islocked,0) != 1;
     delete    Users   where id = @id  and isnull(islocked,0) != 1;
END
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_GetAll]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Users_GetAll]  
	 @UserId  int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from   Users   

END
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_Update]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Users_Update]  
	 @Id int,
	 @LastName nvarchar(50),
	 @FirstName nvarchar(50),
     @Email  nvarchar(100),
     @ExpireDate  datetime = null,
	 @UserCaption nvarchar(50),
     @IsAdmin  bit = null,
	 @UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  update users set LastName = @LastName, 
	                  FirstName = @FirstName,
					  Email = @email,
					  [ExpireDate] = @ExpireDate,
					  IsAdmin = @IsAdmin,
					  UserCaption = @UserCaption
					  where id = @Id  and isnull(islocked,0) != 1;  
					  
END
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_UpdateAnotherPersonsPassword]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE   PROCEDURE [dbo].[stp_Users_UpdateAnotherPersonsPassword]  
   @userid int,
   @password  nvarchar(1000),
   @adminpassword  nvarchar(1000),
   @adminId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update dbo.users set [password] = @password,LastPasswordModifiedByDateTime = getDate(), LastPasswordModifiedByUserId = @adminId, UpdatePassword = 1 where    isnull(islocked,0) != 1 and id = @userid and exists (select 1 from users where [password] = @adminpassword  and id = @adminId )
					  
END
GO
/****** Object:  StoredProcedure [dbo].[stp_VerticalReports_Add]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[stp_VerticalReports_Add]  
		 	        @Name nvarchar(max),
                    @StoredProcedure nvarchar(max), 
                    @IsActive nvarchar(max),
                    @SQLTimeout nvarchar(max) ,
                    @RowsPerPage nvarchar(max) ,
                    @UserId nvarchar(max),
					@CreatedDateTime nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 insert into VerticalReports 
	 ( 
	                [Name],
                    StoredProcedure,
                    IsActive, 
                    SQLTimeout, 
                    RowsPerPage, 
                    CreatedByUserId,
					CreatedByDateTime)
	 values ( 
	 	            @Name,
                    @StoredProcedure,
                    @IsActive, 
                    @SQLTimeout, 
                    @RowsPerPage, 
                    @UserId,
					@CreatedDateTime)

 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_VerticalReports_Delete]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
CREATE   PROCEDURE [dbo].[stp_VerticalReports_Delete] 
     @Id  int,
	 @UserId  int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 delete from VerticalReportRoles    where ReportId = @Id and isnull(islocked,0) != 1 
     delete from VerticalReports where id = @Id  and isnull(islocked,0) != 1 

END
GO
/****** Object:  StoredProcedure [dbo].[stp_VerticalReports_Update]    Script Date: 2024/08/06 21:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[stp_VerticalReports_Update]  
		 	        @Name nvarchar(max),
                    @StoredProcedure nvarchar(max), 
                    @IsActive nvarchar(max),
                    @SQLTimeout nvarchar(max) ,
                    @RowsPerPage nvarchar(max) ,
                    @UserId nvarchar(max),
					@Id nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update VerticalReports 
	   set
	                [Name] =  @Name,
                    StoredProcedure =  @StoredProcedure,
                    IsActive =  @IsActive ,
                    SQLTimeout =  @SQLTimeout,
                    RowsPerPage =  @RowsPerPage,
					LastModifiedByUserId = @UserId,
					LastModifiedByDateTime = GETDATE()
			 where id = @Id  and isnull(islocked,0) != 1
	 

 

END
GO

INSERT [dbo].[Users] (  [Email], [FirstName], [LastName], [UserCaption], [ExpireDate], [Password], [LastModifiedByUserId], [LastModifiedByDateTime], [IsAdmin], [UpdatePassword], [IsLocked], [LastPasswordModifiedByDateTime], [LastPasswordModifiedByUserId], [CreatedByDateTime], [CreatedByUserId]) VALUES (  N'test@yeboreport.com', N'Demo', N'Example', N'Demo Test', (Getdate()+2), N'DaYG2ihKb18=', 0, NULL, 1, 0, 1, NULL, NULL, CAST(N'2024-03-23T13:26:08.967' AS DateTime), null)

UPDATE [dbo].[Users] SET CreatedByUserId = ID;

ALTER TABLE  [dbo].[Users] ALTER COLUMN CreatedByUserId int NOT NULL;

USE [master]
GO
ALTER DATABASE [Reporting] SET  READ_WRITE 
GO
