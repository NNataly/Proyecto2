USE [master]
GO
/****** Object:  Database [driver]    Script Date: 21/10/2021 10:19:46 ******/
CREATE DATABASE [driver]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'driver', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\driver.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'driver_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\driver_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [driver] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [driver].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [driver] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [driver] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [driver] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [driver] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [driver] SET ARITHABORT OFF 
GO
ALTER DATABASE [driver] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [driver] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [driver] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [driver] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [driver] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [driver] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [driver] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [driver] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [driver] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [driver] SET  ENABLE_BROKER 
GO
ALTER DATABASE [driver] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [driver] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [driver] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [driver] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [driver] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [driver] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [driver] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [driver] SET RECOVERY FULL 
GO
ALTER DATABASE [driver] SET  MULTI_USER 
GO
ALTER DATABASE [driver] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [driver] SET DB_CHAINING OFF 
GO
ALTER DATABASE [driver] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [driver] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [driver] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [driver] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'driver', N'ON'
GO
ALTER DATABASE [driver] SET QUERY_STORE = OFF
GO
USE [driver]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id_cat] [int] IDENTITY(1,1) NOT NULL,
	[description_cat] [varchar](100) NULL,
	[name_cat] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doc]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doc](
	[id_doc] [int] IDENTITY(1,1) NOT NULL,
	[description_doc] [varchar](100) NULL,
	[location_doc] [varchar](100) NULL,
	[name_doc] [varchar](100) NULL,
	[cod_user] [int] NULL,
	[cod_cat] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[university]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[university](
	[id_university] [int] IDENTITY(1,1) NOT NULL,
	[name_university] [varchar](100) NULL,
	[location_university] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_university] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_users] [int] IDENTITY(1,1) NOT NULL,
	[correo_users] [varchar](100) NULL,
	[password_users] [varbinary](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_details]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_details](
	[id_users] [int] NULL,
	[lastname_details] [varchar](100) NULL,
	[name_details] [varchar](100) NULL,
	[carreer_details] [varchar](100) NULL,
	[school_details] [varchar](100) NULL,
	[lastsession_details] [datetime] NULL,
	[cod_universidad] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[doc]  WITH CHECK ADD FOREIGN KEY([cod_cat])
REFERENCES [dbo].[categories] ([id_cat])
GO
ALTER TABLE [dbo].[doc]  WITH CHECK ADD FOREIGN KEY([cod_user])
REFERENCES [dbo].[users] ([id_users])
GO
ALTER TABLE [dbo].[users_details]  WITH CHECK ADD FOREIGN KEY([cod_universidad])
REFERENCES [dbo].[university] ([id_university])
GO
ALTER TABLE [dbo].[users_details]  WITH CHECK ADD FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id_users])
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarCategorias]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_actualizarCategorias]

@name_cat varchar(100),
@description_cat varchar(100),
@id_cat int
AS
UPDATE categories set name_cat=@name_cat,description_cat=@description_cat
WHERE id_cat=@id_cat;
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarDoc]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_actualizarDoc]

@description_doc varchar(100),
@location_doc varchar(100),
@name_doc varchar(100),
@id_doc int
AS
UPDATE doc set description_doc=@description_doc,location_doc=@location_doc,name_doc=@name_doc
WHERE id_doc=@id_doc;
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarUniversidad]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_actualizarUniversidad]

@name_un varchar(100),
@location_un varchar(100),
@id_un int
AS
UPDATE university set name_university=@name_un,location_university=@location_un
WHERE id_university=@id_un;
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuario]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ActualizarUsuario]
@id int,
@correo varchar(100),
@pas varchar(30)
as
declare @conpas varbinary(30);
set @conpas = CAST ( @pas AS varbinary(30) ) ;
update users set correo_users = @correo, password_users = @conpas where id_users = @id;
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuriosDetalles]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ActualizarUsuriosDetalles]
@id int,
@last varchar(100),
@name varchar(100),
@carreer varchar(100),
@school varchar(100),
@iduni int
as
update users_details set lastname_details= @last, name_details =@carreer, lastsession_details= SYSDATETIME(), school_details = @school,cod_universidad = @iduni
where id_users = @id;
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarCategorias]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscarCategorias]
@name_cat varchar(100)
AS
BEGIN
 SELECT * FROM categories
 WHERE name_cat like '%' + @name_cat + '%'
 END 
    EXEC sp_buscarCategorias 'MULTIMEDIA';
GO
/****** Object:  StoredProcedure [dbo].[sp_buscardesCategorias]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SEARCH BY DESCRIPTION
CREATE PROCEDURE [dbo].[sp_buscardesCategorias]
@description_cat varchar(100)
AS
BEGIN
 SELECT * FROM categories
 WHERE description_cat like '%' + @description_cat + '%'
 END 
    EXEC sp_buscardesCategorias 'MIS VIDEOS Y FOTOS';
GO
/****** Object:  StoredProcedure [dbo].[sp_buscardescDoc]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SEARCH BY DESCRIPTION
CREATE PROCEDURE [dbo].[sp_buscardescDoc]
@desc_doc varchar(100)
AS
BEGIN
 SELECT * FROM doc
 WHERE description_doc like '%' + @desc_doc + '%'
 END 
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarlocationUniversidad]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SEARCH/LOCATION_UNI
CREATE PROCEDURE [dbo].[sp_buscarlocationUniversidad]
@loc_un varchar(100)
AS
BEGIN
 SELECT * FROM university
 WHERE location_university like '%' + @loc_un + '%'
 END 
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarlocDoc]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscarlocDoc]
@loc_doc varchar(100)
AS
BEGIN
 SELECT * FROM doc
 WHERE location_doc like '%' + @loc_doc + '%'
 END 
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarnameDoc]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscarnameDoc]
@name_doc varchar(100)
AS
BEGIN
 SELECT * FROM doc
 WHERE name_doc like '%' + @name_doc + '%'
 END 
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarUniversidad]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscarUniversidad]
@name_un varchar(100)
AS
BEGIN
 SELECT * FROM university
 WHERE name_university like '%' + @name_un + '%'
 END 
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarUsuario]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_buscarUsuario]
@correo varchar(100),
@pas varchar(30)
as
declare @id int;
declare @conpas varbinary;
set @conpas = CAST ( @pas AS varbinary(30) ) ;
set @id = (select id_users from users where correo_users = @correo and password_users = @conpas);
select * from users_details where id_users = @id;
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarCategorias]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROCEDURE [dbo].[sp_eliminarCategorias]
@id_cat int
AS
DELETE FROM categories
WHERE id_cat=@id_cat;
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarDetalles]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ELIMINAR
CREATE PROCEDURE [dbo].[sp_eliminarDetalles]
@id_dt int
AS
DELETE FROM users_details 
WHERE id_users=@id_dt;
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarDoc]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--ELIMINAR
CREATE PROCEDURE [dbo].[sp_eliminarDoc]
@id_doc int
AS
DELETE FROM doc 
WHERE id_doc=@id_doc;
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarUniversidad]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*ELIMINAR */
CREATE PROCEDURE [dbo].[sp_eliminarUniversidad]
@id_un int
AS
DELETE FROM university 
WHERE id_university=@id_un;
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarUsuarios]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_eliminarUsuarios]
@id_dt int
AS
DELETE FROM users
WHERE id_users=@id_dt;
DELETE FROM users_details 
WHERE id_users=@id_dt;
GO
/****** Object:  StoredProcedure [dbo].[sp_insertarcategories]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CATEGORIES INSERTAR
CREATE PROCEDURE [dbo].[sp_insertarcategories] (@name_cat varchar(100),@desc_cat varchar(100))
AS
BEGIN
     INSERT INTO categories(name_cat,description_cat)
	    VALUES (@name_cat,@desc_cat)
		END

GO
/****** Object:  StoredProcedure [dbo].[sp_insertardoc]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--DOC INSERTAR
CREATE PROCEDURE [dbo].[sp_insertardoc] (@desc_doc varchar(100),@loc_doc varchar(100),@name_doc varchar(100),@cod_user int,@cod_cat int)
AS
BEGIN
     INSERT INTO doc(description_doc,location_doc,name_doc,cod_user,cod_cat)
	    VALUES (@desc_doc,@loc_doc,@name_doc,@cod_user,@cod_cat)
		END

GO
/****** Object:  StoredProcedure [dbo].[sp_insertarUniversidad]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertarUniversidad] (@name_un varchar(100),@loc_un varchar(100))
AS
BEGIN
     INSERT INTO university(name_university,location_university)
	    VALUES (@name_un,@loc_un)
		END

GO
/****** Object:  StoredProcedure [dbo].[sp_insertarUsuarios]    Script Date: 21/10/2021 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
create procedure [dbo].[sp_insertarUsuarios]
@last varchar(100),
@name varchar(100),
@carreer varchar(100),
@school varchar(100),
@iduni varchar(2),
@correo varchar(100),
@pas varchar(30)
as
declare @lastsesion datetime;
set @lastsesion = SYSDATETIME();
declare @id int;
set @id = CAST ( @iduni AS int ) ;
declare @conpas binary;
declare @iduser int;
set @conpas = CAST ( @pas AS varbinary(30) ) ;
insert into users values(@correo,@conpas);
set @iduser = (Select max(id_users) from users);
insert into users_details values (@iduser,@last,@name,@carreer,@school,@lastsesion,@id);
GO
USE [master]
GO
ALTER DATABASE [driver] SET  READ_WRITE 
GO
