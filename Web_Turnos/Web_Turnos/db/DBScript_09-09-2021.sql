USE [master]
GO
/****** Object:  Database [Web_Turnos]    Script Date: 09/09/2021 10:53:14 p. m. ******/
CREATE DATABASE [Web_Turnos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web_Turnos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web_Turnos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web_Turnos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web_Turnos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Web_Turnos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web_Turnos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web_Turnos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web_Turnos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web_Turnos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web_Turnos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web_Turnos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web_Turnos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Web_Turnos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web_Turnos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web_Turnos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web_Turnos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web_Turnos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web_Turnos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web_Turnos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web_Turnos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web_Turnos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Web_Turnos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web_Turnos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web_Turnos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web_Turnos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web_Turnos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web_Turnos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web_Turnos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web_Turnos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Web_Turnos] SET  MULTI_USER 
GO
ALTER DATABASE [Web_Turnos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web_Turnos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web_Turnos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web_Turnos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web_Turnos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web_Turnos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Web_Turnos', N'ON'
GO
ALTER DATABASE [Web_Turnos] SET QUERY_STORE = OFF
GO
USE [Web_Turnos]
GO
/****** Object:  Table [dbo].[tblEstados]    Script Date: 09/09/2021 10:53:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstados](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGeneros]    Script Date: 09/09/2021 10:53:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGeneros](
	[idGenero] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHorarios]    Script Date: 09/09/2021 10:53:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHorarios](
	[idHorario] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPerfilesUsuarios]    Script Date: 09/09/2021 10:53:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPerfilesUsuarios](
	[idPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTurnos]    Script Date: 09/09/2021 10:53:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTurnos](
	[idTurno] [int] IDENTITY(1,1) NOT NULL,
	[idHorario] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Estado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarios]    Script Date: 09/09/2021 10:53:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NULL,
	[Contrasenia] [varchar](50) NULL,
	[FechaAlta] [date] NULL,
	[FechaActualizacion] [date] NULL,
	[Apellido] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Telefono] [varchar](20) NULL,
	[Mail] [varchar](50) NULL,
	[Genero] [int] NULL,
	[FechaNacimiento] [date] NULL,
	[Perfil] [tinyint] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblEstados] ON 

INSERT [dbo].[tblEstados] ([idEstado], [Descripcion]) VALUES (1, N'Solicitado')
INSERT [dbo].[tblEstados] ([idEstado], [Descripcion]) VALUES (2, N'Caducado')
INSERT [dbo].[tblEstados] ([idEstado], [Descripcion]) VALUES (3, N'Cancelado')
SET IDENTITY_INSERT [dbo].[tblEstados] OFF
GO
SET IDENTITY_INSERT [dbo].[tblGeneros] ON 

INSERT [dbo].[tblGeneros] ([idGenero], [Descripcion]) VALUES (1, N'Femenino')
INSERT [dbo].[tblGeneros] ([idGenero], [Descripcion]) VALUES (2, N'Masculino')
INSERT [dbo].[tblGeneros] ([idGenero], [Descripcion]) VALUES (3, N'Otro')
SET IDENTITY_INSERT [dbo].[tblGeneros] OFF
GO
SET IDENTITY_INSERT [dbo].[tblHorarios] ON 

INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (1, N'08:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (2, N'08:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (3, N'09:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (4, N'09:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (5, N'10:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (6, N'10:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (7, N'11:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (8, N'11:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (9, N'12:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (10, N'16:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (11, N'16:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (12, N'17:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (13, N'17:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (14, N'18:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (15, N'18:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (16, N'19:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (17, N'19:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (18, N'20:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (19, N'20:30')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (20, N'21:00')
INSERT [dbo].[tblHorarios] ([idHorario], [Descripcion]) VALUES (21, N'21:30')
SET IDENTITY_INSERT [dbo].[tblHorarios] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPerfilesUsuarios] ON 

INSERT [dbo].[tblPerfilesUsuarios] ([idPerfil], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[tblPerfilesUsuarios] ([idPerfil], [Descripcion]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[tblPerfilesUsuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTurnos] ON 

INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1, 7, CAST(N'2021-08-20' AS Date), N'alan01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (2, 1, CAST(N'2021-04-21' AS Date), N'alan01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (3, 8, CAST(N'2021-04-16' AS Date), N'alan01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (4, 2, CAST(N'2021-04-14' AS Date), N'alan01', 3)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (5, 12, CAST(N'2021-04-15' AS Date), N'alan01', 3)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (6, 1, CAST(N'2021-04-17' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (7, 15, CAST(N'2021-05-04' AS Date), N'alan01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1007, 19, CAST(N'2021-07-31' AS Date), N'geral01', 3)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1008, 20, CAST(N'2021-07-31' AS Date), N'geral01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1009, 18, CAST(N'2021-08-19' AS Date), N'alan01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1010, 19, CAST(N'2021-08-19' AS Date), N'alan01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1011, 6, CAST(N'2021-08-20' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1012, 12, CAST(N'2021-08-20' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1016, 13, CAST(N'2021-08-25' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1017, 13, CAST(N'2021-08-20' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1018, 10, CAST(N'2021-08-21' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1019, 13, CAST(N'2021-08-21' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1022, 15, CAST(N'2021-08-24' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1023, 7, CAST(N'2021-08-23' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1024, 1, CAST(N'2021-09-10' AS Date), N'alan01', 1)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1025, 2, CAST(N'2021-09-10' AS Date), N'alan01', 1)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1026, 6, CAST(N'2021-09-11' AS Date), N'alan01', 1)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1027, 6, CAST(N'2021-09-11' AS Date), N'alan01', 1)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1013, 17, CAST(N'2021-08-20' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1014, 18, CAST(N'2021-08-20' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1015, 12, CAST(N'2021-08-23' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1020, 13, CAST(N'2021-08-23' AS Date), N'alex01', 2)
INSERT [dbo].[tblTurnos] ([idTurno], [idHorario], [Fecha], [Usuario], [Estado]) VALUES (1021, 1, CAST(N'2021-08-23' AS Date), N'alex01', 2)
SET IDENTITY_INSERT [dbo].[tblTurnos] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsuarios] ON 

INSERT [dbo].[tblUsuarios] ([idUsuario], [NombreUsuario], [Contrasenia], [FechaAlta], [FechaActualizacion], [Apellido], [Nombre], [Telefono], [Mail], [Genero], [FechaNacimiento], [Perfil]) VALUES (1, N'alex01', N'1234', CAST(N'2021-04-08' AS Date), CAST(N'2021-08-19' AS Date), N'Brandan', N'Alex', N'123456', N'alexbrandan6@gmail.com', 2, CAST(N'1998-12-05' AS Date), 1)
INSERT [dbo].[tblUsuarios] ([idUsuario], [NombreUsuario], [Contrasenia], [FechaAlta], [FechaActualizacion], [Apellido], [Nombre], [Telefono], [Mail], [Genero], [FechaNacimiento], [Perfil]) VALUES (2, N'alan01', N'1234', CAST(N'2021-04-08' AS Date), CAST(N'2021-09-09' AS Date), N'Perez', N'Alan Franco', N'111111111', N'alan@mail.com', 3, CAST(N'1995-07-13' AS Date), 2)
INSERT [dbo].[tblUsuarios] ([idUsuario], [NombreUsuario], [Contrasenia], [FechaAlta], [FechaActualizacion], [Apellido], [Nombre], [Telefono], [Mail], [Genero], [FechaNacimiento], [Perfil]) VALUES (3, N'awd', N'213', CAST(N'2021-04-15' AS Date), NULL, N'wadawd', N'awdawd', N'123123', N'', 1, CAST(N'1980-03-05' AS Date), 2)
INSERT [dbo].[tblUsuarios] ([idUsuario], [NombreUsuario], [Contrasenia], [FechaAlta], [FechaActualizacion], [Apellido], [Nombre], [Telefono], [Mail], [Genero], [FechaNacimiento], [Perfil]) VALUES (5, N'geral01', N'123', CAST(N'2021-07-31' AS Date), NULL, N'acuri', N'geraldine', N'1234', N'asdasd@gmail.com', 1, CAST(N'1995-12-07' AS Date), 2)
SET IDENTITY_INSERT [dbo].[tblUsuarios] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_Calendario]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Calendario]
as
SET LANGUAGE 'spanish'
DECLARE @Anio INT = '2021'
DECLARE @CantAnios INT = 1
DECLARE @FechaInicio DATE = DATEFROMPARTS(@Anio, '01','01')
DECLARE @FechaFin DATE = DATEADD(DAY, -1, DATEADD(YEAR, @CantAnios, @FechaInicio))

;WITH Cal(n) AS
(
SELECT 0 UNION ALL SELECT n + 1 FROM Cal
WHERE n < DATEDIFF(DAY, @FechaInicio, @FechaFin)
),
FnlDt(d) AS
(
SELECT DATEADD(DAY, n, @FechaInicio) FROM Cal
),
CalendarioFinal AS
(
SELECT
[Fecha] = CONVERT(DATE,d),
[Dia] = DATEPART(DAY, d),
[Mes] = DATEPART(MONTH, d),
[Anio] = DATEPART(YEAR, d),
[NombreDia] = DATENAME(WEEKDAY, d),
[NombreMes] = DATENAME(MONTH, d)
FROM FnlDt
)
SELECT *, [NombreDia] + ', ' + convert(varchar,[Dia],1) as 'FechaDdl' FROM CalendarioFinal
WHERE MONTH([Fecha]) = MONTH(GETDATE()) AND [Fecha] > GETDATE() OR (DAY([Fecha]) = DAY(GETDATE()) AND MONTH([Fecha]) = MONTH(GETDATE()) AND YEAR([Fecha]) = YEAR(GETDATE()))
ORDER BY [Fecha]
OPTION (MAXRECURSION 0);
GO
/****** Object:  StoredProcedure [dbo].[SP_Horarios_Obtener]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Horarios_Obtener](
@Fecha DATE
)
AS
IF  CONVERT(DATE,@Fecha,1) = CONVERT(DATE,GETDATE(),1) BEGIN
	SELECT * FROM tblHorarios
	WHERE
	idHorario NOT IN (SELECT idHorario FROM tblTurnos WHERE Fecha = @Fecha AND (Estado <> 3))
	AND
	SUBSTRING(Descripcion, 1, 2) + SUBSTRING(Descripcion, 4, 5)
	>
	CONVERT(VARCHAR(2),DATEPART(HOUR, GETDATE()),1) +
	CASE
	WHEN (CONVERT(VARCHAR(2),DATEPART(MINUTE, GETDATE()),3)) < 10
	THEN '0' + (CONVERT(VARCHAR(2),DATEPART(MINUTE, GETDATE()),3))
	ELSE (CONVERT(VARCHAR(2),DATEPART(MINUTE, GETDATE()),3)) END
END
ELSE BEGIN
	SELECT * FROM tblHorarios
	WHERE
	idHorario NOT IN (SELECT idHorario FROM tblTurnos WHERE Fecha = @Fecha AND (Estado <> 3))
END
	
GO
/****** Object:  StoredProcedure [dbo].[SP_Turnos_Actualizar]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Turnos_Actualizar](
@idHorario int,
@Fecha date,
@idTurno int
)
AS

DECLARE @estado INT = (SELECT Estado FROM tblTurnos WHERE idTurno = @idTurno)

IF @estado NOT IN (2,3) BEGIN
	UPDATE tblTurnos SET idHorario = @idHorario, Fecha = @Fecha, Estado = 1 WHERE idTurno = @idTurno
	SELECT 'OK' msj
END
ELSE BEGIN
	DECLARE @estadoDesc VARCHAR(10) = (SELECT Descripcion FROM tblEstados WHERE idEstado = @estado)
	SELECT 'El turno no puede actualizarse. Este se encuentra ' + @estadoDesc msj
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Turnos_BajasAutomaticas]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Turnos_BajasAutomaticas]
AS
UPDATE tblTurnos
SET Estado = 2
WHERE Estado NOT IN (2,3) AND Fecha < GETDATE()
GO
/****** Object:  StoredProcedure [dbo].[SP_Turnos_Cancelar]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Turnos_Cancelar](
@idTurno int
)
AS
UPDATE tblTurnos SET Estado = 3 WHERE idTurno = @idTurno
SELECT 'OK' msj
GO
/****** Object:  StoredProcedure [dbo].[SP_Turnos_Guardar]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Turnos_Guardar](
@idHorario int,
@Fecha date,
@Usuario varchar(50)
)
as
INSERT INTO tblTurnos(idHorario, Fecha, Usuario, Estado) VALUES (@idHorario, @Fecha, @Usuario, 1)
SELECT 'OK' msj
GO
/****** Object:  StoredProcedure [dbo].[SP_Turnos_Obtener]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Turnos_Obtener](
@Usuario varchar(50)
)
as
SELECT t.idTurno, t.Fecha, h.Descripcion, e.Descripcion AS Estado
FROM tblTurnos t
INNER JOIN
tblHorarios h
ON h.idHorario = t.idHorario
INNER JOIN
tblEstados e
ON t.Estado = e.idEstado
WHERE t.Usuario = @Usuario
ORDER BY t.Fecha ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Actualizar]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Usuario_Actualizar](
@NombreUsuarioActual varchar(50),
@NombreUsuario varchar(50),
@Contrasenia varchar(50),
@Apellido varchar(50),
@Nombre varchar(50),
@Telefono varchar(20),
@Mail varchar(50),
@Genero int,
@FechaNacimiento date
)
AS
IF @NombreUsuario = @NombreUsuarioActual BEGIN
	UPDATE tblUsuarios
	SET
	NombreUsuario = @NombreUsuario, Contrasenia = @Contrasenia, Apellido = @Apellido, Nombre = @Nombre, Telefono = @Telefono,
	Mail = @Mail, Genero = @Genero, FechaNacimiento = @FechaNacimiento, FechaActualizacion = GETDATE()
	WHERE NombreUsuario = @NombreUsuarioActual

	SELECT 'OK' msj
END
ELSE BEGIN
	IF @NombreUsuario IN (SELECT NombreUsuario FROM tblUsuarios WHERE NombreUsuario = @NombreUsuario) BEGIN
		SELECT 'Nombre de usuario ya registrado' msj
	END
	ELSE BEGIN
		UPDATE tblUsuarios
		SET
		NombreUsuario = @NombreUsuario, Contrasenia = @Contrasenia, Apellido = @Apellido, Nombre = @Nombre, Telefono = @Telefono,
		Mail = @Mail, Genero = @Genero, FechaNacimiento = @FechaNacimiento, FechaActualizacion = GETDATE()
		WHERE NombreUsuario = @NombreUsuarioActual
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Guardar]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Usuario_Guardar](
@NombreUsuario varchar(50),
@Contrasenia varchar(50),
@Apellido varchar(50),
@Nombre varchar(50),
@Telefono varchar(20),
@Mail varchar(50),
@Genero int,
@FechaNacimiento date
)
as
IF @NombreUsuario IN (SELECT NombreUsuario FROM tblUsuarios WHERE NombreUsuario = @NombreUsuario) BEGIN
	SELECT 'Nombre de usuario ya registrado' msj
END
ELSE BEGIN
	INSERT INTO tblUsuarios
	(NombreUsuario, Contrasenia, FechaAlta, Apellido, Nombre, Telefono, Mail, Genero, FechaNacimiento, Perfil)
	VALUES
	(@NombreUsuario, @Contrasenia, GETDATE(),@Apellido, @Nombre, @Telefono, @Mail, @Genero, @FechaNacimiento, 2)

	SELECT 'OK' msj
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Logear]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Usuario_Logear](
@NombreUsuario varchar(50),
@Contrasenia varchar(50)
)
as
IF @NombreUsuario IN (SELECT NombreUsuario FROM tblUsuarios WHERE NombreUsuario = @NombreUsuario AND Contrasenia = @Contrasenia) BEGIN
	SELECT *, 'OK' msj FROM tblUsuarios WHERE NombreUsuario = @NombreUsuario
END
ELSE BEGIN
	SELECT 'Nombre de usuario o contraseña incorrectos' msj
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuario_Obtener]    Script Date: 09/09/2021 10:53:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Usuario_Obtener](
@NombreUsuario varchar(50) = NULL,
@op varchar(10)
)
AS
IF @op = 'TODOS' BEGIN
	SELECT * FROM tblUsuarios
END
ELSE BEGIN
	SELECT * FROM tblUsuarios WHERE NombreUsuario = @NombreUsuario
END
GO
USE [master]
GO
ALTER DATABASE [Web_Turnos] SET  READ_WRITE 
GO
