USE [master]
GO
/****** Object:  Database [sports_bar]    Script Date: 11/23/2024 8:39:39 PM ******/
CREATE DATABASE [sports_bar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sports_bar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\sports_bar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sports_bar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\sports_bar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [sports_bar] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sports_bar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sports_bar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sports_bar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sports_bar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sports_bar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sports_bar] SET ARITHABORT OFF 
GO
ALTER DATABASE [sports_bar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sports_bar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sports_bar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sports_bar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sports_bar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sports_bar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sports_bar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sports_bar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sports_bar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sports_bar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sports_bar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sports_bar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sports_bar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sports_bar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sports_bar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sports_bar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sports_bar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sports_bar] SET RECOVERY FULL 
GO
ALTER DATABASE [sports_bar] SET  MULTI_USER 
GO
ALTER DATABASE [sports_bar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sports_bar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sports_bar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sports_bar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sports_bar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sports_bar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sports_bar', N'ON'
GO
ALTER DATABASE [sports_bar] SET QUERY_STORE = OFF
GO
USE [sports_bar]
GO
/****** Object:  Table [dbo].[alcohol_menu]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alcohol_menu](
	[alcohol_id] [int] NOT NULL,
	[alcohol_name] [varchar](30) NULL,
	[alcohol_type] [varchar](30) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[alcohol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[alcohol_orders]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alcohol_orders](
	[order_id] [int] NOT NULL,
	[cust_id] [int] NULL,
	[alcohol_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[alcohol_receipt]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alcohol_receipt](
	[alcohol_receipt_id] [int] NOT NULL,
	[cust_id] [int] NULL,
	[table_id] [int] NULL,
	[chair_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[alcohol_receipt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bar]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bar](
	[chair_id] [int] NULL,
	[bartender_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bar_chair]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bar_chair](
	[chair_id] [int] NOT NULL,
	[chair_capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[chair_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bar_chair_manager]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bar_chair_manager](
	[chair_id] [int] NULL,
	[cust_id] [int] NULL,
	[chair_reserve] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bartender]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bartender](
	[bar_id] [int] NULL,
	[chair_id] [int] NULL,
	[cust_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bartender_schedule]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bartender_schedule](
	[bartender_id] [int] NOT NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bartender_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkin]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkin](
	[check_in] [int] NOT NULL,
	[check_in_time] [datetime] NULL,
	[check_out_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[check_in] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkin_manager]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkin_manager](
	[check_in] [int] NULL,
	[employee_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chef]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chef](
	[chef_id] [int] NULL,
	[chef_type] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chef_schedule]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chef_schedule](
	[chef_id] [int] NOT NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[chef_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[cust_id] [int] NOT NULL,
	[cust_name] [varchar](30) NULL,
	[cust_add] [varchar](100) NULL,
	[cust_type] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [int] NOT NULL,
	[employee_name] [varchar](30) NULL,
	[employee_type] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food_Menu]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food_Menu](
	[food_id] [int] NOT NULL,
	[food_name] [varchar](30) NULL,
	[food_type] [varchar](30) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food_orders]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_orders](
	[order_id] [int] NOT NULL,
	[cust_id] [int] NULL,
	[food_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food_receipt]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_receipt](
	[food_receipt_id] [int] NOT NULL,
	[cust_id] [int] NULL,
	[table_id] [int] NULL,
	[chair_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[food_receipt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food_runner]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_runner](
	[food_runner] [int] NULL,
	[table_id] [int] NULL,
	[chair_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food_runner_schedule]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_runner_schedule](
	[food_runner_id] [int] NOT NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[food_runner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice_generator]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_generator](
	[cust_id] [int] NULL,
	[toast_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kitchen]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitchen](
	[food_receipt_id] [int] NULL,
	[table_id] [int] NULL,
	[chair_id] [int] NULL,
	[chef_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[owner]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[owner](
	[owner_id] [int] NOT NULL,
	[owner_name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurant]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurant](
	[table_id] [int] NULL,
	[server_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[server_s]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[server_s](
	[server_id] [int] NULL,
	[table_id] [int] NULL,
	[cust_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servers_schedule]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servers_schedule](
	[server_id] [int] NOT NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[server_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tables_manager]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tables_manager](
	[table_id] [int] NULL,
	[cust_id] [int] NULL,
	[reserver] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tables_r]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tables_r](
	[table_id] [int] NOT NULL,
	[table_capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[toast]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[toast](
	[toast_id] [int] NULL,
	[employee_id] [int] NULL,
	[table_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tv_channel]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tv_channel](
	[tv_id] [int] NOT NULL,
	[show_time] [datetime] NULL,
	[channel_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tv_position]    Script Date: 11/23/2024 8:39:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tv_position](
	[tv_id] [int] NOT NULL,
	[tv_position] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[alcohol_orders]  WITH CHECK ADD FOREIGN KEY([alcohol_id])
REFERENCES [dbo].[alcohol_menu] ([alcohol_id])
GO
ALTER TABLE [dbo].[alcohol_orders]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[alcohol_receipt]  WITH CHECK ADD FOREIGN KEY([chair_id])
REFERENCES [dbo].[bar_chair] ([chair_id])
GO
ALTER TABLE [dbo].[alcohol_receipt]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[alcohol_receipt]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[tables_r] ([table_id])
GO
ALTER TABLE [dbo].[bar]  WITH CHECK ADD FOREIGN KEY([bartender_id])
REFERENCES [dbo].[bartender_schedule] ([bartender_id])
GO
ALTER TABLE [dbo].[bar]  WITH CHECK ADD FOREIGN KEY([chair_id])
REFERENCES [dbo].[bar_chair] ([chair_id])
GO
ALTER TABLE [dbo].[bar_chair_manager]  WITH CHECK ADD FOREIGN KEY([chair_id])
REFERENCES [dbo].[bar_chair] ([chair_id])
GO
ALTER TABLE [dbo].[bar_chair_manager]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[bartender]  WITH CHECK ADD FOREIGN KEY([bar_id])
REFERENCES [dbo].[bartender_schedule] ([bartender_id])
GO
ALTER TABLE [dbo].[bartender]  WITH CHECK ADD FOREIGN KEY([chair_id])
REFERENCES [dbo].[bar_chair] ([chair_id])
GO
ALTER TABLE [dbo].[bartender]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[bartender_schedule]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[checkin_manager]  WITH CHECK ADD FOREIGN KEY([check_in])
REFERENCES [dbo].[checkin] ([check_in])
GO
ALTER TABLE [dbo].[checkin_manager]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[chef]  WITH CHECK ADD FOREIGN KEY([chef_id])
REFERENCES [dbo].[chef_schedule] ([chef_id])
GO
ALTER TABLE [dbo].[chef_schedule]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[food_orders]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[food_orders]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[Food_Menu] ([food_id])
GO
ALTER TABLE [dbo].[food_receipt]  WITH CHECK ADD FOREIGN KEY([chair_id])
REFERENCES [dbo].[bar_chair] ([chair_id])
GO
ALTER TABLE [dbo].[food_receipt]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[food_receipt]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[tables_r] ([table_id])
GO
ALTER TABLE [dbo].[food_runner]  WITH CHECK ADD FOREIGN KEY([chair_id])
REFERENCES [dbo].[bar_chair] ([chair_id])
GO
ALTER TABLE [dbo].[food_runner]  WITH CHECK ADD FOREIGN KEY([food_runner])
REFERENCES [dbo].[food_runner_schedule] ([food_runner_id])
GO
ALTER TABLE [dbo].[food_runner]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[tables_r] ([table_id])
GO
ALTER TABLE [dbo].[food_runner_schedule]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[invoice_generator]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[kitchen]  WITH CHECK ADD FOREIGN KEY([chair_id])
REFERENCES [dbo].[bar_chair] ([chair_id])
GO
ALTER TABLE [dbo].[kitchen]  WITH CHECK ADD FOREIGN KEY([chef_id])
REFERENCES [dbo].[chef_schedule] ([chef_id])
GO
ALTER TABLE [dbo].[kitchen]  WITH CHECK ADD FOREIGN KEY([food_receipt_id])
REFERENCES [dbo].[food_receipt] ([food_receipt_id])
GO
ALTER TABLE [dbo].[kitchen]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[tables_r] ([table_id])
GO
ALTER TABLE [dbo].[restaurant]  WITH CHECK ADD FOREIGN KEY([server_id])
REFERENCES [dbo].[servers_schedule] ([server_id])
GO
ALTER TABLE [dbo].[restaurant]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[tables_r] ([table_id])
GO
ALTER TABLE [dbo].[server_s]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[server_s]  WITH CHECK ADD FOREIGN KEY([server_id])
REFERENCES [dbo].[servers_schedule] ([server_id])
GO
ALTER TABLE [dbo].[server_s]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[tables_r] ([table_id])
GO
ALTER TABLE [dbo].[servers_schedule]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[tables_manager]  WITH CHECK ADD FOREIGN KEY([cust_id])
REFERENCES [dbo].[customers] ([cust_id])
GO
ALTER TABLE [dbo].[tables_manager]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[tables_r] ([table_id])
GO
ALTER TABLE [dbo].[toast]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[toast]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[tables_r] ([table_id])
GO
USE [master]
GO
ALTER DATABASE [sports_bar] SET  READ_WRITE 
GO
