USE [master]
GO
/****** Object:  Database [gestion d'achat projet]    Script Date: 20/05/2018 15:08:10 ******/
CREATE DATABASE [gestion d'achat projet] ON  PRIMARY 
( NAME = N'gestion d''achat projet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\gestion d''achat projet.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'gestion d''achat projet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\gestion d''achat projet_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gestion d'achat projet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gestion d'achat projet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET ARITHABORT OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [gestion d'achat projet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gestion d'achat projet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gestion d'achat projet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gestion d'achat projet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gestion d'achat projet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gestion d'achat projet] SET RECOVERY FULL 
GO
ALTER DATABASE [gestion d'achat projet] SET  MULTI_USER 
GO
ALTER DATABASE [gestion d'achat projet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gestion d'achat projet] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'gestion d'achat projet', N'ON'
GO
USE [gestion d'achat projet]
GO
/****** Object:  StoredProcedure [dbo].[addcategories]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[addcategories]
 @des varchar(25),
 @nom varchar(50)
 as
 insert into CATEGORIES values ( @des,@nom)
GO
/****** Object:  StoredProcedure [dbo].[addclient]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[addclient]

@nom varchar(20),
@prenom varchar(20),
@tel nchar(15),
@email varchar(25),
@CIN nvarchar(50),
@ville varchar(50)

as 
insert into CUSTOMERS values (@nom,@prenom,@tel,@email,@CIN,@ville)
GO
/****** Object:  StoredProcedure [dbo].[addCommande]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addCommande]

@dates date,
@idclient int
as 
begin
insert into Commande (DateCommande,IdClient) values (@dates ,@idclient)
end
GO
/****** Object:  StoredProcedure [dbo].[addProduits]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[addProduits]
@id varchar(30),
@lab varchar(30),
@Q int,
@price varchar(50),
@IDS int 
as 
insert into PRODUCTS values (@id,@lab,@Q,@price,@IDS)
GO
/****** Object:  StoredProcedure [dbo].[delcustomer]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delcustomer]
@id int
as
delete from CUSTOMERS where ID_CUSTOMER=@id
GO
/****** Object:  StoredProcedure [dbo].[deletecategories]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[deletecategories]
 @id int
 as
 delete from CATEGORIES where  ID_CAT =@id
GO
/****** Object:  StoredProcedure [dbo].[deletecommande]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deletecommande]
@id int
 as delete  from Commande
where IdCommande=@id
GO
/****** Object:  StoredProcedure [dbo].[deleteDC]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteDC]
@id varchar(30),
@idCommande int
as
delete  from DetailleCommande where IdProduit=@id AND IdCommande=@idCommande
GO
/****** Object:  StoredProcedure [dbo].[deleteProduit]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteProduit]
@id varchar(30)
as
delete from PRODUCTS
where ID_PRODUCT= @id
GO
/****** Object:  StoredProcedure [dbo].[insertdc]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertdc]
@idP varchar(30),
@idC int,
@Qte int
as 
update DetailleCommande
set 

Qte=@Qte
where IdCommande=@idC AND IdProduit =@idP
GO
/****** Object:  StoredProcedure [dbo].[insertdet]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertdet]
@idp varchar(30),
@idC int,
@Qte int
as insert into DetailleCommande values (@idp,@idC,@Qte) 
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[login]
@id int,
@passe varchar(50)
as
select * from TBL_Users where ID=@id and	PWD=@passe

exec LOGIN 1,'1'
GO
/****** Object:  StoredProcedure [dbo].[selectcategories]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectcategories]
as
select*from CATEGORIES
GO
/****** Object:  StoredProcedure [dbo].[selectCommande]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectCommande]
as
select * from Commande
GO
/****** Object:  StoredProcedure [dbo].[selectCustome]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectCustome]
as 
select * from  CUSTOMERS
GO
/****** Object:  StoredProcedure [dbo].[selectdetaillecommande]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectdetaillecommande]
as
select * from DetailleCommande
GO
/****** Object:  StoredProcedure [dbo].[selectproduit]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectproduit]
as
select * from PRODUCTS
GO
/****** Object:  StoredProcedure [dbo].[SP_LOGIN]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_LOGIN]
@id varchar(50),
@passe varchar(50)
as
select * from TBL_Users where ID=@id and PWD=@passe

exec LOGIN 1,'1'
GO
/****** Object:  StoredProcedure [dbo].[updatecategories]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[updatecategories] 
 @id int,
 @des varchar(25),
 @nom varchar(50)
 as
 update CATEGORIES
 set 
 DESCRIPTION_CAT=@des,
 Nom_categorie= @nom
 where ID_CAT=@id
GO
/****** Object:  StoredProcedure [dbo].[updatecommande]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatecommande]
 @id int,
 @dates date,
 @idc int
 as
 update Commande
 set
 DateCommande=@dates,
 IdClient=@idc
 where IdCommande=@id
GO
/****** Object:  StoredProcedure [dbo].[updatecustomer]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatecustomer]
@id int ,
@nom varchar(20),
@prenom varchar(20),
@tel nchar(15),
@email varchar(25),
@CIN Nvarchar(50),
@ville varchar(50)
as 
update CUSTOMERS
set
FIRST_NAME=@nom,
LAST_NAME=@prenom,
TEL=@tel,
EMAIL=@email,
CIN=@CIN,
Ville=@ville
where ID_CUSTOMER=@id
GO
/****** Object:  StoredProcedure [dbo].[updateproduits]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateproduits] 
@id varchar(30),
@lab varchar(30),
@Qte int,
@pri varchar(50),
@idc int
as 
update PRODUCTS
set
LABEL_PRODUCT=@lab,
QTE_IN_STOCK=@Qte,
PRICE=@pri,
ID_CAT=@idc
where ID_PRODUCT=@id
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[ID_CAT] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPTION_CAT] [varchar](25) NULL,
	[Nom_categorie] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[ID_CAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Commande]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commande](
	[IdCommande] [int] IDENTITY(1,1) NOT NULL,
	[DateCommande] [date] NULL,
	[IdClient] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[ID_CUSTOMER] [int] IDENTITY(1,1) NOT NULL,
	[FIRST_NAME] [varchar](20) NULL,
	[LAST_NAME] [varchar](20) NULL,
	[TEL] [nchar](15) NULL,
	[EMAIL] [varchar](25) NULL,
	[CIN] [nvarchar](50) NULL,
	[Ville] [varchar](50) NULL,
 CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED 
(
	[ID_CUSTOMER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailleCommande]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailleCommande](
	[IdProduit] [varchar](30) NULL,
	[IdCommande] [int] NULL,
	[Qte] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[ID_PRODUCT] [varchar](30) NOT NULL,
	[LABEL_PRODUCT] [varchar](30) NULL,
	[QTE_IN_STOCK] [int] NULL,
	[PRICE] [varchar](50) NULL,
	[ID_CAT] [int] NULL,
 CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_Users]    Script Date: 20/05/2018 15:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_Users](
	[ID] [varchar](50) NOT NULL,
	[PWD] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIES] ON 

INSERT [dbo].[CATEGORIES] ([ID_CAT], [DESCRIPTION_CAT], [Nom_categorie]) VALUES (7, N'di', N'info')
INSERT [dbo].[CATEGORIES] ([ID_CAT], [DESCRIPTION_CAT], [Nom_categorie]) VALUES (10, N'KIOJFPISDUQGFIQPIGQRIOSGU', N'DI')
INSERT [dbo].[CATEGORIES] ([ID_CAT], [DESCRIPTION_CAT], [Nom_categorie]) VALUES (11, N'kjk', N'lfkk')
INSERT [dbo].[CATEGORIES] ([ID_CAT], [DESCRIPTION_CAT], [Nom_categorie]) VALUES (13, N'food', N'food')
INSERT [dbo].[CATEGORIES] ([ID_CAT], [DESCRIPTION_CAT], [Nom_categorie]) VALUES (14, N'11', N'food')
INSERT [dbo].[CATEGORIES] ([ID_CAT], [DESCRIPTION_CAT], [Nom_categorie]) VALUES (15, N'11', N'11')
INSERT [dbo].[CATEGORIES] ([ID_CAT], [DESCRIPTION_CAT], [Nom_categorie]) VALUES (16, N'ktkf', N'kjf')
SET IDENTITY_INSERT [dbo].[CATEGORIES] OFF
SET IDENTITY_INSERT [dbo].[Commande] ON 

INSERT [dbo].[Commande] ([IdCommande], [DateCommande], [IdClient]) VALUES (4, CAST(0x373E0B00 AS Date), 7)
INSERT [dbo].[Commande] ([IdCommande], [DateCommande], [IdClient]) VALUES (1003, CAST(0x3D3E0B00 AS Date), 7)
INSERT [dbo].[Commande] ([IdCommande], [DateCommande], [IdClient]) VALUES (1006, CAST(0x3D3E0B00 AS Date), 7)
INSERT [dbo].[Commande] ([IdCommande], [DateCommande], [IdClient]) VALUES (1015, CAST(0x3E3E0B00 AS Date), 7)
INSERT [dbo].[Commande] ([IdCommande], [DateCommande], [IdClient]) VALUES (1016, CAST(0x3E3E0B00 AS Date), 7)
INSERT [dbo].[Commande] ([IdCommande], [DateCommande], [IdClient]) VALUES (1017, CAST(0x3E3E0B00 AS Date), 7)
INSERT [dbo].[Commande] ([IdCommande], [DateCommande], [IdClient]) VALUES (1018, CAST(0x3E3E0B00 AS Date), 7)
SET IDENTITY_INSERT [dbo].[Commande] OFF
SET IDENTITY_INSERT [dbo].[CUSTOMERS] ON 

INSERT [dbo].[CUSTOMERS] ([ID_CUSTOMER], [FIRST_NAME], [LAST_NAME], [TEL], [EMAIL], [CIN], [Ville]) VALUES (7, N'karim', N'aziz', N'ggjhtgtgtty    ', N'modjpod@fklfj.vom', N'ad176368', N'rabat')
INSERT [dbo].[CUSTOMERS] ([ID_CUSTOMER], [FIRST_NAME], [LAST_NAME], [TEL], [EMAIL], [CIN], [Ville]) VALUES (8, N'karim', N'aziz', N'06595957979    ', N'modjpod@fklfj.vom', N'ad176368', N'sale')
INSERT [dbo].[CUSTOMERS] ([ID_CUSTOMER], [FIRST_NAME], [LAST_NAME], [TEL], [EMAIL], [CIN], [Ville]) VALUES (11, N'mohamed', N'kabba', N'09798789       ', N'mmkl', N'ad56766', N'rabat')
SET IDENTITY_INSERT [dbo].[CUSTOMERS] OFF
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'000', 4, 1111)
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'000', 4, 1111)
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'000', 4, 1111)
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'000', 4, 1111)
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'3', 1003, 1111)
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'3', 1003, 11111111)
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'3', 1003, 11)
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'2', 4, 11111)
INSERT [dbo].[DetailleCommande] ([IdProduit], [IdCommande], [Qte]) VALUES (N'5', 4, 1)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'000', N'cle', 11, N'11dh', 7)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'000099', N'kllk', 11, N'11', 7)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'1221', N'mK', 11, N'11', 7)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'123', N'jkjk', 11, N'', 7)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'2', N'ss', 446848, N'7857', 7)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'2243566', N'mo', 11, N'11', 7)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'3', N'fjj', 77, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'4', NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'5', N'HQSFJIO', 1111, N'11', 7)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'5A', N'ml', 11, N'11', 7)
INSERT [dbo].[PRODUCTS] ([ID_PRODUCT], [LABEL_PRODUCT], [QTE_IN_STOCK], [PRICE], [ID_CAT]) VALUES (N'a1', N'HQSFJIO', 11, N'11', 7)
INSERT [dbo].[TBL_Users] ([ID], [PWD]) VALUES (N'1', N'1')
INSERT [dbo].[TBL_Users] ([ID], [PWD]) VALUES (N'admin', N'ad123')
INSERT [dbo].[TBL_Users] ([ID], [PWD]) VALUES (N'user1', N'us345')
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD FOREIGN KEY([IdClient])
REFERENCES [dbo].[CUSTOMERS] ([ID_CUSTOMER])
GO
ALTER TABLE [dbo].[DetailleCommande]  WITH CHECK ADD FOREIGN KEY([IdCommande])
REFERENCES [dbo].[Commande] ([IdCommande])
GO
ALTER TABLE [dbo].[DetailleCommande]  WITH CHECK ADD FOREIGN KEY([IdProduit])
REFERENCES [dbo].[PRODUCTS] ([ID_PRODUCT])
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTS_CATEGORIES] FOREIGN KEY([ID_CAT])
REFERENCES [dbo].[CATEGORIES] ([ID_CAT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCTS] CHECK CONSTRAINT [FK_PRODUCTS_CATEGORIES]
GO
USE [master]
GO
ALTER DATABASE [gestion d'achat projet] SET  READ_WRITE 
GO
