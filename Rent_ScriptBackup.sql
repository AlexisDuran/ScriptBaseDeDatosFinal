USE [Rent]
GO
/****** Object:  StoredProcedure [dbo].[rentasMenores]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP PROCEDURE [dbo].[rentasMenores]
GO
/****** Object:  StoredProcedure [dbo].[rentasMayores]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP PROCEDURE [dbo].[rentasMayores]
GO
/****** Object:  StoredProcedure [dbo].[laptopsDañadas]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP PROCEDURE [dbo].[laptopsDañadas]
GO
/****** Object:  StoredProcedure [dbo].[lapsAltoRendimiento]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP PROCEDURE [dbo].[lapsAltoRendimiento]
GO
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_Renter]
GO
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_Laptop]
GO
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Laptop] DROP CONSTRAINT [FK_Laptop_Caracteristicas]
GO
/****** Object:  View [dbo].[view_lap_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_lap_all]
GO
/****** Object:  View [dbo].[view_renter_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_renter_all]
GO
/****** Object:  View [dbo].[view_venta_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_venta_all]
GO
/****** Object:  View [dbo].[view_caract_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_caract_all]
GO
/****** Object:  View [dbo].[view_client_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_client_all]
GO
/****** Object:  View [dbo].[view_lap]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_lap]
GO
/****** Object:  Table [dbo].[Laptop]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP TABLE [dbo].[Laptop]
GO
/****** Object:  View [dbo].[view_renter]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_renter]
GO
/****** Object:  Table [dbo].[Renter]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP TABLE [dbo].[Renter]
GO
/****** Object:  View [dbo].[view_venta]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_venta]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP TABLE [dbo].[Venta]
GO
/****** Object:  View [dbo].[view_caract]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_caract]
GO
/****** Object:  Table [dbo].[Caracteristicas]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP TABLE [dbo].[Caracteristicas]
GO
/****** Object:  View [dbo].[view_client]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP VIEW [dbo].[view_client]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 21/11/2018 03:10:43 a. m. ******/
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[rfc] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_client]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_client] as select nombre,correo from cliente
GO
/****** Object:  Table [dbo].[Caracteristicas]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caracteristicas](
	[id_car] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NULL,
	[model] [varchar](50) NULL,
	[CPU] [varchar](50) NOT NULL,
	[RAM] [varchar](50) NOT NULL,
	[DD] [varchar](50) NOT NULL,
	[TV] [varchar](50) NULL,
	[serie] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_caract]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_caract] as 
select marca,cpu,ram from Caracteristicas
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[date_inicio] [date] NOT NULL,
	[date_fin] [date] NOT NULL,
	[total] [int] NOT NULL,
	[join_cliente] [int] NULL,
	[join_renter] [int] NULL,
	[join_equipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_venta]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_venta] as 
select date_inicio,date_fin,total from venta
GO
/****** Object:  Table [dbo].[Renter]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renter](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_renter]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_renter] as 
select nombre,correo from renter
GO
/****** Object:  Table [dbo].[Laptop]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop](
	[id_lap] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[join_Caract] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_lap]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_lap] as 
select estado,id_lap from laptop
GO
/****** Object:  View [dbo].[view_client_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_client_all]
as select * from cliente
GO
/****** Object:  View [dbo].[view_caract_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_caract_all] 
as select * from Caracteristicas
GO
/****** Object:  View [dbo].[view_venta_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_venta_all] 
as select * from venta
GO
/****** Object:  View [dbo].[view_renter_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_renter_all] 
as select * from renter
GO
/****** Object:  View [dbo].[view_lap_all]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_lap_all] 
as select * from laptop
GO
ALTER TABLE [dbo].[Laptop]  WITH CHECK ADD  CONSTRAINT [FK_Laptop_Caracteristicas] FOREIGN KEY([join_Caract])
REFERENCES [dbo].[Caracteristicas] ([id_car])
GO
ALTER TABLE [dbo].[Laptop] CHECK CONSTRAINT [FK_Laptop_Caracteristicas]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([join_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Laptop] FOREIGN KEY([join_equipo])
REFERENCES [dbo].[Laptop] ([id_lap])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Laptop]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Renter] FOREIGN KEY([join_renter])
REFERENCES [dbo].[Renter] ([id_user])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Renter]
GO
/****** Object:  StoredProcedure [dbo].[lapsAltoRendimiento]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lapsAltoRendimiento] AS
select id_car,marca,cpu from Caracteristicas where cpu like '%i5%'
GO
/****** Object:  StoredProcedure [dbo].[laptopsDañadas]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[laptopsDañadas] AS
select join_Caract,estado from laptop where estado = 'dañado'
GO
/****** Object:  StoredProcedure [dbo].[rentasMayores]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rentasMayores] AS
select id_venta,join_contrato,total from venta where total > 20000
GO
/****** Object:  StoredProcedure [dbo].[rentasMenores]    Script Date: 21/11/2018 03:10:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rentasMenores] AS
select id_venta,join_contrato,total from venta where total > 5000
GO
